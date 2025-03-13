sbit led at GPIOC_ODR.B13;

void ini_puertos(void);
void ini_timers(void);
void leds(void);

unsigned int cont = 0;

void main()
{
  ini_puertos();
  ini_timers();

  while(1);
}

void ini_puertos(void)
{
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
  led = 0;  // led on
}

void ini_timers(void)
{
  RCC_APB1ENRbits.TIM5EN = 1;  // se habilita el reloj de TIM5
  TIM5_CR1 = 0b0010000101;  // arpe = 1, dir = 0, cen = 0
  TIM5_ARR = 100000 - 1;  // contara 100000 cuentas por interrupcion
  TIM5_PSC = 1 - 1;  // pre-escala = 1
  TIM5_CNT = -100;
  TIM5_DIERbits.UIE = 1;  // se habilita la interrupcion de TIM5
  NVIC_IntEnable(IVT_INT_TIM5);  // se agrega la Int. de TIM5 al NVIC
}

void tiempo5(void) iv IVT_INT_TIM5 ics ICS_AUTO
{
  // esto se repite cada 1 mS
  TIM5_SRbits.UIF = 0;
  leds();
}

void leds(void)
{
  cont++;
  if(cont == 100)
    led = 1;  // led off
  if(cont == 200)
    led = 0;  // led on
  if(cont == 300)
    led = 1;  // led off
  if(cont == 1800)
  {
    led = 0;  // led on
    cont = 0;
  }
}
















