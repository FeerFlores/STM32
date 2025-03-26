#line 1 "C:/Trabajos ARM/6EM26/serie2/serie1.c"
void ini_uarts(void);

unsigned int temp;

void main()
{
 ini_uarts();

 while(1);
}

void ini_uarts(void)
{
 RCC_AHB1ENRbits.GPIOAEN = 1;
 GPIOA_MODERbits.MODER9 = 0b10;
 GPIOA_MODERbits.MODER10 = 0b10;
 GPIOA_AFRHbits.AFRH9 = 0b0111;
 GPIOA_AFRHbits.AFRH10 = 0b0111;
 GPIOA_PUPDRbits.PUPDR10 = 0b01;

 RCC_APB2ENRbits.USART1EN = 1;
 USART1_CR1bits.UE = 1;
 USART1_CR1bits.M = 0;
 USART1_CR2bits.STOP = 0b00;
 USART1_BRR = (24ul << 4) + 7;
 USART1_CR1bits.TE = 1;
 USART1_CR1bits.RE = 1;
 USART1_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_USART1);
}

void recibe8(void) iv IVT_INT_USART1 ics ICS_AUTO
{
 temp = USART1_DR;
 USART1_DR = temp;
}
