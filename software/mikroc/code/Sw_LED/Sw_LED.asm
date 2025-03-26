_main:
;Sw_LED.c,6 :: 		void main()
;Sw_LED.c,8 :: 		ini_puertos();
BL	_ini_puertos+0
;Sw_LED.c,10 :: 		while(1)
L_main0:
;Sw_LED.c,12 :: 		Delay_ms(1);
MOVW	R7, #55998
MOVT	R7, #0
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;Sw_LED.c,13 :: 		if(sw == 1)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Sw_LED.c,14 :: 		led = ~led;
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_LX	[R1, ByteOffset(GPIOA_ODR+0)]
EOR	R0, R0, #1
UXTB	R0, R0
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
L_main4:
;Sw_LED.c,15 :: 		}
IT	AL
BAL	L_main0
;Sw_LED.c,16 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_ini_puertos:
;Sw_LED.c,18 :: 		void ini_puertos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Sw_LED.c,23 :: 		| _GPIO_CFG_PULL_DOWN);
MOV	R2, #322
;Sw_LED.c,22 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, _GPIO_CFG_DIGITAL_INPUT
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;Sw_LED.c,23 :: 		| _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Sw_LED.c,24 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Sw_LED.c,25 :: 		led = 1;  // led off
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Sw_LED.c,26 :: 		}
L_end_ini_puertos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_puertos
