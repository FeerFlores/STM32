sbit sw at GPIOB_IDR.B0;
sbit boc at GPIOB_ODR.B1;

void ini_puertos(void);
void ini_timers(void);
void boton(void);

bit flagx, run;
unsigned char contx;

void main() 
{
  flagx = run = 0;
  
  ini_puertos();
  ini_timers();
  
  while(1);
}

void ini_puertos(void)
{
  GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0, _GPIO_CFG_DIGITAL_INPUT
        | _GPIO_CFG_PULL_UP);
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
  boc = 0;  // no sonido
}

void ini_timers(void)
{
  RCC_APB1ENRbits.TIM5EN = 1;  // se activa el reloj de TIM5
  TIM5_CR1 = 0b0000000101;  // arpe = 0, dir = 0, cen = 1
  TIM5_ARR = 113636 - 1;  // TIM5 contara 113636 cuentas
                          // por interrupcion
  TIM5_PSC = 1 - 1;  // pre-escala = 1
  TIM5_CNT = 0;
  TIM5_DIERbits.UIE = 1;  // se habilita la interrupcion de TIM5
  NVIC_IntEnable(IVT_INT_TIM5);
}

void boton(void)
{
  if(flagx)
  {
    contx--;
    if(!contx)
    {
      contx = 9;
      if(sw)
        flagx = 0;
    }
  }
  else
  {
    if(!sw)
    {
      run = ~run;
      flagx = 1;
      contx = 9;  // para aprox. 10 mS de teiempo antirebote
    }
  }
}

void tiempo5(void) iv IVT_INT_TIM5 ics ICS_AUTO
{
  // esto se repetira aprox. cada 1.136 mS
  TIM5_SRbits.UIF = 0;
  if(run)
    boc = ~boc;  // si sonido
  else
    boc = 0;  // no sonido
    
  boton();
}