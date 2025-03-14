# Programación de STM32 con mikroC for ARM <a href='https://postimg.cc/PPVcnGBr' target='_blank'><img src='https://i.postimg.cc/PPVcnGBr/chatbot.gif' width="110px" height="110px" align = "center" border='0' alt='chatbot'/></a>

<p> Recuerda que una de las opciones para programar un microcontrolador STM32 con el software MikroC for ARM, necesita un ST-LINK V2 MCU APM32. </p>
<p> A continuación se explican las razones para usar un ST-LINK y cómo usar la interfaz SWD del STM32 </p>

## 1. ST-Link es el programador y depurador oficial de STMicroelectronics

El ST-Link de STMicroelectronics permite la comunicación entre el PC y el STM32 a través de SWD (Serial Wire Debug) o JTAG, que son protocolos de depuración y programación.

<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/sX4XYwSD/image.png' width="500px" height="300px" align = "center" border='0' alt='image'/></a>
<font color="gray"><i> Figura 1. ST-LINK V2 MCU APM32 </i></font>

## 2. MikroC for ARM no tiene un bootloader integrado para STM32

MikroC for ARM genera archivos binarios que deben ser cargados en la memoria flash del microcontrolador.

Para esto, ST-Link se encarga de escribir el código en la memoria mediante la interfaz SWD o JTAG.

## 3. Ventajas del ST-Link
   
Programación rápida y confiable a través de SWD.

Compatibilidad con software como STM32CubeProgrammer, MikroC, Keil y OpenOCD.

Interfaz con el software MikroC for ARM, que usa ST-Link para cargar el firmware automáticamente después de la compilación.

<a href='https://postimg.cc/dkZmzpPp' target='_blank'><img src='https://i.postimg.cc/nz0RQfdF/stm.png' align = "center" border='0' alt='stm'/></a>

<font color="gray"><i> Figura 2. STM32F411CE  </i></font>
