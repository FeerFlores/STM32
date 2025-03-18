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
