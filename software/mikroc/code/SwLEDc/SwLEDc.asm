_ini_puertos:
;SwLEDc.c,7 :: 		void ini_puertos(void)
;SwLEDc.c,9 :: 		RCC_AHB1ENRbits.GPIOAEN = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(RCC_AHB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_AHB1ENRbits+0)
_SX	[R0, ByteOffset(RCC_AHB1ENRbits+0)]
;SwLEDc.c,10 :: 		GPIOA_MODERbits.MODER0 = 0b00;
MOVS	R2, #0
MOVW	R1, #lo_addr(GPIOA_MODERbits+0)
MOVT	R1, #hi_addr(GPIOA_MODERbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #0, #2
STRB	R0, [R1, #0]
;SwLEDc.c,11 :: 		GPIOA_PUPDRbits.PUPDR0 = 0b01;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOA_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOA_PUPDRbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #0, #2
STRB	R0, [R1, #0]
;SwLEDc.c,13 :: 		RCC_AHB1ENRbits.GPIOCEN = 1;
MOVW	R0, #lo_addr(RCC_AHB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_AHB1ENRbits+0)
_SX	[R0, ByteOffset(RCC_AHB1ENRbits+0)]
;SwLEDc.c,14 :: 		GPIOC_MODERbits.MODER13 = 0b01;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_MODERbits+0)
MOVT	R1, #hi_addr(GPIOC_MODERbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #26, #2
STR	R0, [R1, #0]
;SwLEDc.c,15 :: 		GPIOC_OTYPERbits.OT13 = 0b0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R0, #lo_addr(GPIOC_OTYPERbits+0)
MOVT	R0, #hi_addr(GPIOC_OTYPERbits+0)
_SX	[R0, ByteOffset(GPIOC_OTYPERbits+0)]
;SwLEDc.c,16 :: 		GPIOC_OSPEEDRbits.OSPEEDR13 = 0b11;
MOVS	R2, #3
MOVW	R1, #lo_addr(GPIOC_OSPEEDRbits+0)
MOVT	R1, #hi_addr(GPIOC_OSPEEDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #26, #2
STR	R0, [R1, #0]
;SwLEDc.c,17 :: 		GPIOC_PUPDRbits.PUPDR13 = 0b00;
MOVS	R2, #0
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #26, #2
STR	R0, [R1, #0]
;SwLEDc.c,18 :: 		led = 0;  // led on
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;SwLEDc.c,19 :: 		}
L_end_ini_puertos:
BX	LR
; end of _ini_puertos
_boton:
;SwLEDc.c,21 :: 		void boton(void)
;SwLEDc.c,23 :: 		if(flagx)
MOVW	R1, #lo_addr(_flagx+0)
MOVT	R1, #hi_addr(_flagx+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_boton0
;SwLEDc.c,25 :: 		contx--;
MOVW	R1, #lo_addr(_contx+0)
MOVT	R1, #hi_addr(_contx+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;SwLEDc.c,26 :: 		if(!contx)
CMP	R0, #0
IT	NE
BNE	L_boton1
;SwLEDc.c,28 :: 		contx = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_contx+0)
MOVT	R0, #hi_addr(_contx+0)
STRB	R1, [R0, #0]
;SwLEDc.c,29 :: 		if(sw)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_boton2
;SwLEDc.c,30 :: 		flagx = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
STR	R1, [R0, #0]
L_boton2:
;SwLEDc.c,31 :: 		}
L_boton1:
;SwLEDc.c,32 :: 		}
IT	AL
BAL	L_boton3
L_boton0:
;SwLEDc.c,35 :: 		if(!sw)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_boton4
;SwLEDc.c,37 :: 		led = ~led;
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_LX	[R1, ByteOffset(GPIOC_ODR+0)]
EOR	R0, R0, #1
UXTB	R0, R0
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;SwLEDc.c,38 :: 		flagx = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
STR	R1, [R0, #0]
;SwLEDc.c,39 :: 		contx = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_contx+0)
MOVT	R0, #hi_addr(_contx+0)
STRB	R1, [R0, #0]
;SwLEDc.c,40 :: 		}
L_boton4:
;SwLEDc.c,41 :: 		}
L_boton3:
;SwLEDc.c,42 :: 		}
L_end_boton:
BX	LR
; end of _boton
_main:
;SwLEDc.c,46 :: 		void main()
;SwLEDc.c,48 :: 		ini_puertos();
BL	_ini_puertos+0
;SwLEDc.c,50 :: 		while(1)
L_main5:
;SwLEDc.c,52 :: 		boton();
BL	_boton+0
;SwLEDc.c,53 :: 		Delay_ms(1);
MOVW	R7, #33331
MOVT	R7, #0
NOP
NOP
L_main7:
SUBS	R7, R7, #1
BNE	L_main7
NOP
NOP
NOP
NOP
;SwLEDc.c,54 :: 		}
IT	AL
BAL	L_main5
;SwLEDc.c,55 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
