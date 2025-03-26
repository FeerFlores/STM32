# ¿Qué hacen estos archivos?
## Define el microcontrolador utilizado

<DEVICE_NAME>STM32F411CE</DEVICE_NAME>: Especifica el modelo del microcontrolador.

<DEVICE_CLOCK>100</DEVICE_CLOCK>: Indica que la frecuencia del sistema está configurada a 100 MHz.

## Configura el sistema de reloj

### Osciladores:

HSI oscillator OFF: Desactiva el oscilador interno de alta velocidad (HSI).

HSE oscillator ON: Activa el oscilador externo de alta velocidad (HSE).

HSE oscillator not bypassed: Indica que no se está usando un oscilador externo con bypass (por ejemplo, un cristal en lugar de un oscilador de señal externa).

### PLL (Phase-Locked Loop):

PLL ON: Activa el PLL principal para generar la frecuencia del sistema.

PLLM = 25: Divide la frecuencia de entrada antes de entrar al PLL.

PLLN = 200: Multiplica la señal de entrada.

PLLP = 2: Define el divisor final del PLL para generar el SYSCLK.

PLLQ = 7: Configura la frecuencia para periféricos como USB OTG FS, SDIO y el generador de números aleatorios.

## Selección de reloj del sistema:

PLL selected as system clock: Indica que la señal de reloj del sistema proviene del PLL.

## Configura los buses internos (AHB, APB1, APB2)

SYSCLK not divided: El reloj principal (SYSCLK) se usa directamente para el bus AHB sin división.

APB1 = HCLK divided by 2: El bus APB1 (periféricos de baja velocidad) recibe la señal dividida por 2.

APB2 = HCLK not divided: El bus APB2 (periféricos de alta velocidad) usa directamente HCLK.

## Configuraciones adicionales

HSI clock selected en Microcontroller clock output 1 (MCO1): Usa el oscilador interno como fuente para MCO1.

System clock (SYSCLK) selected en Microcontroller clock output 2 (MCO2): MCO2 usa la señal SYSCLK.

Voltage range = 2.7 to 3.6 V: Define el rango de operación de voltaje del microcontrolador.
