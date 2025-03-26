_main:
;UnLED.c,3 :: 		void main()
;UnLED.c,5 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;UnLED.c,7 :: 		while(1)
L_main0:
;UnLED.c,9 :: 		led = ~led;  // led on
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_LX	[R1, ByteOffset(GPIOC_ODR+0)]
EOR	R0, R0, #1
UXTB	R0, R0
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;UnLED.c,10 :: 		Delay_ms(500);
MOVW	R7, #20521
MOVT	R7, #254
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
;UnLED.c,11 :: 		}
IT	AL
BAL	L_main0
;UnLED.c,12 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
