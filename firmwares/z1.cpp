#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"


#define STATE_0 0
#define STATE_1 1
#define STATE_2 2


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
    
    static unsigned char state = 0;

    //завести таймер, при нажатии кнопки чтобы менялась длительность импульса

    while(1)
    {
        bool buttonState =(GPIOA->IDR & GPIO_IDR_IDR0);
        static bool buttonPrevState = 0;
        switch (state)
        {
            case STATE_0: //ждем нажатие
                if ((buttonPrevState == false) && (buttonState == true)) {
                    state = STATE_1;
                }
                else {
                    state = STATE_0;
                }
                buttonPrevState = buttonState;
            break; //
            case STATE_1: //проигрываем мигание
            for (uint8_t i=0; i<=2;i++) {
                GPIOC->BSRR = GPIO_BSRR_BS9;
                delay();
                GPIOC->BSRR = GPIO_BSRR_BR9; 
                delay();
            }
                GPIOC->BSRR = GPIO_BSRR_BS8;
                delay();
                GPIOC->BSRR = GPIO_BSRR_BR8;
                delay(); 
                state = STATE_2;
            break;
            case STATE_2: //ждем отпускание клавиши
                if (buttonPrevState == buttonState) {
                    state = STATE_2;
                }
                else
                    state = STATE_0;
            break;
            default:
                state = STATE_0;
            break;
        } 
    }
}

