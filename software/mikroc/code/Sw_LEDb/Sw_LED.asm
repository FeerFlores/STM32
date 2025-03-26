_main:
;Sw_LED.c,10 :: 		void main()
;Sw_LED.c,12 :: 		flagx = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
STR	R1, [R0, #0]
;Sw_LED.c,13 :: 		ini_puertos();
BL	_ini_puertos+0
;Sw_LED.c,15 :: 		while(1)
L_main0:
;Sw_LED.c,17 :: 		boton();
BL	_boton+0
;Sw_LED.c,18 :: 		Delay_ms(1);
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
;Sw_LED.c,19 :: 		}
IT	AL
BAL	L_main0
;Sw_LED.c,20 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_ini_puertos:
;Sw_LED.c,22 :: 		void ini_puertos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Sw_LED.c,27 :: 		| _GPIO_CFG_PULL_DOWN);
MOV	R2, #322
;Sw_LED.c,26 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, _GPIO_CFG_DIGITAL_INPUT
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;Sw_LED.c,27 :: 		| _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Sw_LED.c,28 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Sw_LED.c,29 :: 		led = 1;  // led off
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Sw_LED.c,30 :: 		}
L_end_ini_puertos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_puertos
_boton:
;Sw_LED.c,32 :: 		void boton(void)
;Sw_LED.c,34 :: 		if(flagx == 1)
MOVW	R1, #lo_addr(_flagx+0)
MOVT	R1, #hi_addr(_flagx+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_boton4
;Sw_LED.c,36 :: 		contx--;
MOVW	R1, #lo_addr(_contx+0)
MOVT	R1, #hi_addr(_contx+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Sw_LED.c,37 :: 		if(contx == 0)
CMP	R0, #0
IT	NE
BNE	L_boton5
;Sw_LED.c,39 :: 		contx = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_contx+0)
MOVT	R0, #hi_addr(_contx+0)
STRB	R1, [R0, #0]
;Sw_LED.c,40 :: 		if(sw == 0)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_boton6
;Sw_LED.c,41 :: 		flagx = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
STR	R1, [R0, #0]
L_boton6:
;Sw_LED.c,42 :: 		}
L_boton5:
;Sw_LED.c,43 :: 		}
IT	AL
BAL	L_boton7
L_boton4:
;Sw_LED.c,46 :: 		if(sw == 1)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_boton8
;Sw_LED.c,48 :: 		led = ~led;
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_LX	[R1, ByteOffset(GPIOA_ODR+0)]
EOR	R0, R0, #1
UXTB	R0, R0
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;Sw_LED.c,49 :: 		flagx = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
STR	R1, [R0, #0]
;Sw_LED.c,50 :: 		contx = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_contx+0)
MOVT	R0, #hi_addr(_contx+0)
STRB	R1, [R0, #0]
;Sw_LED.c,51 :: 		}
L_boton8:
;Sw_LED.c,52 :: 		}
L_boton7:
;Sw_LED.c,53 :: 		}
L_end_boton:
BX	LR
; end of _boton
