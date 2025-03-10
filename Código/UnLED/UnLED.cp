#line 1 "C:/Trabajos ARM/6EM26/UnLED/UnLED.c"
sbit led at GPIOC_ODR.B13;

void main()
{
 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);

 while(1)
 {
 led = ~led;
 Delay_ms(500);
 }
}
