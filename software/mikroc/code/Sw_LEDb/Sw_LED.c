sbit sw at GPIOA_IDR.B0;
sbit led at GPIOA_ODR.B1;

void ini_puertos(void);
void boton(void);

bit flagx;
unsigned char contx;

void main()
{
  flagx = 0;
  ini_puertos();
  
  while(1)
  {
    boton();
    Delay_ms(1);
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

void boton(void)
{
  if(flagx == 1)
  {
    contx--;
    if(contx == 0)
    {
      contx = 10;
      if(sw == 0)
        flagx = 0;
    }
  }
  else
  {
    if(sw == 1)
    {
      led = ~led;
      flagx = 1;
      contx = 10;
    }
  }
}










