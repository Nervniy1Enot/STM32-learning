#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"

int main() {

    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN; //тактирование для светодиодов

    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN; //тактирование для кнопки

    //выбор режима для 9 пина 
    GPIOC->CRH |= GPIO_CRH_MODE9_1; 
    GPIOC->CRH &= ~GPIO_CRH_CNF9; 

    //выбор режима для 8 пина
    GPIOC->CRH |= GPIO_CRH_MODE8_1;
    GPIOC->CRH &= ~GPIO_CRH_CNF8;

    //выбор режима для кнопки
    GPIOA->CRL |= GPIO_CRL_CNF0_0;

    int i;

    while(1) {

    for(i=0;i<=100000;i++) {
        if  (GPIOA->IDR & GPIO_IDR_IDR0) {
            GPIOC->BSRR = GPIO_BSRR_BR9; //выключение 9 пина
            GPIOC->BSRR = GPIO_BSRR_BS8; //включение 8 пина
        }
        
        else {
            GPIOC->BSRR = GPIO_BSRR_BR8; //выключение 8 пина
            GPIOC->BSRR = GPIO_BSRR_BS9; //включение 9 пина
        }
    }
    
    }
}
