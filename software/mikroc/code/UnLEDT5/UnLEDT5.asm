_main:
;UnLEDT5.c,9 :: 		void main()
;UnLEDT5.c,11 :: 		ini_puertos();
BL	_ini_puertos+0
;UnLEDT5.c,12 :: 		ini_timers();
BL	_ini_timers+0
;UnLEDT5.c,14 :: 		while(1);
L_main0:
IT	AL
BAL	L_main0
;UnLEDT5.c,15 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_ini_puertos:
;UnLEDT5.c,17 :: 		void ini_puertos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;UnLEDT5.c,19 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;UnLEDT5.c,20 :: 		led = 0;  // led on
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;UnLEDT5.c,21 :: 		}
L_end_ini_puertos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_puertos
_ini_timers:
;UnLEDT5.c,23 :: 		void ini_timers(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;UnLEDT5.c,25 :: 		RCC_APB1ENRbits.TIM5EN = 1;  // se habilita el reloj de TIM5
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB1ENRbits+0)]
;UnLEDT5.c,26 :: 		TIM5_CR1 = 0b0010000101;  // arpe = 1, dir = 0, cen = 0
MOVS	R1, #133
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;UnLEDT5.c,27 :: 		TIM5_ARR = 100000 - 1;  // contara 100000 cuentas por interrupcion
MOVW	R1, #34463
MOVT	R1, #1
MOVW	R0, #lo_addr(TIM5_ARR+0)
MOVT	R0, #hi_addr(TIM5_ARR+0)
STR	R1, [R0, #0]
;UnLEDT5.c,28 :: 		TIM5_PSC = 1 - 1;  // pre-escala = 1
MOVW	R1, #0
MOVW	R0, #lo_addr(TIM5_PSC+0)
MOVT	R0, #hi_addr(TIM5_PSC+0)
STR	R1, [R0, #0]
;UnLEDT5.c,29 :: 		TIM5_CNT = -100;
MVN	R1, #99
MOVW	R0, #lo_addr(TIM5_CNT+0)
MOVT	R0, #hi_addr(TIM5_CNT+0)
STR	R1, [R0, #0]
;UnLEDT5.c,30 :: 		TIM5_DIERbits.UIE = 1;  // se habilita la interrupcion de TIM5
MOVW	R0, #lo_addr(TIM5_DIERbits+0)
MOVT	R0, #hi_addr(TIM5_DIERbits+0)
_SX	[R0, ByteOffset(TIM5_DIERbits+0)]
;UnLEDT5.c,31 :: 		NVIC_IntEnable(IVT_INT_TIM5);  // se agrega la Int. de TIM5 al NVIC
MOVW	R0, #66
BL	_NVIC_IntEnable+0
;UnLEDT5.c,32 :: 		}
L_end_ini_timers:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_timers
_tiempo5:
;UnLEDT5.c,34 :: 		void tiempo5(void) iv IVT_INT_TIM5 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;UnLEDT5.c,37 :: 		TIM5_SRbits.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_SRbits+0)
MOVT	R0, #hi_addr(TIM5_SRbits+0)
_SX	[R0, ByteOffset(TIM5_SRbits+0)]
;UnLEDT5.c,38 :: 		leds();
BL	_leds+0
;UnLEDT5.c,39 :: 		}
L_end_tiempo5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _tiempo5
_leds:
;UnLEDT5.c,41 :: 		void leds(void)
;UnLEDT5.c,43 :: 		cont++;
MOVW	R1, #lo_addr(_cont+0)
MOVT	R1, #hi_addr(_cont+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [R1, #0]
;UnLEDT5.c,44 :: 		if(cont == 100)
CMP	R0, #100
IT	NE
BNE	L_leds2
;UnLEDT5.c,45 :: 		led = 1;  // led off
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
L_leds2:
;UnLEDT5.c,46 :: 		if(cont == 200)
MOVW	R0, #lo_addr(_cont+0)
MOVT	R0, #hi_addr(_cont+0)
LDRH	R0, [R0, #0]
CMP	R0, #200
IT	NE
BNE	L_leds3
;UnLEDT5.c,47 :: 		led = 0;  // led on
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
L_leds3:
;UnLEDT5.c,48 :: 		if(cont == 300)
MOVW	R0, #lo_addr(_cont+0)
MOVT	R0, #hi_addr(_cont+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	NE
BNE	L_leds4
;UnLEDT5.c,49 :: 		led = 1;  // led off
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
L_leds4:
;UnLEDT5.c,50 :: 		if(cont == 1800)
MOVW	R0, #lo_addr(_cont+0)
MOVT	R0, #hi_addr(_cont+0)
LDRH	R0, [R0, #0]
CMP	R0, #1800
IT	NE
BNE	L_leds5
;UnLEDT5.c,52 :: 		led = 0;  // led on
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;UnLEDT5.c,53 :: 		cont = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_cont+0)
MOVT	R0, #hi_addr(_cont+0)
STRH	R1, [R0, #0]
;UnLEDT5.c,54 :: 		}
L_leds5:
;UnLEDT5.c,55 :: 		}
L_end_leds:
BX	LR
; end of _leds
