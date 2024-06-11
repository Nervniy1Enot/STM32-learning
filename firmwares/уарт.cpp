#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"

int main() {

    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;    
    // Настройка альтернативной функции для пина PС8 (TIM3_CH3)
    GPIOC->CRH |= GPIO_CRH_MODE8; // OutMode 50MHz
    GPIOC->CRH &= ~GPIO_CRH_CNF8; //сброс битов
    GPIOC->CRH |= GPIO_CRH_CNF8_1; //  Altfunc

    // Настройка альтернативной функции для пина PС8 (TIM4_CH4)
    GPIOC->CRH |= GPIO_CRH_MODE9; // OutMode 50MHz
    GPIOC->CRH &= ~GPIO_CRH_CNF9; //сброс битов
    //GPIOC->CRH |= GPIO_CRH_CNF9_1; //  Altfunc

    /*--------uart-------------------*/
    RCC->APB2ENR |= RCC_APB2ENR_USART1EN;

    // настройка вывода PA9 (TX1) на режим альтернативной функции с активным выходом
    // Биты CNF = 10, ,биты MODE = X1
    GPIOA->CRH &= (~GPIO_CRH_CNF9_0);
    GPIOA->CRH |= (GPIO_CRH_CNF9_1 | GPIO_CRH_MODE9);

    // настройка вывода PA10 (RX1) на режим входа с подтягивающим резистором
    // Биты CNF = 10, ,биты MODE = 00, ODR = 1
    GPIOA->CRH &= (~GPIO_CRH_CNF10_0);
    GPIOA->CRH |= GPIO_CRH_CNF10_1;
    GPIOA->CRH &= (~(GPIO_CRH_MODE10));
    GPIOA->BSRR |= GPIO_ODR_ODR10;

    USART1->CR1 = USART_CR1_UE; // разрешаем работу USART1
    USART1->BRR = 7500;
    USART1->CR1 |= USART_CR1_TE | USART_CR1_RE|USART_CR1_RXNEIE; // разрешаем работу приемника и передатчика и прерываний по приему
    USART1->CR3 = 0;
    USART1->CR2 = 0;
    

    /*--------------------------------*/
    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;

    RCC->APB1ENR |= RCC_APB1ENR_TIM3EN;
    RCC->APB1ENR |= RCC_APB1ENR_TIM4EN;
    RCC->APB2ENR |= RCC_APB2ENR_AFIOEN;
    AFIO->MAPR |= AFIO_MAPR_TIM3_REMAP;
    AFIO->MAPR |= AFIO_MAPR_TIM4_REMAP;

    TIM3->PSC = 240;

    TIM3->ARR = 100;


    TIM3->CCR3 = 80;     

    // Выбор режима ШИМ для канала 3
    TIM3->CCMR2 |= TIM_CCMR2_OC3M_1 | TIM_CCMR2_OC3M_2;

    // Разрешение события сравнения для канала 3
    TIM3->CCER |= TIM_CCER_CC3E;

    //предзагрузка
    TIM3->CR1 |= TIM_CR1_ARPE;

    TIM3->CR1 |= TIM_CR1_CEN;

    while (1) {

        while ((USART1->SR & USART_SR_RXNE) == 0) {}
        uint8_t d = USART1->DR;

        while ((USART1->SR & USART_SR_TXE) == 0) {}
        USART1->DR = d;

    }
}  

/*void USART1_ReceiveString(char* buffer, size_t bufferSize) {
    size_t index = 0;
    while (index < bufferSize - 1) {
        while ((USART1->SR & USART_SR_RXNE) == 0) {} // Ожидание приема данных
        char received = USART1->DR; // Чтение символа
        if (received == ' ') break; // Окончание строки
        buffer[index++] = received;
    }
    buffer[index] = '\0'; // Завершение строки нулевым символом
}*/

//надо добавить условие по символам для второго светодиода работать через юарт