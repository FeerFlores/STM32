_main:
;nota440.c,11 :: 		void main()
;nota440.c,13 :: 		flagx = run = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_run+0)
MOVT	R0, #hi_addr(_run+0)
STR	R1, [R0, #0]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
STR	R1, [R0, #0]
;nota440.c,15 :: 		ini_puertos();
BL	_ini_puertos+0
;nota440.c,16 :: 		ini_timers();
BL	_ini_timers+0
;nota440.c,18 :: 		while(1);
L_main0:
IT	AL
BAL	L_main0
;nota440.c,19 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_ini_puertos:
;nota440.c,21 :: 		void ini_puertos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;nota440.c,24 :: 		| _GPIO_CFG_PULL_UP);
MOV	R2, #194
;nota440.c,23 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0, _GPIO_CFG_DIGITAL_INPUT
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;nota440.c,24 :: 		| _GPIO_CFG_PULL_UP);
BL	_GPIO_Config+0
;nota440.c,25 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;nota440.c,26 :: 		boc = 0;  // no sonido
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nota440.c,27 :: 		}
L_end_ini_puertos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_puertos
_ini_timers:
;nota440.c,29 :: 		void ini_timers(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;nota440.c,31 :: 		RCC_APB1ENRbits.TIM5EN = 1;  // se activa el reloj de TIM5
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB1ENRbits+0)]
;nota440.c,32 :: 		TIM5_CR1 = 0b0000000101;  // arpe = 0, dir = 0, cen = 1
MOVS	R1, #5
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;nota440.c,33 :: 		TIM5_ARR = 113636 - 1;  // TIM5 contara 113636 cuentas
MOVW	R1, #48099
MOVT	R1, #1
MOVW	R0, #lo_addr(TIM5_ARR+0)
MOVT	R0, #hi_addr(TIM5_ARR+0)
STR	R1, [R0, #0]
;nota440.c,35 :: 		TIM5_PSC = 1 - 1;  // pre-escala = 1
MOVW	R1, #0
MOVW	R0, #lo_addr(TIM5_PSC+0)
MOVT	R0, #hi_addr(TIM5_PSC+0)
STR	R1, [R0, #0]
;nota440.c,36 :: 		TIM5_CNT = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM5_CNT+0)
MOVT	R0, #hi_addr(TIM5_CNT+0)
STR	R1, [R0, #0]
;nota440.c,37 :: 		TIM5_DIERbits.UIE = 1;  // se habilita la interrupcion de TIM5
MOVW	R0, #lo_addr(TIM5_DIERbits+0)
MOVT	R0, #hi_addr(TIM5_DIERbits+0)
_SX	[R0, ByteOffset(TIM5_DIERbits+0)]
;nota440.c,38 :: 		NVIC_IntEnable(IVT_INT_TIM5);
MOVW	R0, #66
BL	_NVIC_IntEnable+0
;nota440.c,39 :: 		}
L_end_ini_timers:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_timers
_boton:
;nota440.c,41 :: 		void boton(void)
;nota440.c,43 :: 		if(flagx)
MOVW	R1, #lo_addr(_flagx+0)
MOVT	R1, #hi_addr(_flagx+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_boton2
;nota440.c,45 :: 		contx--;
MOVW	R1, #lo_addr(_contx+0)
MOVT	R1, #hi_addr(_contx+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;nota440.c,46 :: 		if(!contx)
CMP	R0, #0
IT	NE
BNE	L_boton3
;nota440.c,48 :: 		contx = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_contx+0)
MOVT	R0, #hi_addr(_contx+0)
STRB	R1, [R0, #0]
;nota440.c,49 :: 		if(sw)
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_boton4
;nota440.c,50 :: 		flagx = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
STR	R1, [R0, #0]
L_boton4:
;nota440.c,51 :: 		}
L_boton3:
;nota440.c,52 :: 		}
IT	AL
BAL	L_boton5
L_boton2:
;nota440.c,55 :: 		if(!sw)
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_boton6
;nota440.c,57 :: 		run = ~run;
MOVW	R1, #lo_addr(_run+0)
MOVT	R1, #hi_addr(_run+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;nota440.c,58 :: 		flagx = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
STR	R1, [R0, #0]
;nota440.c,59 :: 		contx = 9;  // para aprox. 10 mS de teiempo antirebote
MOVS	R1, #9
MOVW	R0, #lo_addr(_contx+0)
MOVT	R0, #hi_addr(_contx+0)
STRB	R1, [R0, #0]
;nota440.c,60 :: 		}
L_boton6:
;nota440.c,61 :: 		}
L_boton5:
;nota440.c,62 :: 		}
L_end_boton:
BX	LR
; end of _boton
_tiempo5:
;nota440.c,64 :: 		void tiempo5(void) iv IVT_INT_TIM5 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;nota440.c,67 :: 		TIM5_SRbits.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_SRbits+0)
MOVT	R0, #hi_addr(TIM5_SRbits+0)
_SX	[R0, ByteOffset(TIM5_SRbits+0)]
;nota440.c,68 :: 		if(run)
MOVW	R1, #lo_addr(_run+0)
MOVT	R1, #hi_addr(_run+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_tiempo57
;nota440.c,69 :: 		boc = ~boc;  // si sonido
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_LX	[R1, ByteOffset(GPIOB_ODR+0)]
EOR	R0, R0, #1
UXTB	R0, R0
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
IT	AL
BAL	L_tiempo58
L_tiempo57:
;nota440.c,71 :: 		boc = 0;  // no sonido
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
L_tiempo58:
;nota440.c,73 :: 		boton();
BL	_boton+0
;nota440.c,74 :: 		}
L_end_tiempo5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _tiempo5
