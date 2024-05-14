/*
 * File:   unoTest_main.c
 * Author: ishanmadan
 *
 * Created on May 10, 2024, 1:52 PM
 */

#include "xc.h"
#include "BOARD.h"
#include "IO_Ports.h"
#include "AD.h"
#include "pwm.h"
#include "LED.h"
#include <stdio.h>

// delay in ms
#define DELAY(x)                                \
    for (int wait = 0; wait <= x * 800; wait++) \
    {                                           \
        asm("nop");                             \
    }

int main(void)
{
    BOARD_Init();
    AD_Init();
    PWM_Init();
    LED_Init();

    IO_PortsSetPortOutputs(PORTV, PIN9 | PIN10 | PIN11 | PIN12);
    IO_PortsSetPortOutputs(PORTW, PIN9 | PIN10 | PIN11 | PIN12);
    IO_PortsSetPortOutputs(PORTX, ~PIN11);                  // all bits from 12 to 3 except 11
    IO_PortsSetPortOutputs(PORTY, ~PIN4 & ~PIN10 & ~PIN12); // all bits from 11 to 3 except 10 and 4
    IO_PortsSetPortOutputs(PORTZ, ~PIN6);                   // all bits from 12 to 3 except 6

    PWM_AddPins(0x1F); // add all 5 pins to pwm
    AD_AddPins(0xFFF); // add all 12 pins to ad

    IO_PortsWritePort(PORTV, 0xFFFF);
    IO_PortsWritePort(PORTW, 0xFFFF);
    IO_PortsWritePort(PORTX, 0xFFFF);
    IO_PortsWritePort(PORTY, 0xFFFF);
    IO_PortsWritePort(PORTZ, 0xFFFF);

    PWM_SetDutyCycle(PWM_PORTX11, 500);
    PWM_SetDutyCycle(PWM_PORTY04, 500);
    PWM_SetDutyCycle(PWM_PORTY10, 500);
    PWM_SetDutyCycle(PWM_PORTY12, 500);
    PWM_SetDutyCycle(PWM_PORTZ06, 500);

    LED_AddBanks(LED_BANK1 | LED_BANK2 | LED_BANK3);

    LED_SetBank(LED_BANK1, 0b1100);
    LED_SetBank(LED_BANK2, 0b1110);
    LED_SetBank(LED_BANK3, 0b1100);

    while (1)
    {
        for (int i = 0; i < 12; i++)
        {
            unsigned int reading = AD_ReadADPin(1 << i);
            if (reading > 1023)
            {
                reading = 1023;
            }
            printf(">%d: %u\n\n", i, reading);
            DELAY(10); // 10ms
        }
        // uint16_t pin = AD_PORTV3;
        // printf(">%d: %u\n\n", pin, AD_ReadADPin(pin));
        // DELAY(10);

        LED_InvertBank(LED_BANK1, 0xF);
        LED_InvertBank(LED_BANK2, 0xF);
        LED_InvertBank(LED_BANK3, 0xF);
    }

    // DELAY(100);
}
