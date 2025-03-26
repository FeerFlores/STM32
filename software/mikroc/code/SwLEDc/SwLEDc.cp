#line 1 "C:/Trabajos ARM/6EM26/SwLEDc/SwLEDc.c"
sbit sw at GPIOA_IDR.B0;
sbit led at GPIOC_ODR.B13;

bit flagx;
unsigned char contx;

void ini_puertos(void)
{
 RCC_AHB1ENRbits.GPIOAEN = 1;
 GPIOA_MODERbits.MODER0 = 0b00;
 GPIOA_PUPDRbits.PUPDR0 = 0b01;

 RCC_AHB1ENRbits.GPIOCEN = 1;
 GPIOC_MODERbits.MODER13 = 0b01;
 GPIOC_OTYPERbits.OT13 = 0b0;
 GPIOC_OSPEEDRbits.OSPEEDR13 = 0b11;
 GPIOC_PUPDRbits.PUPDR13 = 0b00;
 led = 0;
}

void boton(void)
{
 if(flagx)
 {
 contx--;
 if(!contx)
 {
 contx = 10;
 if(sw)
 flagx = 0;
 }
 }
 else
 {
 if(!sw)
 {
 led = ~led;
 flagx = 1;
 contx = 10;
 }
 }
}



void main()
{
 ini_puertos();

 while(1)
 {
 boton();
 Delay_ms(1);
 }
}
