#line 1 "C:/Trabajos ARM/6EM26/nota440/nota440.c"
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
 boc = 0;
}

void ini_timers(void)
{
 RCC_APB1ENRbits.TIM5EN = 1;
 TIM5_CR1 = 0b0000000101;
 TIM5_ARR = 113636 - 1;

 TIM5_PSC = 1 - 1;
 TIM5_CNT = 0;
 TIM5_DIERbits.UIE = 1;
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
 contx = 9;
 }
 }
}

void tiempo5(void) iv IVT_INT_TIM5 ics ICS_AUTO
{

 TIM5_SRbits.UIF = 0;
 if(run)
 boc = ~boc;
 else
 boc = 0;

 boton();
}
