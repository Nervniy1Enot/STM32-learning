#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"

int main() {

    // Включаем тактирование для USART1 и GPIOA
    RCC->APB2ENR |= RCC_APB2ENR_USART1EN;  // USART1
    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;    // GPIOA
    
    // Настройка GPIO для USART1 Tx (PA9) и Rx (PA10)
    GPIOA->CRH &= ~GPIO_CRH_CNF9;          // Сброс конфигурации для PA9
    GPIOA->CRH |= GPIO_CRH_CNF9_1 | GPIO_CRH_MODE9;  // Альтернативная функция push-pull, 50 MHz
    
    GPIOA->CRH &= ~GPIO_CRH_CNF10;         // Сброс конфигурации для PA10
    GPIOA->CRH |= GPIO_CRH_CNF10_1;        // Вход с подтягивающим резистором
    GPIOA->BSRR |= GPIO_BSRR_BS10;         // Включить подтягивающий резистор на PA10

    // Настройка USART1
    USART1->BRR = 2500; // Настройка скорости передачи: 9600 при тактовой частоте 36 MHz (36000000 / 9600)
    USART1->CR1 = USART_CR1_UE | USART_CR1_TE | USART_CR1_RE; // Включить USART, передатчик и приемник

    while (1) {
        // Проверка флага RXNE, чтобы убедиться, что данные получены
        if (USART1->SR & USART_SR_RXNE) {
            while (!(USART1->SR & USART_SR_RXNE)); // Ожидание приема данных
            char received_char = USART1->DR;   // Чтение полученного символа
            while (!(USART1->SR & USART_SR_TXE));  // Ожидание готовности передатчика
            USART1->DR = received_char;                        // Передача символа 
        }
    }
}
