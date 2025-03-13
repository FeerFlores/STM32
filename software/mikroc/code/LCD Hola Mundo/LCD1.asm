_main:
;LCD1.c,14 :: 		void main()
;LCD1.c,16 :: 		ini_lcd();
BL	_ini_lcd+0
;LCD1.c,18 :: 		comando(0x86);
MOVS	R0, #134
BL	_comando+0
;LCD1.c,19 :: 		dato('H');
MOVS	R0, #72
BL	_dato+0
;LCD1.c,20 :: 		dato('o');
MOVS	R0, #111
BL	_dato+0
;LCD1.c,21 :: 		dato('l');
MOVS	R0, #108
BL	_dato+0
;LCD1.c,22 :: 		dato('a');
MOVS	R0, #97
BL	_dato+0
;LCD1.c,24 :: 		comando(0xc6);
MOVS	R0, #198
BL	_comando+0
;LCD1.c,25 :: 		dato('M');
MOVS	R0, #77
BL	_dato+0
;LCD1.c,26 :: 		dato('u');
MOVS	R0, #117
BL	_dato+0
;LCD1.c,27 :: 		dato('n');
MOVS	R0, #110
BL	_dato+0
;LCD1.c,28 :: 		dato('d');
MOVS	R0, #100
BL	_dato+0
;LCD1.c,29 :: 		dato('o');
MOVS	R0, #111
BL	_dato+0
;LCD1.c,31 :: 		while(1);
L_main0:
IT	AL
BAL	L_main0
;LCD1.c,32 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_ini_lcd:
;LCD1.c,34 :: 		void ini_lcd(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;LCD1.c,38 :: 		| _GPIO_PINMASK_5 | _GPIO_PINMASK_6);
MOVW	R1, #126
;LCD1.c,36 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;LCD1.c,38 :: 		| _GPIO_PINMASK_5 | _GPIO_PINMASK_6);
BL	_GPIO_Digital_Output+0
;LCD1.c,40 :: 		rs = e = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
_LX	[R0, ByteOffset(GPIOA_ODR+0)]
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,42 :: 		Delay_ms(15);
MOVW	R7, #41246
MOVT	R7, #7
NOP
NOP
L_ini_lcd2:
SUBS	R7, R7, #1
BNE	L_ini_lcd2
NOP
NOP
NOP
;LCD1.c,43 :: 		comando8(0x38);
MOVS	R0, #56
BL	_comando8+0
;LCD1.c,44 :: 		Delay_us(4100);
MOVW	R7, #5593
MOVT	R7, #2
NOP
NOP
L_ini_lcd4:
SUBS	R7, R7, #1
BNE	L_ini_lcd4
NOP
NOP
;LCD1.c,45 :: 		comando8(0x38);
MOVS	R0, #56
BL	_comando8+0
;LCD1.c,46 :: 		Delay_us(100);
MOVW	R7, #3331
MOVT	R7, #0
NOP
NOP
L_ini_lcd6:
SUBS	R7, R7, #1
BNE	L_ini_lcd6
NOP
NOP
NOP
NOP
;LCD1.c,47 :: 		comando8(0x38);
MOVS	R0, #56
BL	_comando8+0
;LCD1.c,48 :: 		comando8(0x28);
MOVS	R0, #40
BL	_comando8+0
;LCD1.c,49 :: 		comando(0x28);
MOVS	R0, #40
BL	_comando+0
;LCD1.c,50 :: 		comando(0b110);  // i/d = 0, s = 0
MOVS	R0, #6
BL	_comando+0
;LCD1.c,51 :: 		comando(0b1100);  // d = 1, c = 0, b = 0
MOVS	R0, #12
BL	_comando+0
;LCD1.c,52 :: 		comando(1);  // comando cleardisplay
MOVS	R0, #1
BL	_comando+0
;LCD1.c,53 :: 		}
L_end_ini_lcd:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ini_lcd
_comando8:
;LCD1.c,55 :: 		void comando8(unsigned char num)
; num start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R3, R0
; num end address is: 0 (R0)
; num start address is: 12 (R3)
;LCD1.c,57 :: 		rs = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,58 :: 		bus(num >> 4);
LSRS	R1, R3, #4
UXTB	R0, R1
BL	_bus+0
;LCD1.c,59 :: 		e = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,60 :: 		Delay_us(1);
MOVW	R7, #31
MOVT	R7, #0
NOP
NOP
L_comando88:
SUBS	R7, R7, #1
BNE	L_comando88
NOP
NOP
NOP
NOP
;LCD1.c,61 :: 		e = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,63 :: 		if(num < 3)
CMP	R3, #3
IT	CS
BCS	L_comando810
; num end address is: 12 (R3)
;LCD1.c,64 :: 		Delay_us(1642);
MOVW	R7, #54731
MOVT	R7, #0
NOP
NOP
L_comando811:
SUBS	R7, R7, #1
BNE	L_comando811
NOP
NOP
NOP
NOP
IT	AL
BAL	L_comando813
L_comando810:
;LCD1.c,66 :: 		Delay_us(40);
MOVW	R7, #1331
MOVT	R7, #0
NOP
NOP
L_comando814:
SUBS	R7, R7, #1
BNE	L_comando814
NOP
NOP
NOP
NOP
L_comando813:
;LCD1.c,67 :: 		}
L_end_comando8:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _comando8
_comando:
;LCD1.c,69 :: 		void comando(unsigned char num)
; num start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R3, R0
; num end address is: 0 (R0)
; num start address is: 12 (R3)
;LCD1.c,71 :: 		rs = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,73 :: 		bus(num >> 4);
LSRS	R1, R3, #4
UXTB	R0, R1
BL	_bus+0
;LCD1.c,74 :: 		e = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,75 :: 		Delay_us(1);
MOVW	R7, #31
MOVT	R7, #0
NOP
NOP
L_comando16:
SUBS	R7, R7, #1
BNE	L_comando16
NOP
NOP
NOP
NOP
;LCD1.c,76 :: 		e = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,78 :: 		bus(num);
UXTB	R0, R3
BL	_bus+0
;LCD1.c,79 :: 		e = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,80 :: 		Delay_us(1);
MOVW	R7, #31
MOVT	R7, #0
NOP
NOP
L_comando18:
SUBS	R7, R7, #1
BNE	L_comando18
NOP
NOP
NOP
NOP
;LCD1.c,81 :: 		e = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,83 :: 		if(num < 4)
CMP	R3, #4
IT	CS
BCS	L_comando20
; num end address is: 12 (R3)
;LCD1.c,84 :: 		Delay_us(1642);
MOVW	R7, #54731
MOVT	R7, #0
NOP
NOP
L_comando21:
SUBS	R7, R7, #1
BNE	L_comando21
NOP
NOP
NOP
NOP
IT	AL
BAL	L_comando23
L_comando20:
;LCD1.c,86 :: 		Delay_us(40);
MOVW	R7, #1331
MOVT	R7, #0
NOP
NOP
L_comando24:
SUBS	R7, R7, #1
BNE	L_comando24
NOP
NOP
NOP
NOP
L_comando23:
;LCD1.c,87 :: 		}
L_end_comando:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _comando
_dato:
;LCD1.c,89 :: 		void dato(unsigned char num)
; num start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R3, R0
; num end address is: 0 (R0)
; num start address is: 12 (R3)
;LCD1.c,91 :: 		rs = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,93 :: 		bus(num >> 4);
LSRS	R1, R3, #4
UXTB	R0, R1
BL	_bus+0
;LCD1.c,94 :: 		e = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,95 :: 		Delay_us(1);
MOVW	R7, #31
MOVT	R7, #0
NOP
NOP
L_dato26:
SUBS	R7, R7, #1
BNE	L_dato26
NOP
NOP
NOP
NOP
;LCD1.c,96 :: 		e = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,98 :: 		bus(num);
UXTB	R0, R3
; num end address is: 12 (R3)
BL	_bus+0
;LCD1.c,99 :: 		e = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,100 :: 		Delay_us(1);
MOVW	R7, #31
MOVT	R7, #0
NOP
NOP
L_dato28:
SUBS	R7, R7, #1
BNE	L_dato28
NOP
NOP
NOP
NOP
;LCD1.c,101 :: 		e = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,103 :: 		Delay_us(40);
MOVW	R7, #1331
MOVT	R7, #0
NOP
NOP
L_dato30:
SUBS	R7, R7, #1
BNE	L_dato30
NOP
NOP
NOP
NOP
;LCD1.c,104 :: 		}
L_end_dato:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _dato
_bus:
;LCD1.c,106 :: 		void bus(unsigned char num)
; num start address is: 0 (R0)
; num end address is: 0 (R0)
; num start address is: 0 (R0)
;LCD1.c,108 :: 		DB7 = num.B3;
UBFX	R2, R0, #3, #1
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,109 :: 		DB6 = num.B2;
UBFX	R2, R0, #2, #1
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,110 :: 		DB5 = num.B1;
UBFX	R2, R0, #1, #1
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,111 :: 		DB4 = num.B0;
UBFX	R2, R0, #0, #1
; num end address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;LCD1.c,112 :: 		}
L_end_bus:
BX	LR
; end of _bus
