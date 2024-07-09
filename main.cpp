#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "drivers\CMSIS\DeviceSupport\ST\STM32F10x\stm32f10x.h"

#define BUFFER_SIZE 4

void UART_sendstring(const char *str) {
    while (*str) {
        while (!(USART1->SR & USART_SR_TXE));
        USART1->DR = *str++;
    }
}

void brightness_message_b(const char buffer[]) {
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

void brightness_message_g(const char buffer[]) {
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

void brightness_message_bg(const char buffer[]) {
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

void invalid_command_message(const char buffer[]) {
    char message[60] = "\r\nInvalid command ";
    uint8_t index = 18;

    for (int i = 0; i < 4; i++) {
        if (buffer[i] != '\0') {
            message[index++] = buffer[i];
        }
    }

    message[index++] = '\r';
    message[index++] = '\n';
    message[index] = '\0';

    UART_sendstring(message);
}

void info_message(const uint8_t b, const uint8_t g) {
    char message[60];
    strcpy(message, "\r\nBrightness of blue LED - ");
    uint8_t index = 27;
    
    message[index++] = '0' + (b / 10);
    message[index++] = '0' + (b % 10);
    message[index++] = '\r';
    message[index++] = '\n';
    message[index] = '\0';

    UART_sendstring(message);

    strcpy(message, "Brightness of green LED - ");
    index = 26;
    
    message[index++] = '0' + (g / 10);
    message[index++] = '0' + (g % 10);
    message[index++] = '\r';
    message[index++] = '\n';
    message[index] = '\0';

    UART_sendstring(message);
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
    USART1->BRR = 2500; //9600 = 24МГц/(16*2500)
    USART1->CR1 = USART_CR1_UE | USART_CR1_TE | USART_CR1_RE; 
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

    char buffer[BUFFER_SIZE] = {0}; 
    char prev_buffer[BUFFER_SIZE] = {0};
    uint8_t buffer_index = 0;
    char received_char;
    uint8_t brightness = 0;
    uint8_t g_brightness = 0;
    uint8_t b_brightness = 0;

    while (1) {

        if (USART1->SR & USART_SR_RXNE) {
            received_char = USART1->DR;

            while (!(USART1->SR & USART_SR_TXE));
            USART1->DR = received_char;
        
            if (received_char == '\r' || received_char == '\n') {
                buffer[buffer_index] = '\0';
                
                if (buffer_index == 3 && buffer[0] == 'b' && buffer[1] >= '0' && buffer[1] <= '9' && buffer[2] >= '0' && buffer[2] <= '9') {
                    brightness = ((buffer[1] - '0') << 3) + ((buffer[1] - '0') << 1) + (buffer[2] - '0');

                    TIM3->CCR3 = brightness; //голубой

                    b_brightness = brightness;
                    
                    brightness_message_b(buffer);

                } 
                
                else if (buffer_index == 3 && buffer[0] == 'g' && buffer[1] >= '0' && buffer[1] <= '9' && buffer[2] >= '0' && buffer[2] <= '9') {
                    brightness = ((buffer[1] - '0') << 3) + ((buffer[1] - '0') << 1) + (buffer[2] - '0');

                    TIM3->CCR4 = brightness; //зеленый

                    g_brightness = brightness;

                    brightness_message_g(buffer);
                }

                else if (buffer_index == 4 && ((buffer[0] == 'g' && buffer[1] == 'b') || (buffer[0] == 'b' && buffer[1] == 'g')) 
                          && buffer[2] >= '0' && buffer[2] <= '9' && buffer[3] >= '0' && buffer[3] <= '9') {
                    brightness = ((buffer[2] - '0') << 3) + ((buffer[2] - '0') << 1) + (buffer[3] - '0');

                    TIM3->CCR3 = brightness;
                    TIM3->CCR4 = brightness;

                    b_brightness = brightness;
                    g_brightness = brightness;

                    brightness_message_bg(buffer);
                }
                else if (buffer_index == 3 && buffer[0] == 'i' && buffer[1] == 'n' && buffer[2] == 'f') {

                    info_message(g_brightness, b_brightness);
                }
                else {
                    invalid_command_message(buffer);
                }

                strncpy(prev_buffer, buffer, BUFFER_SIZE);

                buffer_index = 0; 
                
                memset(buffer, ' ', sizeof(buffer));
            }

            else if (received_char == 127 || received_char == '\b') { //стирание символа
                if (buffer_index > 0) {
                    buffer_index--;
                }
            }

            else if (received_char == ' ') { 
                strncpy(buffer, prev_buffer, BUFFER_SIZE);
                buffer_index = strlen(buffer);

                UART_sendstring("\r");
                for (int i = 0; i < BUFFER_SIZE; i++) {
                    UART_sendstring(" ");
                }
                UART_sendstring("\r");

                UART_sendstring(buffer);
            }

            else {
                if (buffer_index < 5) {
                    buffer[buffer_index++] = received_char; 
                }
                else {
                    buffer_index = 0; 
                }
            }
        }
    }
}
    
