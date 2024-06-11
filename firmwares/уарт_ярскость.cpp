#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"

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

    char buffer[3] = {0};
    uint8_t buffer_index = 0;

    while (1) {

        if (USART1->SR & USART_SR_RXNE) {
            char received_char = USART1->DR;

            while (!(USART1->SR & USART_SR_TXE));
            USART1->DR = received_char;

            if (received_char == 'b' || buffer_index > 0 || received_char == 'g') {
                buffer[buffer_index++] = received_char;

                if (buffer_index == 3) {
                    // Проверка на правильность команды 'bXX'
                    if (buffer[0] == 'b' && buffer[1] >= '0' && buffer[1] <= '9' && buffer[2] >= '0' && buffer[2] <= '9') {
                        uint8_t brightness = (buffer[1] - '0') * 10 + (buffer[2] - '0');
                        TIM3->CCR3 = brightness;
                        
                    }
                    else if (buffer[0] == 'g' && buffer[1] >= '0' && buffer[1] <= '9' && buffer[2] >= '0' && buffer[2] <= '9') {
                        uint8_t brightness = (buffer[1] - '0') * 10 + (buffer[2] - '0');
                        TIM3->CCR4 = brightness;
                    }
                    buffer_index = 0;
                }
            }
        }
    }
}
    
