#include <stdint.h>
#include <stdbool.h>
#include "drivers\CMSIS\DeviceSupport\ST\STM32F10x\stm32f10x.h"

#define BUFFER_SIZE 4

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

void UART_sendstring(const char *str) {
    while (*str) {
        while (!(USART1->SR & USART_SR_TXE));
        USART1->DR = *str++;
    }
}

void brightness_message(const char buffer[], char color) {
    const char *blue_msg = "\r\nThe brightness of the blue LED is set to ";
    const char *green_msg = "\r\nThe brightness of the green LED is set to ";
    const char *both_msg = "\r\nThe brightness of both LEDs is set to ";

    char message[50];
    const char *pref; 
    char *msg_write = message; //указатель на буфер

    if (color == 'b') {
        pref = blue_msg;
    } else if (color == 'g') {
        pref = green_msg;
    } else {
        pref = both_msg;
    }

    while (*pref) {
        *msg_write++ = *pref++;
    }

    if (color == 'b' || color == 'g') {
        *msg_write++ = buffer[1];
        *msg_write++ = buffer[2];
    } 
    else {
        *msg_write++ = buffer[2];
        *msg_write++ = buffer[3];
    }
    
    *msg_write++ = ' '; 
    *msg_write++ = '%';
    *msg_write++ = '\r';
    *msg_write++ = '\n';
    *msg_write = '\0';

    UART_sendstring(message);
}

void invalid_command_message(const char buffer[]) {
    const char *invalid_msg = "\r\nInvalid command ";

    char message[25];
    char *msg_write = message; //указатель на позицию

    while (*invalid_msg) {
        *msg_write++ = *invalid_msg++;
    }

    for (uint8_t i = 0; i < BUFFER_SIZE; i++) {
        if (buffer[i] != '\0') {
            *msg_write++ = buffer[i];
        }
    }

    *msg_write++ = '\r';
    *msg_write++ = '\n';
    *msg_write = '\0';

    UART_sendstring(message);
}

void info_message_helper(const char *inf_msg, uint8_t brightness) {
    char message[30]; 
    char *msg_write = message; 

    while (*inf_msg) {
        *msg_write++ = *inf_msg++;
    }

    *msg_write++ = '0' + (brightness / 10);
    *msg_write++ = '0' + (brightness % 10);
    *msg_write++ = '\r';
    *msg_write++ = '\n';
    *msg_write = '\0';

    UART_sendstring(message);
}

void info_message(const uint8_t b, const uint8_t g) {
    const char *blue_inf_msg = "\r\nBrightness of blue LED - ";
    const char *green_inf_msg = "Brightness of green LED - ";

    info_message_helper(blue_inf_msg, b);

    info_message_helper(green_inf_msg, g);
}

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


int main() {
    //------------------I2C----------------
    __disable_irq();
    i2c_init();
    ssd1315_init();
    strings_draw();
    //------------------UART----------------
    // Включаем тактирование для USART1 и GPIOA
    RCC->APB2ENR |= RCC_APB2ENR_USART1EN;  // USART1
    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;    // GPIOA

    // Настройка GPIO для USART1 Tx (PA9) и Rx (PA10) 
    GPIOA->CRH &= ~GPIO_CRH_CNF9;
    GPIOA->CRH |= GPIO_CRH_CNF9_1 | GPIO_CRH_MODE9;

    GPIOA->CRH &= ~GPIO_CRH_CNF10;
    GPIOA->CRH |= GPIO_CRH_CNF10_1;
    GPIOA->BSRR |= GPIO_BSRR_BS10;

    // Настройка USART1
    USART1->BRR = 2500; //9600 = 24МГц/(16*2500)
    USART1->CR1 = USART_CR1_UE | USART_CR1_TE | USART_CR1_RE; 
    //--------------------GPIO--------------
    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN; // Включаем тактирование для GPIOC
    GPIOC->CRH |= GPIO_CRH_MODE8;       // Настройка PC8 в режим выхода на 50 MHz
    GPIOC->CRH &= ~GPIO_CRH_CNF8;       // Сброс битов конфигурации
    GPIOC->CRH |= GPIO_CRH_CNF8_1;      // Альтернативная функция push-pull

    GPIOC->CRH |= GPIO_CRH_MODE9;       // Настройка PC9 в режим выхода на 50 MHz
    GPIOC->CRH &= ~GPIO_CRH_CNF9;       // Сброс битов конфигурации
    GPIOC->CRH |= GPIO_CRH_CNF9_1;      // Альтернативная функция push-pull

    //---------------------таймер------------
    RCC->APB1ENR |= RCC_APB1ENR_TIM3EN; // Включаем тактирование для TIM3
    RCC->APB2ENR |= RCC_APB2ENR_AFIOEN; // Включаем тактирование для AFIO
    AFIO->MAPR |= AFIO_MAPR_TIM3_REMAP; // Переназначаем пины для TIM3

    TIM3->PSC = 240;  // Предделитель
    TIM3->ARR = 100;  // Автоматическая перезагрузка

    // Выбор режима ШИМ для канала 3
    TIM3->CCMR2 |= TIM_CCMR2_OC3M_1 | TIM_CCMR2_OC3M_2;
    TIM3->CCMR2 |= TIM_CCMR2_OC4M_1 | TIM_CCMR2_OC4M_2;

    // Разрешение события сравнения для канала 3 и 4
    TIM3->CCER |= TIM_CCER_CC3E;
    TIM3->CCER |= TIM_CCER_CC4E;

    // Предзагрузка
    TIM3->CR1 |= TIM_CR1_ARPE;

    // Включение таймера
    TIM3->CR1 |= TIM_CR1_CEN;
    //--------------------------------------------------

    char buffer[BUFFER_SIZE] = {0}; 
    char prev_buffer[BUFFER_SIZE] = {0};
    uint8_t buffer_index = 0;
    char received_char;
    uint8_t brightness = 0;
    uint8_t g_brightness = 0;
    uint8_t b_brightness = 0;

    while (1) {

        if (USART1->SR & USART_SR_RXNE) {
            received_char = USART1->DR;

            while (!(USART1->SR & USART_SR_TXE));
            USART1->DR = received_char;
        
            if (received_char == '\r' || received_char == '\n') {
                buffer[buffer_index] = '\0';
                
                if (buffer_index == 3 && buffer[1] >= '0' && buffer[1] <= '9' && buffer[2] >= '0' && buffer[2] <= '9') {
                    brightness = ((buffer[1] - '0') << 3) + ((buffer[1] - '0') << 1) + (buffer[2] - '0');

                    if (buffer[0] == 'b') {
                        TIM3->CCR3 = brightness;
                        b_brightness = brightness;
                        brightness_message(buffer, 'b');
                        brightness_draw('b', buffer[1], buffer[2]);
                    } 
                    else if (buffer[0] == 'g') {
                        TIM3->CCR4 = brightness;
                        g_brightness = brightness;
                        brightness_message(buffer, 'g');
                        brightness_draw('g', buffer[1], buffer[2]);
                    }
                    else {
                        invalid_command_message(buffer);
                    }

                } 

                else if (buffer_index == 4 && ((buffer[0] == 'g' && buffer[1] == 'b') || (buffer[0] == 'b' && buffer[1] == 'g')) 
                          && buffer[2] >= '0' && buffer[2] <= '9' && buffer[3] >= '0' && buffer[3] <= '9') {
                    brightness = ((buffer[2] - '0') << 3) + ((buffer[2] - '0') << 1) + (buffer[3] - '0');

                    TIM3->CCR3 = brightness;
                    TIM3->CCR4 = brightness;

                    b_brightness = brightness;
                    g_brightness = brightness;

                    brightness_draw('b', buffer[2], buffer[3]);
                    brightness_draw('g', buffer[2], buffer[3]);

                    brightness_message(buffer, 'c');
                }
                else if (buffer_index == 3 && buffer[0] == 'i' && buffer[1] == 'n' && buffer[2] == 'f') {

                    info_message(g_brightness, b_brightness);
                }
                else {
                    invalid_command_message(buffer);
                }

                buffer_index = 0; 
                
                for (int i = 0; i < BUFFER_SIZE; i++) {
                    prev_buffer[i] = buffer[i];
                }
                
                for (int i = 0; i < BUFFER_SIZE; i++) {
                    buffer[i] = ' ';
                };
            }

            else if (received_char == 127 || received_char == '\b') { //стирание символа
                if (buffer_index > 0) {
                    buffer_index--;
                }
            }

            else if (received_char == ' ') { 

                for (int i = 0; i < BUFFER_SIZE; i++) {
                    buffer[i] = prev_buffer[i];
                };

                buffer_index = 0;
                while (buffer_index < BUFFER_SIZE && buffer[buffer_index] != '\0') {
                    buffer_index++;
                }

                UART_sendstring("\r");
                
                for (int i = 0; i < BUFFER_SIZE; i++) {
                    UART_sendstring(" ");
                }
                UART_sendstring("\r");

                UART_sendstring(buffer);
            }

            else {
                if (buffer_index < 5) {
                    buffer[buffer_index++] = received_char; 
                }
                else {
                    buffer_index = 0; 
                }
            }
        }
    }
}
    
