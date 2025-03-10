#line 1 "C:/Trabajos ARM/6EM26/LCD1/LCD1.c"
sbit rs at GPIOA_ODR.B1;
sbit e at GPIOA_ODR.B2;
sbit DB4 at GPIOA_ODR.B3;
sbit DB5 at GPIOA_ODR.B4;
sbit DB6 at GPIOA_ODR.B5;
sbit DB7 at GPIOA_ODR.B6;

void ini_lcd(void);
void comando8(unsigned char num);
void comando(unsigned char num);
void dato(unsigned char num);
void bus(unsigned char num);

void main()
{
 ini_lcd();

 comando(0x86);
 dato('H');
 dato('o');
 dato('l');
 dato('a');

 comando(0xc6);
 dato('M');
 dato('u');
 dato('n');
 dato('d');
 dato('o');

 while(1);
}

void ini_lcd(void)
{
 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1
 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 |_GPIO_PINMASK_4
 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6);

 rs = e = 0;

 Delay_ms(15);
 comando8(0x38);
 Delay_us(4100);
 comando8(0x38);
 Delay_us(100);
 comando8(0x38);
 comando8(0x28);
 comando(0x28);
 comando(0b110);
 comando(0b1100);
 comando(1);
}

void comando8(unsigned char num)
{
 rs = 0;
 bus(num >> 4);
 e = 1;
 Delay_us(1);
 e = 0;

 if(num < 3)
 Delay_us(1642);
 else
 Delay_us(40);
}

void comando(unsigned char num)
{
 rs = 0;

 bus(num >> 4);
 e = 1;
 Delay_us(1);
 e = 0;

 bus(num);
 e = 1;
 Delay_us(1);
 e = 0;

 if(num < 4)
 Delay_us(1642);
 else
 Delay_us(40);
}

void dato(unsigned char num)
{
 rs = 1;

 bus(num >> 4);
 e = 1;
 Delay_us(1);
 e = 0;

 bus(num);
 e = 1;
 Delay_us(1);
 e = 0;

 Delay_us(40);
}

void bus(unsigned char num)
{
 DB7 = num.B3;
 DB6 = num.B2;
 DB5 = num.B1;
 DB4 = num.B0;
}
