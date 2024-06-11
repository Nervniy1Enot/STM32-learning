#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"


void delay() {
    for (uint32_t i=0;i<=1000000;i++) {
        __NOP();
    }
}

int main() {


    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;

    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN; // enable clock for GPIO C ( check it on memory and bus architecture)
    // set pin 9 of GPIOC to output mode

    GPIOC->CRH |= GPIO_CRH_MODE9_1; // PC9 pin will be used as an Output at max speed = 50 MHz
    GPIOC->CRH &= ~GPIO_CRH_CNF9; 

    GPIOC->CRH |= GPIO_CRH_MODE8_1;
    GPIOC->CRH &= ~GPIO_CRH_CNF8;
    
    GPIOA->CRL |= GPIO_CRL_CNF0_0;
    

    while(1) {
        while(GPIOA->IDR & GPIO_IDR_IDR0) {
            for (uint8_t i=0; i<=2;i++) {
                GPIOC->BSRR = GPIO_BSRR_BS9;
                delay();
                GPIOC->BSRR = GPIO_BSRR_BR9;
                delay();
            }
            GPIOC->BSRR = GPIO_BSRR_BS8;
            delay();
            GPIOC->BSRR = GPIO_BSRR_BR8;
            break;
        } 
    }
    
}

