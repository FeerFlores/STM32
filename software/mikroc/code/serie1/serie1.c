void ini_puertos(void);
void ini_uarts(void);
void ini_timers(void);


void main()
{
  ini_puertos();
  ini_uarts();
  ini_timers();

  while(1);
}

void ini_puertos(void)
{
  GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_4 | _GPIO_PINMASK_5
     | _GPIO_PINMASK_6 | _GPIO_PINMASK_7,
     _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_UP);
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1
     | _GPIO_PINMASK_2 | _GPIO_PINMASK_3);
}

void ini_uarts(void)
{
  RCC_AHB1ENRbits.GPIOAEN = 1;  // no necesario en ini_puertos se activa
  GPIOA_MODERbits.MODER9 = 0b10;  // PA9 sera funcion alterna
  GPIOA_MODERbits.MODER10 = 0b10;  // PA10 sera funcion alterna
  GPIOA_AFRHbits.AFRH9 = 0b0111;  // PA9 es funcion alterna AF7
  GPIOA_AFRHbits.AFRH10 = 0b0111;  // PA10 es funcion alterna AF7
  GPIOA_PUPDRbits.PUPDR10 = 0b01;  // PA10 tendra res. pull-up

  RCC_APB2ENRbits.USART1EN = 1;  // se activa el reloj
  USART1_CR1bits.UE = 1;
  USART1_CR1bits.M = 0;  // modo 8 bits
  USART1_CR2bits.STOP = 0b00;  // 1 bit de paro
  USART1_BRR = (24ul << 4) + 7;
  USART1_CR1bits.TE = 1;
  USART1_CR1bits.RE = 1;
  USART1_CR1bits.RXNEIE = 1;  // se habilita la interrupcion por recepcion
  NVIC_IntEnable(IVT_INT_USART1);  // se incluye en el NVIC
}

void recibe8(void) iv IVT_INT_USART1 ics ICS_AUTO
{
  GPIOA_ODR = (USART1_DR >> 4)&0xf;
}

void ini_timers(void)
{
  RCC_APB2ENRbits.TIM10EN = 1;
  TIM10_CR1 = 0b0000000101;  // arpe = 0, cen = 1
  TIM10_ARR = 50000 - 1;  // contara 50000 cuentas cada vez
  TIM10_PSC = 2 - 1;  // pre = 2
  TIM10_CNT = 0;
  TIM10_DIERbits.UIE = 1;  // se habilita la interrupcion de TIM10
  NVIC_IntEnable(IVT_INT_TIM1_UP_TIM10);  // habilita en el NVIC TIM10
}

void tiempo10(void) iv IVT_INT_TIM1_UP_TIM10 ics ICS_AUTO
{
  if(TIM10_SRbits.UIF)
  {
    TIM10_SRbits.UIF = 0;
    USART1_DR = GPIOA_IDR;
  }
}