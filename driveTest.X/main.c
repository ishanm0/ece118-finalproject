/*
 * File:   main.c
 * Author: ishanmadan
 *
 * Created on May 19, 2024, 7:53 PM
 */

#include "xc.h"
#include "BOARD.h"
#include "pwm.h"
#include "IO_Ports.h"
#include <stdio.h>

#define DELAY(x)                          \
    for (int wait = 0; wait <= x; wait++) \
    {                                     \
        asm("nop");                       \
    }

void left(int speed) {
    if (speed < 0) {
        speed = -speed;
        IO_PortsSetPortBits(PORTY, PIN4);
        IO_PortsClearPortBits(PORTY, PIN6);
    } else {
        IO_PortsClearPortBits(PORTY, PIN4);
        IO_PortsSetPortBits(PORTY, PIN6);
    }

    PWM_SetDutyCycle(PWM_PORTX11, speed);
}

void right(int speed) {
    if (speed < 0) {
        speed = -speed;
        IO_PortsClearPortBits(PORTY, PIN7);
        IO_PortsSetPortBits(PORTY, PIN8);
    } else {
        IO_PortsSetPortBits(PORTY, PIN7);
        IO_PortsClearPortBits(PORTY, PIN8);
    }

    PWM_SetDutyCycle(PWM_PORTY10, speed);
}

int main(void)
{
    BOARD_Init();
    PWM_Init();

    PWM_AddPins(PWM_PORTX11 | PWM_PORTY10);
    IO_PortsSetPortOutputs(PORTY, PIN4 | PIN6 | PIN7 | PIN8 | PIN12);
    IO_PortsClearPortBits(PORTY, PIN4 | PIN6 | PIN7 | PIN8 | PIN12);
    //PIN Y12 
    while (1)
    {
        IO_PortsSetPortBits(PORTY, PIN12);
        printf("Starting...\r\n");
        left(1000);
        right(1000);
        // PWM_SetDutyCycle(PWM_PORTX11, 1000);
        // PWM_SetDutyCycle(PWM_PORTY10, 1000);
        // // IO_PortsSetPortBits(PORTY, PIN4);
        // // IO_PortsClearPortBits(PORTY, PIN6);
        // IO_PortsSetPortBits(PORTY, PIN7);
        // IO_PortsClearPortBits(PORTY, PIN8);

        DELAY(1000000);

        printf("Backward...\r\n");
        left(-1000);
        right(-1000);
        // IO_PortsClearPortBits(PORTY, PIN4);
        // IO_PortsSetPortBits(PORTY, PIN6);
        // IO_PortsClearPortBits(PORTY, PIN7);
        // IO_PortsSetPortBits(PORTY, PIN8);

        DELAY(1000000);

        printf("Right...\r\n");
        left(1000);
        right(-1000);
        // IO_PortsSetPortBits(PORTY, PIN4);
        // IO_PortsClearPortBits(PORTY, PIN6);
        // IO_PortsClearPortBits(PORTY, PIN7);
        // IO_PortsSetPortBits(PORTY, PIN8);

        DELAY(1000000);

        printf("Left...\r\n");
        left(-1000);
        right(1000);
        // IO_PortsClearPortBits(PORTY, PIN4);
        // IO_PortsSetPortBits(PORTY, PIN6);
        // IO_PortsSetPortBits(PORTY, PIN7);
        // IO_PortsClearPortBits(PORTY, PIN8);

        DELAY(1000000);
    }

    return 0;
}
