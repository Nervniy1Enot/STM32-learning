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
    
    uint8_t state;

    while(1)
    {
        switch (state)
        {
            case 0: //ждем нажатие
                if (GPIOA->IDR & GPIO_IDR_IDR0) {
                    state = 1;
                }
                else 
                    state = 0;
            break;
            case 1: //проигрываем мигание лд3 1 раз
                if (GPIOA->IDR & GPIO_IDR_IDR0) {
                    GPIOC->BSRR = GPIO_BSRR_BS9;
                    delay();
                    GPIOC->BSRR = GPIO_BSRR_BR9; 
                    delay();
                    state = 2;
                }
                else
                    state = 0;

            break;
            case 2:  //проигрываем мигание лд3 2 раз
                if (GPIOA->IDR & GPIO_IDR_IDR0) {
                    GPIOC->BSRR = GPIO_BSRR_BS9;
                    delay();
                    GPIOC->BSRR = GPIO_BSRR_BR9; 
                    delay();
                    state = 3;
                }
                else
                    state = 0;
            break;
            case 3: //проигрываем мигание лд3 3 раз
                if (GPIOA->IDR & GPIO_IDR_IDR0) {
                    GPIOC->BSRR = GPIO_BSRR_BS9;
                    delay();
                    GPIOC->BSRR = GPIO_BSRR_BR9;
                    delay(); 
                    state = 4;
                }
                else
                    state = 0;
            break;
            case 4: //проигрываем мигание лд4 1 раз
                if (GPIOA->IDR & GPIO_IDR_IDR0) {
                    GPIOC->BSRR = GPIO_BSRR_BS8;
                    delay();
                    GPIOC->BSRR = GPIO_BSRR_BR8;
                    delay(); 
                    state = 5;
                }
                else
                    state = 0;
            break;
            case 5: //ждем отпускание клавиши
                if (GPIOA->IDR & GPIO_IDR_IDR0) {
                    state = 5;
                }
                else
                    state = 0;
            break;
            default:
                state = 0;
            break;
        } 
    }
}

