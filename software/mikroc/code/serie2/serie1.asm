_main:
;serie1.c,5 :: 		void main()
;serie1.c,7 :: 		ini_uarts();
BL	_ini_uarts+0
;serie1.c,9 :: 		while(1);
L_main0:
IT	AL
BAL	L_main0
;serie1.c,10 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_ini_uarts:
;serie1.c,12 :: 		void ini_uarts(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;serie1.c,14 :: 		RCC_AHB1ENRbits.GPIOAEN = 1;  // no necesario en ini_puertos se activa
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(RCC_AHB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_AHB1ENRbits+0)
_SX	[R0, ByteOffset(RCC_AHB1ENRbits+0)]
;serie1.c,15 :: 		GPIOA_MODERbits.MODER9 = 0b10;  // PA9 sera funcion alterna
MOVS	R2, #2
MOVW	R1, #lo_addr(GPIOA_MODERbits+0)
MOVT	R1, #hi_addr(GPIOA_MODERbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #18, #2
STR	R0, [R1, #0]
;serie1.c,16 :: 		GPIOA_MODERbits.MODER10 = 0b10;  // PA10 sera funcion alterna
MOVS	R2, #2
MOVW	R1, #lo_addr(GPIOA_MODERbits+0)
MOVT	R1, #hi_addr(GPIOA_MODERbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #20, #2
STR	R0, [R1, #0]
;serie1.c,17 :: 		GPIOA_AFRHbits.AFRH9 = 0b0111;  // PA9 es funcion alterna AF7
MOVS	R2, #7
MOVW	R1, #lo_addr(GPIOA_AFRHbits+0)
MOVT	R1, #hi_addr(GPIOA_AFRHbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #4, #4
STRB	R0, [R1, #0]
;serie1.c,18 :: 		GPIOA_AFRHbits.AFRH10 = 0b0111;  // PA10 es funcion alterna AF7
MOVS	R2, #7
MOVW	R1, #lo_addr(GPIOA_AFRHbits+0)
MOVT	R1, #hi_addr(GPIOA_AFRHbits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #8, #4
STRH	R0, [R1, #0]
;serie1.c,19 :: 		GPIOA_PUPDRbits.PUPDR10 = 0b01;  // PA10 tendra res. pull-up
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOA_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOA_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #20, #2
STR	R0, [R1, #0]
;serie1.c,21 :: 		RCC_APB2ENRbits.USART1EN = 1;  // se activa el reloj
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;serie1.c,22 :: 		USART1_CR1bits.UE = 1;
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;serie1.c,23 :: 		USART1_CR1bits.M = 0;  // modo 8 bits
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;serie1.c,24 :: 		USART1_CR2bits.STOP = 0b00;  // 1 bit de paro
MOVS	R2, #0
MOVW	R1, #lo_addr(USART1_CR2bits+0)
MOVT	R1, #hi_addr(USART1_CR2bits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #12, #2
STRH	R0, [R1, #0]
;serie1.c,25 :: 		USART1_BRR = (24ul << 4) + 7;
MOVW	R1, #391
MOVT	R1, #0
MOVW	R0, #lo_addr(USART1_BRR+0)
MOVT	R0, #hi_addr(USART1_BRR+0)
STR	R1, [R0, #0]
;serie1.c,26 :: 		USART1_CR1bits.TE = 1;
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;serie1.c,27 :: 		USART1_CR1bits.RE = 1;
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;serie1.c,28 :: 		USART1_CR1bits.RXNEIE = 1;  // se habilita la interrupcion por recepcion
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;serie1.c,29 :: 		NVIC_IntEnable(IVT_INT_USART1);  // se incluye en el NVIC
MOVW	R0, #53
BL	_NVIC_IntEnable+0
;serie1.c,30 :: 		}
L_end_ini_uarts:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_uarts
_recibe8:
;serie1.c,32 :: 		void recibe8(void) iv IVT_INT_USART1 ics ICS_AUTO
;serie1.c,34 :: 		temp = USART1_DR;
MOVW	R0, #lo_addr(USART1_DR+0)
MOVT	R0, #hi_addr(USART1_DR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_temp+0)
MOVT	R0, #hi_addr(_temp+0)
STRH	R1, [R0, #0]
;serie1.c,35 :: 		USART1_DR = temp;
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(USART1_DR+0)
MOVT	R0, #hi_addr(USART1_DR+0)
STR	R1, [R0, #0]
;serie1.c,36 :: 		}
L_end_recibe8:
BX	LR
; end of _recibe8
