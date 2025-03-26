sbit led at GPIOC_ODR.B13;

void ini_puertos(void);

void main()
{
  ini_puertos();
  
  while(1)
  {
    led = 0;
    Delay_ms(100);
    led = 1;
    Delay_ms(100);
    led = 0;
    Delay_ms(100);
    led = 1;
    Delay_ms(1500);
  }
}

void ini_puertos(void)
{
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
  led = 0;  // led on
}






