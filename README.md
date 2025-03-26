
# ARM Cortex-M Getting Started Documentation



![ARM Cortex-M Microcontroller](./software/resources/images/cortex.png)


## Introduction

Welcome to the Getting Started guide for ARM Cortex-M microcontrollers, specifically tailored for developers using STM32, RP2040, and PY32. This guide focuses on establishing a development environment using OpenOCD and PyOCD, tools essential for debugging and programming embedded systems.

## Development Environment Setup

**OpenOCD (Open On-Chip Debugger)** is a pivotal tool for debugging, in-system programming, and boundary-scan testing of embedded devices. It facilitates communication with your microcontroller through debug interfaces like JTAG or SWD.

**PyOCD** complements OpenOCD by providing a high-level interface through Python, making it simpler to handle the complexities of the debugging and programming processes.

To set up your development environment:
1. **Install OpenOCD**: Download and install OpenOCD from [OpenOCD Official Website](http://openocd.org/).
2. **Install PyOCD**: Install PyOCD via pip with `pip install pyocd`.
3. **Configure your debugger**: Set up your debug interface configurations specific to your target microcontroller.

## Project Initialization

Begin your project with these steps:
1. **Create a project directory**: Organize your source files, headers, and scripts.
2. **Write your first script**: Utilize PyOCD to interact with OpenOCD and initiate a simple debugging session.
3. **Compile and debug**: Use OpenOCD to load your compiled code onto the microcontroller and start debugging.

## Additional Resources

Explore more detailed guides and resources by visiting the [official ARM Cortex-M Documentation](https://cesarbautista10.github.io/arm-cortex-m/).

## Note

This guide assumes you have a foundational knowledge of embedded systems and C programming. Newcomers to embedded development are encouraged to review introductory materials before proceeding with STM32, PY, or RP2040 development.

> Happy coding! Embrace the journey of mastering ARM Cortex-M microcontrollers with the support of OpenOCD and PyOCD.
=======
# Programación de STM32 con mikroC for ARM <a href='https://postimg.cc/PPVcnGBr' target='_blank'><img src='https://i.postimg.cc/PPVcnGBr/chatbot.gif' width="110px" height="110px" align = "center" border='0' alt='chatbot'/></a>

<p> Recuerda que una de las opciones para programar un microcontrolador STM32 con el software MikroC for ARM, necesita un ST-LINK V2 MCU APM32. </p>
<p> A continuación se explican las razones para usar un ST-LINK y cómo usar la interfaz SWD del STM32: </p>

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
