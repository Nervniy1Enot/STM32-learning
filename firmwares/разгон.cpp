#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"


void delay(uint32_t speed) {
    for (uint32_t i=0;i<=speed;i++) {
        __NOP();
    }
}

int main() {


    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;

    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN; // enable clock for GPIO C ( check it on memory and bus architecture)
    // set pin 9 of GPIOC to output mode

    GPIOC->CRH |= GPIO_CRH_MODE9_1; 
    GPIOC->CRH &= ~GPIO_CRH_CNF9; 

    GPIOC->CRH |= GPIO_CRH_MODE8_1;
    GPIOC->CRH &= ~GPIO_CRH_CNF8;
    
    GPIOA->CRL |= GPIO_CRL_CNF0_0;
    

    while(1) {
        uint32_t speed = 20000000; 
        for (uint8_t i = 0;i<=8;i++) {
            speed /= 2;
            GPIOC->BSRR = GPIO_BSRR_BS9|GPIO_BSRR_BR8;
            delay(speed);
            GPIOC->BSRR = GPIO_BSRR_BS8|GPIO_BSRR_BR9;
            delay(speed);
        }
    }
    
}

