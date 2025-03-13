OpenOCD Documentation
======================

Overview
--------

OpenOCD (Open On-Chip Debugger) is an open-source software tool that provides debugging, in-system programming, and boundary-scan testing for embedded devices. It supports a wide range of microcontrollers, including STM32, RP2040, and PY32. OpenOCD communicates with the target device through a debug interface, such as JTAG or SWD, and provides a command-line interface for interacting with the device.

ARM Cortex-M Debug Interface
----------------------------

The ARM Cortex-M architecture includes a debug interface that allows external tools to access the core for debugging and programming purposes. The debug interface consists of a set of registers and commands that enable the debugger to halt the core, read and write memory, and control the execution of the program.

The debug interface is accessed through a set of pins on the microcontroller, such as SWDIO, SWCLK, and nRESET. These pins are connected to a debug adapter, such as a ST-Link or CMSIS-DAP, which provides the physical connection between the host computer and the target device.

CMSIS-DAP Debug Adapter
-----------------------

CMSIS-DAP (Cortex Microcontroller Software Interface Standard - Debug Access Port) is a debug adapter that provides a standardized interface for debugging ARM Cortex-M devices. It is supported by OpenOCD and provides a low-cost alternative to commercial debug adapters.

.. only:: html

   .. image:: https://raw.githubusercontent.com/ARM-software/CMSIS-DAP/main/Documentation/Doxygen/src/images/CMSIS_DAP_INTERFACE.png
      :alt: CMSIS-DAP Debug Adapter
      :align: center
SWDIO and SWCLK Signals
-----------------------

The SWDIO (Serial Wire Debug Input/Output) and SWCLK (Serial Wire Clock) signals are used to communicate with the target device over the SWD interface. SWDIO is a bidirectional data line that carries debug commands and data between the host and the target device. SWCLK is a unidirectional clock signal that synchronizes the data transfer between the host and the target device.

The SWD interface uses a two-wire connection between the host and the target device, which reduces the pin count compared to the JTAG interface. This makes it suitable for devices with limited pin availability, such as microcontrollers.
