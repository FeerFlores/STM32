#line 1 "C:/Trabajos ARM/6EM26/UnLEDT5/UnLEDT5.c"
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
 led = 0;
}

void ini_timers(void)
{
 RCC_APB1ENRbits.TIM5EN = 1;
 TIM5_CR1 = 0b0010000101;
 TIM5_ARR = 100000 - 1;
 TIM5_PSC = 1 - 1;
 TIM5_CNT = -100;
 TIM5_DIERbits.UIE = 1;
 NVIC_IntEnable(IVT_INT_TIM5);
}

void tiempo5(void) iv IVT_INT_TIM5 ics ICS_AUTO
{

 TIM5_SRbits.UIF = 0;
 leds();
}

void leds(void)
{
 cont++;
 if(cont == 100)
 led = 1;
 if(cont == 200)
 led = 0;
 if(cont == 300)
 led = 1;
 if(cont == 1800)
 {
 led = 0;
 cont = 0;
 }
}
