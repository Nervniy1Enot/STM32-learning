#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"


#define STATE_4sec_default 0
#define STATE_2sec 1
#define STATE_1sec 2
#define STATE_05sec 3
#define STATE_025sec 4

void delay(uint32_t ms) {
    // TIM2->CR1 основная настройка таймера
    // TIM2->PSC предделитель таймера
    // TIM2->ARR авто перезагрузка таймера(модуль счета)
    // TIM2->SR регистр статуса 
    // TIM_SR_UIF флаг устанавливается когда таймер перезагружается


    // Включение тактирования для TIM2
    RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;
    
    TIM2->PSC = SystemCoreClock / 24000; // Предделитель для работы с периодом в миллисекундах  
    // /1000 для того чтобы снизить саму частоту таймера до 24 кГц
    // базовая частота тактирования равна 24 МГц 

    // Установка периода
    TIM2->ARR = ms;

    //TIM2->DIER |= TIM_DIER_UIE; //  прерывание по обновлению, для паралельной работы  

    // Сброс флага обновления
    TIM2->SR &= ~TIM_SR_UIF; // гарантируем правильное детектирование следующего события обновления.

    // Включение счетчика TIM2
    TIM2->CR1 |= TIM_CR1_CEN;

    // Ожидание завершения задержки
    while (!(TIM2->SR & TIM_SR_UIF)) {
        // ожидаем
    }

    // Сброс флага обновления
    TIM2->SR &= ~TIM_SR_UIF;

    // Отключение таймера TIM2
    TIM2->CR1 &= ~TIM_CR1_CEN;

    // Выключение тактирования для TIM2
    RCC->APB1ENR &= ~RCC_APB1ENR_TIM2EN;
}


void flashing(uint32_t ms) {
    GPIOC->BSRR = GPIO_BSRR_BS9|GPIO_BSRR_BR8;
    delay(ms);
    GPIOC->BSRR = GPIO_BSRR_BS8|GPIO_BSRR_BR9;
    delay(ms);
}


int main() {

    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;

    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;

    GPIOC->CRH |= GPIO_CRH_MODE9_1; 
    GPIOC->CRH &= ~GPIO_CRH_CNF9; 

    GPIOC->CRH |= GPIO_CRH_MODE8_1;
    GPIOC->CRH &= ~GPIO_CRH_CNF8;
    
    GPIOA->CRL |= GPIO_CRL_CNF0_0;
    
    static unsigned char state = 0;

    while(1) {
        bool buttonState =(GPIOA->IDR & GPIO_IDR_IDR0);
        static bool buttonPrevState = 0;
        switch (state)
        {
            case STATE_4sec_default: //ждем нажатие
                if ((buttonPrevState == false) && (buttonState == true)) {
                    state = STATE_2sec;
                }
                else {
                    flashing(4000);
                }
                buttonPrevState = buttonState;
            break; 
            case STATE_2sec: //ждем нажатие
                if ((buttonPrevState == false) && (buttonState == true)) {
                    state = STATE_1sec;
                }
                else {
                    flashing(2000); 
                }
                buttonPrevState = buttonState;
            break; 
            case STATE_1sec: //ждем нажатие
                if ((buttonPrevState == false) && (buttonState == true)) {
                    state = STATE_05sec;
                }
                else {
                    flashing(1000); 
                }
                buttonPrevState = buttonState;
            break;
            case STATE_05sec: //ждем нажатие
                if ((buttonPrevState == false) && (buttonState == true)) {
                    state = STATE_025sec;
                }
                else {
                    flashing(500); 
                }
                buttonPrevState = buttonState;
            break;
            case STATE_025sec: //ждем нажатие
                if ((buttonPrevState == false) && (buttonState == true)) {
                    state = STATE_4sec_default;
                }
                else {
                    flashing(250); 
                }
                buttonPrevState = buttonState;
            break;
            default:
                state = STATE_4sec_default;
            break;
        } 
    }
    
}

