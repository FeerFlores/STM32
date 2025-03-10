sbit led at GPIOC_ODR.B13;

void main()
{
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
  
  while(1)
  {
    led = ~led;  // led on
    Delay_ms(500);
  }
}