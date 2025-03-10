_main:
;serie1.c,6 :: 		void main()
;serie1.c,8 :: 		ini_puertos();
BL	_ini_puertos+0
;serie1.c,9 :: 		ini_uarts();
BL	_ini_uarts+0
;serie1.c,10 :: 		ini_timers();
BL	_ini_timers+0
;serie1.c,12 :: 		while(1);
L_main0:
IT	AL
BAL	L_main0
;serie1.c,13 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_ini_puertos:
;serie1.c,15 :: 		void ini_puertos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;serie1.c,19 :: 		_GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_UP);
MOV	R2, #194
;serie1.c,18 :: 		| _GPIO_PINMASK_6 | _GPIO_PINMASK_7,
MOVW	R1, #240
;serie1.c,17 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_4 | _GPIO_PINMASK_5
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;serie1.c,19 :: 		_GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_UP);
BL	_GPIO_Config+0
;serie1.c,21 :: 		| _GPIO_PINMASK_2 | _GPIO_PINMASK_3);
MOVW	R1, #15
;serie1.c,20 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;serie1.c,21 :: 		| _GPIO_PINMASK_2 | _GPIO_PINMASK_3);
BL	_GPIO_Digital_Output+0
;serie1.c,22 :: 		}
L_end_ini_puertos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_puertos
_ini_uarts:
;serie1.c,24 :: 		void ini_uarts(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;serie1.c,26 :: 		RCC_AHB1ENRbits.GPIOAEN = 1;  // no necesario en ini_puertos se activa
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(RCC_AHB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_AHB1ENRbits+0)
_SX	[R0, ByteOffset(RCC_AHB1ENRbits+0)]
;serie1.c,27 :: 		GPIOA_MODERbits.MODER9 = 0b10;  // PA9 sera funcion alterna
MOVS	R2, #2
MOVW	R1, #lo_addr(GPIOA_MODERbits+0)
MOVT	R1, #hi_addr(GPIOA_MODERbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #18, #2
STR	R0, [R1, #0]
;serie1.c,28 :: 		GPIOA_MODERbits.MODER10 = 0b10;  // PA10 sera funcion alterna
MOVS	R2, #2
MOVW	R1, #lo_addr(GPIOA_MODERbits+0)
MOVT	R1, #hi_addr(GPIOA_MODERbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #20, #2
STR	R0, [R1, #0]
;serie1.c,29 :: 		GPIOA_AFRHbits.AFRH9 = 0b0111;  // PA9 es funcion alterna AF7
MOVS	R2, #7
MOVW	R1, #lo_addr(GPIOA_AFRHbits+0)
MOVT	R1, #hi_addr(GPIOA_AFRHbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #4, #4
STRB	R0, [R1, #0]
;serie1.c,30 :: 		GPIOA_AFRHbits.AFRH10 = 0b0111;  // PA10 es funcion alterna AF7
MOVS	R2, #7
MOVW	R1, #lo_addr(GPIOA_AFRHbits+0)
MOVT	R1, #hi_addr(GPIOA_AFRHbits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #8, #4
STRH	R0, [R1, #0]
;serie1.c,31 :: 		GPIOA_PUPDRbits.PUPDR10 = 0b01;  // PA10 tendra res. pull-up
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOA_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOA_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #20, #2
STR	R0, [R1, #0]
;serie1.c,33 :: 		RCC_APB2ENRbits.USART1EN = 1;  // se activa el reloj
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;serie1.c,34 :: 		USART1_CR1bits.UE = 1;
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;serie1.c,35 :: 		USART1_CR1bits.M = 0;  // modo 8 bits
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;serie1.c,36 :: 		USART1_CR2bits.STOP = 0b00;  // 1 bit de paro
MOVS	R2, #0
MOVW	R1, #lo_addr(USART1_CR2bits+0)
MOVT	R1, #hi_addr(USART1_CR2bits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #12, #2
STRH	R0, [R1, #0]
;serie1.c,37 :: 		USART1_BRR = (24ul << 4) + 7;
MOVW	R1, #391
MOVT	R1, #0
MOVW	R0, #lo_addr(USART1_BRR+0)
MOVT	R0, #hi_addr(USART1_BRR+0)
STR	R1, [R0, #0]
;serie1.c,38 :: 		USART1_CR1bits.TE = 1;
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;serie1.c,39 :: 		USART1_CR1bits.RE = 1;
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;serie1.c,40 :: 		USART1_CR1bits.RXNEIE = 1;  // se habilita la interrupcion por recepcion
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;serie1.c,41 :: 		NVIC_IntEnable(IVT_INT_USART1);  // se incluye en el NVIC
MOVW	R0, #53
BL	_NVIC_IntEnable+0
;serie1.c,42 :: 		}
L_end_ini_uarts:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_uarts
_recibe8:
;serie1.c,44 :: 		void recibe8(void) iv IVT_INT_USART1 ics ICS_AUTO
;serie1.c,46 :: 		GPIOA_ODR = (USART1_DR >> 4)&0xf;
MOVW	R0, #lo_addr(USART1_DR+0)
MOVT	R0, #hi_addr(USART1_DR+0)
LDR	R0, [R0, #0]
LSRS	R0, R0, #4
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;serie1.c,47 :: 		}
L_end_recibe8:
BX	LR
; end of _recibe8
_ini_timers:
;serie1.c,49 :: 		void ini_timers(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;serie1.c,51 :: 		RCC_APB2ENRbits.TIM10EN = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;serie1.c,52 :: 		TIM10_CR1 = 0b0000000101;  // arpe = 0, cen = 1
MOVS	R1, #5
MOVW	R0, #lo_addr(TIM10_CR1+0)
MOVT	R0, #hi_addr(TIM10_CR1+0)
STR	R1, [R0, #0]
;serie1.c,53 :: 		TIM10_ARR = 50000 - 1;  // contara 50000 cuentas cada vez
MOVW	R1, #49999
MOVW	R0, #lo_addr(TIM10_ARR+0)
MOVT	R0, #hi_addr(TIM10_ARR+0)
STR	R1, [R0, #0]
;serie1.c,54 :: 		TIM10_PSC = 2 - 1;  // pre = 2
MOVW	R1, #1
MOVW	R0, #lo_addr(TIM10_PSC+0)
MOVT	R0, #hi_addr(TIM10_PSC+0)
STR	R1, [R0, #0]
;serie1.c,55 :: 		TIM10_CNT = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM10_CNT+0)
MOVT	R0, #hi_addr(TIM10_CNT+0)
STR	R1, [R0, #0]
;serie1.c,56 :: 		TIM10_DIERbits.UIE = 1;  // se habilita la interrupcion de TIM10
MOVW	R0, #lo_addr(TIM10_DIERbits+0)
MOVT	R0, #hi_addr(TIM10_DIERbits+0)
_SX	[R0, ByteOffset(TIM10_DIERbits+0)]
;serie1.c,57 :: 		NVIC_IntEnable(IVT_INT_TIM1_UP_TIM10);  // habilita en el NVIC TIM10
MOVW	R0, #41
BL	_NVIC_IntEnable+0
;serie1.c,58 :: 		}
L_end_ini_timers:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_timers
_tiempo10:
;serie1.c,60 :: 		void tiempo10(void) iv IVT_INT_TIM1_UP_TIM10 ics ICS_AUTO
;serie1.c,62 :: 		if(TIM10_SRbits.UIF)
MOVW	R0, #lo_addr(TIM10_SRbits+0)
MOVT	R0, #hi_addr(TIM10_SRbits+0)
_LX	[R0, ByteOffset(TIM10_SRbits+0)]
CMP	R0, #0
IT	EQ
BEQ	L_tiempo102
;serie1.c,64 :: 		TIM10_SRbits.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM10_SRbits+0)
MOVT	R0, #hi_addr(TIM10_SRbits+0)
_SX	[R0, ByteOffset(TIM10_SRbits+0)]
;serie1.c,65 :: 		USART1_DR = GPIOA_IDR;
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(USART1_DR+0)
MOVT	R0, #hi_addr(USART1_DR+0)
STR	R1, [R0, #0]
;serie1.c,66 :: 		}
L_tiempo102:
;serie1.c,67 :: 		}
L_end_tiempo10:
BX	LR
; end of _tiempo10
