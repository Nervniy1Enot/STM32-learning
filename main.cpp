#include <stdint.h>
#include <stdbool.h>
#include "drivers\CMSIS\DeviceSupport\ST\STM32F10x\stm32f10x.h"


void UART_sendstring(char str[60]) {
    uint8_t i = 0;
    while (str[i] != '\0') {
        while (!(USART1->SR & USART_SR_TXE));
        USART1->DR = str[i++];
    }
    
}

int main() {
    //------------------UART----------------
    // Включаем тактирование для USART1 и GPIOA
    RCC->APB2ENR |= RCC_APB2ENR_USART1EN;  // USART1
    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;    // GPIOA

    // Настройка GPIO для USART1 Tx (PA9) и Rx (PA10)
    GPIOA->CRH &= ~GPIO_CRH_CNF9;
    GPIOA->CRH |= GPIO_CRH_CNF9_1 | GPIO_CRH_MODE9;

    GPIOA->CRH &= ~GPIO_CRH_CNF10;
    GPIOA->CRH |= GPIO_CRH_CNF10_1;
    GPIOA->BSRR |= GPIO_BSRR_BS10;

    // Настройка USART1
    USART1->BRR = 2500; // Настройка скорости передачи: 9600 при тактовой частоте 24 MHz
    USART1->CR1 = USART_CR1_UE | USART_CR1_TE | USART_CR1_RE; // Включить USART, передатчик и приемник

    //--------------------GPIO--------------
    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN; // Включаем тактирование для GPIOC
    GPIOC->CRH |= GPIO_CRH_MODE8;       // Настройка PC8 в режим выхода на 50 MHz
    GPIOC->CRH &= ~GPIO_CRH_CNF8;       // Сброс битов конфигурации
    GPIOC->CRH |= GPIO_CRH_CNF8_1;      // Альтернативная функция push-pull

    GPIOC->CRH |= GPIO_CRH_MODE9;       // Настройка PC9 в режим выхода на 50 MHz
    GPIOC->CRH &= ~GPIO_CRH_CNF9;       // Сброс битов конфигурации
    GPIOC->CRH |= GPIO_CRH_CNF9_1;      // Альтернативная функция push-pull

    //---------------------таймер------------
    RCC->APB1ENR |= RCC_APB1ENR_TIM3EN; // Включаем тактирование для TIM3
    RCC->APB2ENR |= RCC_APB2ENR_AFIOEN; // Включаем тактирование для AFIO
    AFIO->MAPR |= AFIO_MAPR_TIM3_REMAP; // Переназначаем пины для TIM3

    TIM3->PSC = 240;  // Предделитель
    TIM3->ARR = 100;  // Автоматическая перезагрузка

    // Выбор режима ШИМ для канала 3
    TIM3->CCMR2 |= TIM_CCMR2_OC3M_1 | TIM_CCMR2_OC3M_2;
    TIM3->CCMR2 |= TIM_CCMR2_OC4M_1 | TIM_CCMR2_OC4M_2;

    // Разрешение события сравнения для канала 3 и 4
    TIM3->CCER |= TIM_CCER_CC3E;
    TIM3->CCER |= TIM_CCER_CC4E;

    // Предзагрузка
    TIM3->CR1 |= TIM_CR1_ARPE;

    // Включение таймера
    TIM3->CR1 |= TIM_CR1_CEN;
    //--------------------------------------------------

    char buffer[15]; 
    uint8_t buffer_index = 0;

    while (1) {

        if (USART1->SR & USART_SR_RXNE) {
            char received_char = USART1->DR;

            while (!(USART1->SR & USART_SR_TXE));
            USART1->DR = received_char;

            if (received_char == '\r' || received_char == '\n') {
                buffer[buffer_index] = '\0';
                
                if (buffer_index == 3 && buffer[0] == 'b' && buffer[1] >= '0' && buffer[1] <= '9' && buffer[2] >= '0' && buffer[2] <= '9') {
                    uint8_t brightness = ((buffer[1] - '0') << 3) + ((buffer[1] - '0') << 1) + (buffer[2] - '0');

                    TIM3->CCR3 = brightness;
                    
                    char message[60] = "\r\nThe brightness of the blue LED is set to ";
                    message[43] = buffer[1];
                    message[44] = buffer[2];
                    message[45] = ' ';
                    message[46] = '%';
                    message[47] = '\r';
                    message[48] = '\n';
                    message[49] = '\0';
                    UART_sendstring(message);

                } 
                
                else if (buffer_index == 3 && buffer[0] == 'g' && buffer[1] >= '0' && buffer[1] <= '9' && buffer[2] >= '0' && buffer[2] <= '9') {
                    uint8_t brightness = ((buffer[1] - '0') << 3) + ((buffer[1] - '0') << 1) + (buffer[2] - '0');

                    TIM3->CCR4 = brightness; 

                    char message[60] = "\r\nThe brightness of the green LED is set to ";
                    message[44] = buffer[1];
                    message[45] = buffer[2];
                    message[46] = ' ';
                    message[47] = '%';
                    message[48] = '\r';
                    message[49] = '\n';
                    message[50] = '\0';
                    UART_sendstring(message);
                }

                else if (buffer_index == 4 && ((buffer[0] == 'g' && buffer[1] == 'b') || (buffer[0] == 'b' && buffer[1] == 'g')) 
                          && buffer[2] >= '0' && buffer[2] <= '9' && buffer[3] >= '0' && buffer[3] <= '9') {
                    uint8_t brightness = ((buffer[2] - '0') << 3) + ((buffer[2] - '0') << 1) + (buffer[3] - '0');

                    TIM3->CCR3 = brightness;
                    TIM3->CCR4 = brightness;

                    char message[60] = "\r\nThe brightness of both LEDs is set to ";
                    message[40] = buffer[2];
                    message[41] = buffer[3];
                    message[42] = ' ';
                    message[43] = '%';
                    message[44] = '\r';
                    message[45] = '\n';
                    message[46] = '\0';
                    UART_sendstring(message);
                }
                else {
                    char message[60] = "\r\nInvalid command";
                    message[18] = buffer[0];
                    message[19] = buffer[1];
                    message[20] = buffer[2];
                    message[21] = buffer[3];
                    message[22] = '\r';
                    message[23] = '\n';
                    message[24] = '\0';;
                    UART_sendstring(message);
                }

                buffer_index = 0; 
                
                buffer[buffer_index] = ' ';
            }
            else if (received_char == '\b') { //удаление символов
                if (buffer_index > 0) {
                    buffer_index--;
                }
            }
            
            else {
                if (buffer_index < 4) {
                    buffer[buffer_index++] = received_char;
                }
                else {
                    buffer_index = 0;
                }
            }
        }
    }
}
    
