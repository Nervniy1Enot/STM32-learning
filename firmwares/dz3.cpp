#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"

int main() {

    //**** светодиоды ******//

    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;
    
    GPIOC->CRH |= GPIO_CRH_MODE9_1; 
    GPIOC->CRH &= ~GPIO_CRH_CNF9; 

    GPIOC->CRH |= GPIO_CRH_MODE8_1;
    GPIOC->CRH &= ~GPIO_CRH_CNF8;
    
    GPIOC->BSRR = GPIO_BSRR_BR9 | GPIO_BSRR_BS8;
    //______________________//

    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;
    GPIOA->CRL |= GPIO_CRL_CNF0_0;
    
    // Включение тактирования для таймера TIM2
    RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;

    // Настройка предделителя для таймера TIM2
    TIM2->PSC = SystemCoreClock / 2; // Предделитель для работы с периодом

    // Установка значения перезагрузки для таймера TIM2
    TIM2->ARR = 2048; // Модуль счета

    // Установка значения сравнения для канала 1 (CC1) в 1024
    TIM2->CCR1 = 1024;

    // Выбор режима ШИМ (OC1M) для канала 1
    TIM2->CCMR1 |= TIM_CCMR1_OC1M_1 | TIM_CCMR1_OC1M_2 | TIM_CCMR1_OC1PE;

    // Разрешение события сравнения для канала 1
    TIM2->CCER |= TIM_CCER_CC1E;

    TIM2->CR1 |= TIM_CR1_ARPE;
    // Включение таймера TIM2
    TIM2->CR1 |= TIM_CR1_CEN;

    uint8_t clk_sum = 0;
    const uint16_t arr_module[] = {2048, 4, 4096, 256}; // Модули счета
    const uint16_t arr_compare[] = {1024, 2, 2048, 128}; // Значения сравнения
    // Ожидание события сравнения

    bool buttonstate = 0;
    bool primed = 0;

    while (1) {
        
        buttonstate = (GPIOA->IDR & GPIO_IDR_IDR0);

        if (buttonstate && primed) {
            
            TIM2->CR1 &= ~TIM_CR1_CEN;

            clk_sum = (clk_sum + 1) % 4;
            
            TIM2->ARR = arr_module[clk_sum];
            TIM2->CCR1 = arr_compare[clk_sum];

            TIM2->EGR |= TIM_EGR_UG; //пушим из теневого
            
            TIM2->CR1 |= TIM_CR1_CEN;
            primed = 0;
        }
        else if (!buttonstate) {
            primed = 1;
        }

        if (TIM2->SR & TIM_SR_CC1IF) {
            // Действия при событии сравнения на канале 1
            GPIOC->ODR ^= GPIO_ODR_ODR9;
            GPIOC->ODR ^= GPIO_ODR_ODR8; // Инвертируем состояние светодиода на порту C, пин 9
            // Сброс флага события сравнения на канале 1
            TIM2->SR &= ~TIM_SR_CC1IF;
        }
    }
}