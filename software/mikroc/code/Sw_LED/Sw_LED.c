sbit sw at GPIOA_IDR.B0;
sbit led at GPIOA_ODR.B1;

void ini_puertos(void);

void main()
{
  ini_puertos();
  
  while(1)
  {
    Delay_ms(1);
    if(sw == 1)
      led = ~led;
  }
}

void ini_puertos(void)
{
  //GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_0);
  //No se uso pues necesito poner una resistencia a tierra externa
  GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, _GPIO_CFG_DIGITAL_INPUT
        | _GPIO_CFG_PULL_DOWN);
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1);
  led = 1;  // led off
}






