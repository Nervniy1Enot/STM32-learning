#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"

int main() {

    // initialize the clock for Port C

    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;

    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN; // enable clock for GPIO C ( check it on memory and bus architecture)
    // set pin 9 of GPIOC to output mode

    GPIOC->CRH |= GPIO_CRH_MODE9_1; // PC9 pin will be used as an Output at max speed = 50 MHz
    GPIOC->CRH &= ~GPIO_CRH_CNF9; 

    GPIOC->CRH |= GPIO_CRH_MODE8_1;
    GPIOC->CRH &= ~GPIO_CRH_CNF8;
    
    GPIOA->CRL |= GPIO_CRL_CNF0_0;
    
   


    volatile int i;
    while(1) {

    for(i=0;i<=100000;i++) {
        if  (GPIOA->IDR & GPIO_IDR_IDR0) {
            GPIOC->BSRR = GPIO_BSRR_BR9;
            GPIOC->BSRR = GPIO_BSRR_BS8;
        }

        else {
            GPIOC->BSRR = GPIO_BSRR_BR8;
            GPIOC->BSRR = GPIO_BSRR_BS9;
        }
    }
    
    }
}
