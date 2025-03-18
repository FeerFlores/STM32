CC=arm-none-eabi-gcc
AR=arm-none-eabi-ar
OBJCOPY=arm-none-eabi-objcopy
STLINK=~/stlink/build/Release/

INCDIR=inc
SRCDIR=src
LIBDIR=lib
OUTDIR=out
DEPDIR=dep
OBJDIR=obj

LIB=stm32f103_hal
HALDIR=$(LIBDIR)/STM32F1xx_HAL_Driver
CMSISDIR=$(LIBDIR)/CMSIS
BSPDIR=$(LIBDIR)/BSP

LDFILE=STM32F103RBTx_FLASH.ld

OUTPUT_NAME=test
OUTPUT_BIN=$(OUTPUT_NAME).bin
OUTPUT_ELF=$(OUTPUT_NAME).elf
OUTPUT_HEX=$(OUTPUT_NAME).hex
OUTPUT_MAP=$(OUTPUT_NAME).map

CPU_CIBLE=cortex-m3
UC_CIBLE=STM32F103xB

DEFS = -D$(UC_CIBLE)
DEFS+= -DUSE_HAL_DRIVER

INCS= -I$(INCDIR)
INCS+= -I$(LIBDIR)/STM32F1xx_HAL_Driver/Inc
INCS+= -I$(CMSISDIR)/Include
INCS+= -I$(CMSISDIR)/Core/Include
INCS+= -I$(CMSISDIR)/Device/ST/STM32F1xx/Include

# Archivos de la HAL
HAL_SRC=$(wildcard $(HALDIR)/Src/*.c)
HAL_SRC:=$(filter-out $(HALDIR)/Src/stm32f1xx_hal_timebase_rtc_alarm_template.c $(HALDIR)/Src/stm32f1xx_hal_timebase_tim_template.c $(HALDIR)/Src/stm32f1xx_hal_msp_template.c, $(HAL_SRC))

HAL_OBJS=$(patsubst $(HALDIR)/Src/%.c, $(OBJDIR)/%.o, $(HAL_SRC))

CFLAGS= -mcpu=$(CPU_CIBLE) -mlittle-endian -mthumb -Wall
CFLAGS+= -ffunction-sections -fdata-sections -Os
CFLAGS+= $(DEFS) $(INCS)

LDFLAGS= -Wl,--gc-sections
LDFLAGS+= -Wl,-Map=$(OUTDIR)/$(OUTPUT_MAP),--cref,--no-warn-mismatch
LDFLAGS+= -T$(LDFILE)
LDFLAGS+= -nostartfiles -nostdlib -lgcc

# Archivos fuente del proyecto
SRCS=$(wildcard $(SRCDIR)/*.c)
ASM_SRCS=$(wildcard $(SRCDIR)/*.s)  # 🆕 Buscar archivos ensamblador
OBJS=$(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRCS))
ASM_OBJS=$(patsubst $(SRCDIR)/%.s, $(OBJDIR)/%.o, $(ASM_SRCS))  # 🆕 Objetos ensamblador

DEPS=$(OBJS:.o=.d) $(HAL_OBJS:.o=.d)

.PHONY: all dirs clean upload

# Compilación completa
all: dirs $(OUTDIR)/$(OUTPUT_ELF) $(OUTDIR)/$(OUTPUT_BIN) $(OUTDIR)/$(OUTPUT_HEX)

upload: all
	$(STLINK)/st-flash write $(OUTDIR)/$(OUTPUT_BIN) 0x8000000

clean:
	rm -rf $(OUTDIR) $(DEPDIR) $(OBJDIR)

dirs:
	mkdir -p $(OBJDIR) $(DEPDIR) $(OUTDIR)

# Enlazar todos los archivos
$(OUTDIR)/$(OUTPUT_ELF): $(OBJS) $(ASM_OBJS) $(HAL_OBJS)  # 🆕 Incluimos archivos ensamblador
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

$(OUTDIR)/$(OUTPUT_BIN): $(OUTDIR)/$(OUTPUT_ELF)
	$(OBJCOPY) -O binary $< $@

$(OUTDIR)/$(OUTPUT_HEX): $(OUTDIR)/$(OUTPUT_ELF)
	$(OBJCOPY) -O ihex $< $@

# Compilar los archivos fuente del proyecto
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c -MD -MF $(DEPDIR)/$*.d $< -o $@

# Compilar archivos ensamblador 🆕
$(OBJDIR)/%.o: $(SRCDIR)/%.s
	$(CC) $(CFLAGS) -c -MD -MF $(DEPDIR)/$*.d $< -o $@

# Compilar los archivos de la HAL
$(OBJDIR)/%.o: $(HALDIR)/Src/%.c
	$(CC) $(CFLAGS) -c -MD -MF $(DEPDIR)/$*.d $< -o $@

-include $(DEPS)
