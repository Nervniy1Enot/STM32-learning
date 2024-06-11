#include <stdint.h>
#include <stdbool.h>
#include "stm32f10x.h"


#define STATE_1000ms_default 0
#define STATE_750ms 1
#define STATE_500ms 2
#define STATE_250ms 3
#define STATE_100ms 4

void delay(uint32_t ms, bool buttonPrevState, bool buttonState) {
    // TIM2->CR1 основная настройка таймера
    // TIM2->PSC предделитель таймера
    // TIM2->ARR авто перезагрузка таймера(модуль счета)
    // TIM2->SR регистр статуса 
    // TIM_SR_UIF флаг устанавливается когда таймер перезагружается


    // Включение тактирования для TIM2
    RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;
    
    TIM2->PSC = SystemCoreClock / (56*ms); // Предделитель для работы с периодом в миллисекундах  
    // базовая частота тактирования равна 24 МГц ???? на деле 56 Мгц

    // Установка периода
    //TIM2->ARR = ms;

    TIM2->DIER |= TIM_DIER_UIE; //  прерывание по обновлению, для паралельной работы  

    // Сброс флага обновления
    TIM2->SR &= ~TIM_SR_UIF; // гарантируем правильное детектирование следующего события обновления.

    // Включение счетчика TIM2
    TIM2->CR1 |= TIM_CR1_CEN;

    // Ожидание завершения задержки
    while (!(TIM2->SR & TIM_SR_UIF)) {
        // ожидаем
        if ((buttonPrevState == false) && (buttonState == true)) {
                    break;
            }
    }

    // Сброс флага обновления
    TIM2->SR &= ~TIM_SR_UIF;

    // Отключение таймера TIM2
    TIM2->CR1 &= ~TIM_CR1_CEN;

    // Выключение тактирования для TIM2
    RCC->APB1ENR &= ~RCC_APB1ENR_TIM2EN;
}


void flashing(uint32_t ms, bool buttonPrevState, bool buttonState) {
    GPIOC->BSRR = GPIO_BSRR_BS9|GPIO_BSRR_BR8;
    delay(ms, buttonPrevState, buttonState);
    GPIOC->BSRR = GPIO_BSRR_BS8|GPIO_BSRR_BR9;
    delay(ms, buttonPrevState, buttonState);
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
            case STATE_1000ms_default: //ждем нажатие
                if ((buttonPrevState == false) && (buttonState == true)) {
                    state = STATE_750ms;
                }
                else {
                    flashing(1000, buttonPrevState, buttonState);
                }
                buttonPrevState = buttonState;
            break; 
            case STATE_750ms: //ждем нажатие
                if ((buttonPrevState == false) && (buttonState == true)) {
                    state = STATE_500ms;
                }
                else {
                    flashing(750, buttonPrevState, buttonState); 
                }
                buttonPrevState = buttonState;
            break; 
            case STATE_500ms: //ждем нажатие
                if ((buttonPrevState == false) && (buttonState == true)) {
                    state = STATE_250ms;
                }
                else {
                    flashing(500, buttonPrevState, buttonState); 
                }
                buttonPrevState = buttonState;
            break;
            case STATE_250ms: //ждем нажатие
                if ((buttonPrevState == false) && (buttonState == true)) {
                    state = STATE_100ms;
                }
                else {
                    flashing(250, buttonPrevState, buttonState); 
                }
                buttonPrevState = buttonState;
            break;
            case STATE_100ms: //ждем нажатие
                if ((buttonPrevState == false) && (buttonState == true)) {
                    state = STATE_1000ms_default;
                }
                else {
                    flashing(100, buttonPrevState, buttonState); 
                }
                buttonPrevState = buttonState;
            break;
            default:
                state = STATE_1000ms_default;
            break;
        } 
    }
    
}

