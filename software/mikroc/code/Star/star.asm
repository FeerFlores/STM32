_main:
;star.c,5 :: 		void main()
;star.c,7 :: 		ini_puertos();
BL	_ini_puertos+0
;star.c,9 :: 		while(1)
L_main0:
;star.c,11 :: 		led = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;star.c,12 :: 		Delay_ms(100);
MOVW	R7, #56531
MOVT	R7, #50
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
NOP
;star.c,13 :: 		led = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;star.c,14 :: 		Delay_ms(100);
MOVW	R7, #56531
MOVT	R7, #50
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
NOP
;star.c,15 :: 		led = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;star.c,16 :: 		Delay_ms(100);
MOVW	R7, #56531
MOVT	R7, #50
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
NOP
;star.c,17 :: 		led = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;star.c,18 :: 		Delay_ms(1500);
MOVW	R7, #61566
MOVT	R7, #762
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
;star.c,19 :: 		}
IT	AL
BAL	L_main0
;star.c,20 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_ini_puertos:
;star.c,22 :: 		void ini_puertos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;star.c,24 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;star.c,25 :: 		led = 0;  // led on
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;star.c,26 :: 		}
L_end_ini_puertos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_puertos
