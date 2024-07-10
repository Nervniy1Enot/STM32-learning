#include <stdint.h>
#include <stdbool.h>
#include "drivers\CMSIS\DeviceSupport\ST\STM32F10x\stm32f10x.h"

#define BUFFER_SIZE 4

void UART_sendstring(const char *str) {
    while (*str) {
        while (!(USART1->SR & USART_SR_TXE));
        USART1->DR = *str++;
    }
}

void brightness_message(const char buffer[], char color) {
    const char *blue_msg = "\r\nThe brightness of the blue LED is set to ";
    const char *green_msg = "\r\nThe brightness of the green LED is set to ";
    const char *both_msg = "\r\nThe brightness of both LEDs is set to ";

    char message[50];
    const char *pref; 
    char *msg_write = message; //указатель на буфер

    if (color == 'b') {
        pref = blue_msg;
    } else if (color == 'g') {
        pref = green_msg;
    } else {
        pref = both_msg;
    }

    while (*pref) {
        *msg_write++ = *pref++;
    }

    if (color == 'b' || color == 'g') {
        *msg_write++ = buffer[1];
        *msg_write++ = buffer[2];
    } 
    else {
        *msg_write++ = buffer[2];
        *msg_write++ = buffer[3];
    }
    
    *msg_write++ = ' ';
    *msg_write++ = '%';
    *msg_write++ = '\r';
    *msg_write++ = '\n';
    *msg_write = '\0';

    UART_sendstring(message);
}

void invalid_command_message(const char buffer[]) {
    const char *invalid_msg = "\r\nInvalid command ";

    char message[50];
    char *msg_write = message; //указатель на позицию

    while (*invalid_msg) {
        *msg_write++ = *invalid_msg++;
    }

    for (uint8_t i = 0; i < BUFFER_SIZE; i++) {
        if (buffer[i] != '\0') {
            *msg_write++ = buffer[i];
        }
    }

    *msg_write++ = '\r';
    *msg_write++ = '\n';
    *msg_write = '\0';

    UART_sendstring(message);
}

void info_message_helper(const char *inf_msg, uint8_t brightness) {
    char message[60]; 
    char *msg_write = message; 

    while (*inf_msg) {
        *msg_write++ = *inf_msg++;
    }

    *msg_write++ = '0' + (brightness / 10);
    *msg_write++ = '0' + (brightness % 10);
    *msg_write++ = '\r';
    *msg_write++ = '\n';
    *msg_write = '\0';

    UART_sendstring(message);
}

void info_message(const uint8_t b, const uint8_t g) {
    const char *blue_inf_msg = "\r\nBrightness of blue LED - ";
    const char *green_inf_msg = "Brightness of green LED - ";

    info_message_helper(blue_inf_msg, b);

    info_message_helper(green_inf_msg, g);
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
                
                if (buffer_index == 3 && buffer[1] >= '0' && buffer[1] <= '9' && buffer[2] >= '0' && buffer[2] <= '9') {
                    brightness = ((buffer[1] - '0') << 3) + ((buffer[1] - '0') << 1) + (buffer[2] - '0');

                    if (buffer[0] == 'b') {
                        TIM3->CCR3 = brightness;
                        b_brightness = brightness;
                        brightness_message(buffer, 'b');
                    } 
                    else if (buffer[0] == 'b') {
                        TIM3->CCR4 = brightness;
                        g_brightness = brightness;
                        brightness_message(buffer, 'g');
                    }
                    else {
                        invalid_command_message(buffer);
                    }

                } 

                else if (buffer_index == 4 && ((buffer[0] == 'g' && buffer[1] == 'b') || (buffer[0] == 'b' && buffer[1] == 'g')) 
                          && buffer[2] >= '0' && buffer[2] <= '9' && buffer[3] >= '0' && buffer[3] <= '9') {
                    brightness = ((buffer[2] - '0') << 3) + ((buffer[2] - '0') << 1) + (buffer[3] - '0');

                    TIM3->CCR3 = brightness;
                    TIM3->CCR4 = brightness;

                    b_brightness = brightness;
                    g_brightness = brightness;

                    brightness_message(buffer, 'c');
                }
                else if (buffer_index == 3 && buffer[0] == 'i' && buffer[1] == 'n' && buffer[2] == 'f') {

                    info_message(g_brightness, b_brightness);
                }
                else {
                    invalid_command_message(buffer);
                }

                buffer_index = 0; 
                
                for (int i = 0; i < BUFFER_SIZE; i++) {
                    prev_buffer[i] = buffer[i];
                }
                
                for (int i = 0; i < BUFFER_SIZE; i++) {
                    buffer[i] = ' ';
                };
            }

            else if (received_char == 127 || received_char == '\b') { //стирание символа
                if (buffer_index > 0) {
                    buffer_index--;
                }
            }

            else if (received_char == ' ') { 

                for (int i = 0; i < BUFFER_SIZE; i++) {
                    buffer[i] = prev_buffer[i];
                };

                buffer_index = 0;
                while (buffer_index < BUFFER_SIZE && buffer[buffer_index] != '\0') {
                    buffer_index++;
                }

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
    
