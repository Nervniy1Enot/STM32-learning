#include <stdint.h>
#include <stdbool.h>

#include "drivers\CMSIS\DeviceSupport\ST\STM32F10x\stm32f10x.h"

#define I2C_MODE_I2C                     0x00000000U

#define CANVAS_SIZE 1024  // bytes
#define CANVAS_WIDTH 16

#define COMMAND 1
#define DATA 0

const uint8_t font6x8[10][6] = {
    {0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E}, // 0
    {0x00, 0x00, 0x42, 0x7F, 0x40, 0x00}, // 1
    {0x00, 0x42, 0x61, 0x51, 0x49, 0x46}, // 2
    {0x00, 0x21, 0x41, 0x45, 0x4B, 0x31}, // 3
    {0x00, 0x18, 0x14, 0x12, 0x7F, 0x10}, // 4
    {0x00, 0x27, 0x45, 0x45, 0x45, 0x39}, // 5
    {0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30}, // 6
    {0x00, 0x01, 0x71, 0x09, 0x05, 0x03}, // 7
    {0x00, 0x36, 0x49, 0x49, 0x49, 0x36}, // 8
    {0x00, 0x06, 0x49, 0x49, 0x29, 0x1E}, // 9
};

static void i2c_init() { 
    uint32_t tmpreg;
     RCC->APB2ENR |= RCC_APB2ENR_AFIOEN;
    tmpreg = RCC->APB2ENR & RCC_APB2ENR_AFIOEN;
    RCC->APB2ENR |= RCC_APB2ENR_IOPBEN;

    // Настройка PB8 и PB9 в режим альтернативной функции Open-Drain
    SET_BIT(GPIOB->CRH, GPIO_CRH_CNF9_1 | GPIO_CRH_CNF8_1 | GPIO_CRH_CNF9_0 | GPIO_CRH_CNF8_0 |
		GPIO_CRH_MODE9_1 | GPIO_CRH_MODE8_1 | GPIO_CRH_MODE9_0 | GPIO_CRH_MODE8_0);


    RCC->APB1ENR |= RCC_APB1ENR_I2C1EN;

    tmpreg = RCC->APB1ENR & RCC_APB1ENR_I2C1EN;

	I2C1->CR1 &= ~I2C_CR1_PE;
    
    //ClockSpeed
    MODIFY_REG(I2C1->CR2, I2C_CR2_FREQ, 32); //обнуление и запись для перефирийной шины 
    MODIFY_REG(I2C1->TRISE, I2C_TRISE_TRISE, 32 + 1); //установка времени нарастания фронта
    MODIFY_REG(I2C1->CCR, (I2C_CCR_FS | I2C_CCR_DUTY | I2C_CCR_CCR), 180); // Thigh = Tlow = 180 * (1/32) = 5 mcs => f = 100 kHz

    I2C1->CR1 |= I2C_CR1_PE;

    MODIFY_REG(I2C1->OAR2, I2C_OAR2_ADD2, 0);

    AFIO->MAPR |= AFIO_MAPR_I2C1_REMAP;


}



void send_byte(bool type, uint8_t bytes, uint8_t lenght){

     uint8_t tmp = 0;

     GPIOC->BSRR = GPIO_BSRR_BS9;
     GPIOC->BSRR = GPIO_BSRR_BS8;

     while (I2C1->SR2 & I2C_SR2_BUSY) {
     }

     I2C1->CR1 |= I2C_CR1_START;

     while(!(I2C1->SR1 & I2C_SR1_SB)){
     }   

     
     GPIOC->BSRR = GPIO_BSRR_BR9;

     I2C1->DR = 0b01111000; //78

     while(!(I2C1->SR1 & I2C_SR1_ADDR)){} 

     I2C1->SR2;

     GPIOC->BSRR = GPIO_BSRR_BR8;

     while (!(I2C1->SR1 & I2C_SR1_TXE)) {
     }

     I2C1->DR = (type)? 0x00 : 0x40; // 0 данные, 1 команда 

     while (!(I2C1->SR1 & I2C_SR1_BTF)) {
     }

     while (!(I2C1->SR1 & I2C_SR1_TXE)) {
     }

     for (uint8_t i = 0; i < lenght; i++) {
		I2C1->DR = bytes;
		while((I2C1->SR1 & I2C_SR1_TXE) == 0);
	}


     while (!(I2C1->SR1 & I2C_SR1_BTF)) {
     }

     I2C1->CR1 |= I2C_CR1_STOP;

}


// Функция для отправки команды на дисплей
void send_command(uint8_t command) {
    send_byte(COMMAND, command, 1);
}


// Функция для отрисовки одного символа
/*void draw_char(uint8_t row, uint8_t col, char c) {
    // Определяем индекс символа в массиве шрифта
    uint8_t index;
    if (c >= '0' && c <= '9') {
        index = c - '0' + 8; // Смещение для цифр
    } else if (c >= 'A' && c <= 'Z') {
        if (c == 'G') index = 0;
        else if (c == 'E') index = 2;
        else if (c == 'N') index = 3;
        else if (c == 'B') index = 4;
        else if (c == 'L') index = 5;
        else if (c == 'U') index = 6;
        else return; // Если символ не поддерживается, ничего не делать
    } else if (c == '-') {
        index = 7;
    } else {
        return; // Если символ не поддерживается, ничего не делать
    }

    set_cursor(row, col);
    send_data(font6x8[index], 6);
    send_data((uint8_t[]){0x00}, 1); // Пустой столбец между символами
}*/

// Функция для отрисовки строки
/*void draw_string(uint8_t row, uint8_t col, const char* str) {
    while (*str) {
        draw_char(row, col, *str++);
        col += 7; // 6 столбцов символа + 1 столбец между символами
    }
}*/

void strings_draw(){ 
     send_byte(1, 0xB1, 1); //строка от B0 до B7

     send_byte(1, 0x00, 1); //столбец от 00 до
     send_byte(1, 0x10, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x3E, 1);                       //0
     send_byte(0, 0x51, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x45, 1);
     send_byte(0, 0x3E, 1);
     
     send_byte(0, 0x00, 1);
     send_byte(0, 0x3E, 1);                       //0
     send_byte(0, 0x51, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x45, 1);
     send_byte(0, 0x3E, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x23, 1);                       //%
     send_byte(0, 0x13, 1);
     send_byte(0, 0x08, 1);
     send_byte(0, 0x64, 1);
     send_byte(0, 0x62, 1);

     send_byte(0, 0x00, 6);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x08, 5);                       //-

     send_byte(0, 0x00, 6);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x3E, 1);                       //g
     send_byte(0, 0x41, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x7A, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x7F, 1);
     send_byte(0, 0x09, 1);                       //r
     send_byte(0, 0x19, 1);
     send_byte(0, 0x29, 1);
     send_byte(0, 0x46, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x7F, 1);
     send_byte(0, 0x49, 1);                       //e
     send_byte(0, 0x49, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x41, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x7F, 1);
     send_byte(0, 0x49, 1);                       //e
     send_byte(0, 0x49, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x41, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x7F, 1);
     send_byte(0, 0x04, 1);                       //n
     send_byte(0, 0x08, 1);
     send_byte(0, 0x10, 1);
     send_byte(0, 0x7F, 1);

     send_byte(1, 0xB3, 1); //строка от B0 до B7

     send_byte(1, 0x00, 1); //столбец от 00 до
     send_byte(1, 0x10, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x3E, 1);                       // 0
     send_byte(0, 0x51, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x45, 1);
     send_byte(0, 0x3E, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x3E, 1);                       // 0
     send_byte(0, 0x51, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x45, 1);
     send_byte(0, 0x3E, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x23, 1);                       // %
     send_byte(0, 0x13, 1);
     send_byte(0, 0x08, 1);
     send_byte(0, 0x64, 1);
     send_byte(0, 0x62, 1);

     send_byte(0, 0x00, 6); 

     send_byte(0, 0x00, 1);
     send_byte(0, 0x08, 5);                       // -

     send_byte(0, 0x00, 6); // Пробел

     send_byte(0, 0x00, 1);
     send_byte(0, 0x7F, 1);                       // B
     send_byte(0, 0x49, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x36, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x7F, 1);                       // L
     send_byte(0, 0x40, 1);
     send_byte(0, 0x40, 1);
     send_byte(0, 0x40, 1);
     send_byte(0, 0x40, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x3F, 1);                       // U
     send_byte(0, 0x40, 1);
     send_byte(0, 0x40, 1);
     send_byte(0, 0x40, 1);
     send_byte(0, 0x3F, 1);

     send_byte(0, 0x00, 1);
     send_byte(0, 0x7F, 1);                       // E
     send_byte(0, 0x49, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x49, 1);
     send_byte(0, 0x41, 1);
}

void brightness_draw(const char color, const char units, const char dec) {
     
     if (color == 'g') {
          send_byte(1, 0xB1, 1); //строка от B0 до B7
     }
     else if (color == 'b') {
          send_byte(1, 0xB3, 1); //строка от B0 до B7
     }

     send_byte(1, 0x00, 1); //столбец от 00 до
     send_byte(1, 0x10, 1);
     
     send_byte(1, 0x00, 12);

     if (color == 'g') {
          send_byte(1, 0xB1, 1); //строка от B0 до B7
     }
     else if (color == 'b') {
          send_byte(1, 0xB3, 1); //строка от B0 до B7
     }

     send_byte(1, 0x00, 1); //столбец от 00 до
     send_byte(1, 0x10, 1);


     uint8_t index = units - '0';
     for (uint8_t i = 0; i < 6; i++) {
          send_byte(0, font6x8[index][i], 1);
     }

     index = dec - '0';
     for (uint8_t i = 0; i < 6; i++) {
          send_byte(0, font6x8[index][i], 1);
     }
}


void ssd1315_init(){ 

     send_byte(1, 0xAE, 1);           // Display OFF
     send_byte(1, 0x8D, 1);
     send_byte(1, 0x14, 1);
     send_byte(1, 0xAF, 1);

     
     for (uint8_t i = 0; i <= 7; i++) {
          send_byte(1, 0xB0 + i, 1);
          send_byte(0, 0x00, 128);
     }

     /*ssd1315_send_cmd_d1(addr2, 0x20, 0x00);  // Set memory addressing mode
     ssd1315_send_cmd_d1(addr2, 0xA8, 0x3F);  // Set multiplex ratio
     ssd1315_send_cmd_d1(addr2, 0xD3, 0x00);  // Set display offset
     ssd1315_send_cmd_d1(addr2, 0x40, 0x00);  // Set display strat line

     ssd1315_send_cmd(addr2, 0xA1);           // Set segment remap
     ssd1315_send_cmd(addr2, 0xC8);           // Set COM scan direction
     ssd1315_send_cmd_d1(addr2, 0xD9, 0xF1);  // Set precharge period
     ssd1315_send_cmd_d1(addr2, 0xDB, 0x40);  // Set COM select voltage

     ssd1315_send_cmd_d1(addr2, 0xDA, 0x12);  // Set COM pins
     ssd1315_send_cmd_d1(addr2, 0x81, 0x7F);  // Set contrast control
     ssd1315_send_cmd(addr2, 0xA4);           // Display RAM
     ssd1315_send_cmd(addr2, 0xA6);           // No value inversion
     ssd1315_send_cmd_d1(addr2, 0xD5, 0x80);  // Display Clock ration/Osc. Freq.

     ssd1315_send_cmd_d1(addr2, 0x8D, 0x14);  // Charge pump setting
     ssd1315_send_cmd(addr2, 0xAF);           // Display ON*/
} 


int main(void) {

     RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;

    GPIOC->CRH |= GPIO_CRH_MODE9_1; 
    GPIOC->CRH &= ~GPIO_CRH_CNF9; 
    GPIOC->CRH |= GPIO_CRH_MODE8_1; 
    GPIOC->CRH &= ~GPIO_CRH_CNF8;

    /*draw_char(0xB1, 0, 'B');
    draw_char(0xB1, 1, 'L');
    draw_char(0xB1, 2, 'U');
    draw_char(0xB1, 3, 'E');
    draw_char(0xB1, 4, ' ');
    draw_char(0xB1, 5, '-');
    draw_char(0xB1, 6, ' ');
    draw_char(0xB1, 7, '0');
    draw_char(0xB1, 8, '0');

    // Отрисовка строки "GREEN - 99" на строке 0xB3
    draw_char(0xB3, 0, 'G');
    draw_char(0xB3, 1, 'R');
    draw_char(0xB3, 2, 'E');
    draw_char(0xB3, 3, 'E');
    draw_char(0xB3, 4, 'N');
    draw_char(0xB3, 5, ' ');
    draw_char(0xB3, 6, '-');
    draw_char(0xB3, 7, ' ');
    draw_char(0xB3, 8, '9');
    draw_char(0xB3, 9, '9');*/

     __disable_irq();
     i2c_init();
     ssd1315_init();
     strings_draw();
     brightness_draw('g','2', '9');
     brightness_draw('b','5', '2');
     /*ssd1315_put_buf_on_canvas(image_1, 16, 64);*/

    /* ssd1315_send_canvas(0b01111000);*/

}