void ini_uarts(void);

unsigned int temp;

void main()
{
  ini_uarts();

  while(1);
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
  temp = USART1_DR;
  USART1_DR = temp;
}

