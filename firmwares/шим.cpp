#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"

int main() {

    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;    
    // Настройка альтернативной функции для пина PС8 (TIM3_CH3)
    GPIOC->CRH |= GPIO_CRH_MODE8; // OutMode 50MHz
    GPIOC->CRH &= ~GPIO_CRH_CNF8; //сброс битов
    GPIOC->CRH |= GPIO_CRH_CNF8_1; //  Altfunc


    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;

    RCC->APB1ENR |= RCC_APB1ENR_TIM3EN;
    RCC->APB2ENR |= RCC_APB2ENR_AFIOEN;
    AFIO->MAPR |= AFIO_MAPR_TIM3_REMAP;

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
    
    bool button_state = false;
    bool sign = true;
    uint16_t brightness = 80;
    
    while (1) {
        button_state = GPIOA->IDR & GPIO_IDR_IDR0;

        if (button_state) {
            if (sign) {
                GPIOC->BSRR = GPIO_BSRR_BS9;
                brightness = brightness + 2;
                TIM3->CCR3 = brightness;
                if (brightness == 100)
                {
                    sign = !sign;
                }
            }
            else if (!sign) {
                GPIOC->BSRR = GPIO_BSRR_BR9;
                brightness = brightness - 2;
                TIM3->CCR3 = brightness;
                if (brightness == 0)
                {
                    sign = !sign;
                }
            } //добавить разгон яркости от длительности нажатия

            for (uint32_t i = 0; i < 1000000; ++i);
        }
    }
}  
