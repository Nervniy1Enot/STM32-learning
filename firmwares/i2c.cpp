#include "stm32f10x.h"

#define I2C_MODE_I2C                     0x00000000U

void I2C1_Init(void) {
    uint32_t tmpreg;
    // Включение тактирования I2C и GPIO
    RCC->APB2ENR |= RCC_APB2ENR_AFIOEN;
    tmpreg = RCC->APB2ENR & RCC_APB2ENR_AFIOEN;
    RCC->APB2ENR |= RCC_APB2ENR_IOPBEN;

    // Настройка PB8 и PB9 в режим альтернативной функции Open-Dr ain
    SET_BIT(GPIOB->CRH, GPIO_CRH_CNF9_1 | GPIO_CRH_CNF8_1 | GPIO_CRH_CNF9_0 | GPIO_CRH_CNF8_0 |
		GPIO_CRH_MODE9_1 | GPIO_CRH_MODE8_1 | GPIO_CRH_MODE9_0);

    RCC->APB1ENR |= RCC_APB1ENR_I2C1EN;

    tmpreg = RCC->APB1ENR & RCC_APB1ENR_I2C1EN;

	I2C1->CR1 &= ~I2C_CR1_PE;
    
    //ClockSpeed
    MODIFY_REG(I2C1->CR2, I2C_CR2_FREQ, 36); //обнуление и запись для перефирийной шины
    MODIFY_REG(I2C1->TRISE, I2C_TRISE_TRISE, 36 + 1); //установка времени нарастания фронта
    MODIFY_REG(I2C1->CCR, (I2C_CCR_FS | I2C_CCR_DUTY | I2C_CCR_CCR), 180); // Thigh = Tlow = 180 * (1/36) = 5 mcs => f = 100 kHz
    //Configure I2C1 peripheral mode with parameter : I2C
    MODIFY_REG(I2C1->CR1, I2C_CR1_SMBUS | I2C_CR1_SMBTYPE | I2C_CR1_ENARP, I2C_MODE_I2C);
    //Enable I2C peripheral
    I2C1->CR1 |= I2C_CR1_PE;
    //TypeAcknowledge
    MODIFY_REG(I2C1->CR1, I2C_CR1_ACK, I2C_CR1_ACK);
    //Set the 7bits Own Address2
    MODIFY_REG(I2C1->OAR2, I2C_OAR2_ADD2, 0);

    AFIO->MAPR |= AFIO_MAPR_I2C1_REMAP;
}
