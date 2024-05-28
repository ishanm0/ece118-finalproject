/* 
 * File:   mainPart6.c
 * Author: yafit
 *
 * Created on April 30, 2024, 3:54 PM
 */

/*
 * 
 */
#include <stdio.h>
#include <stdlib.h>
#include "AD.h"
#include "BOARD.h"
#include "xc.h"
#include <stdio.h>
#include "LED.h"
#include "RC_Servo.h"
#include "pwm.h"
#include "IO_Ports.h"

int main(void) {
    printf("Attempting setup and everything... \r\n");

    BOARD_Init();
    RC_Init();

    //        AD_Init();
    //    PWM_Init();
    IO_PortsSetPortInputs(PORTV, PIN4);
    //    IO_PortsSetPortOutputs(PORTV, PIN5 | PIN6 | PIN3);
    IO_PortsSetPortOutputs(PORTV, PIN5);
    IO_PortsSetPortBits(PORTV, PIN5);
    //    PWM_AddPins(PWM_PORTY10);

    IO_PortsSetPortOutputs(PORTY, PIN3);
    IO_PortsSetPortBits(PORTY, PIN3);

    //        AD_AddPins(AD_PORTV3);
    //        AD_AddPins(AD_PORTV4);

    RC_AddPins(RC_PORTV03);

    while (1) {
        //                if (AD_IsNewDataReady() == TRUE) {
        //                    unsigned int adc_Tape = AD_ReadADPin(AD_PORTV3);
        //            unsigned int adc_TrackWire = AD_ReadADPin(AD_PORTV4);
        //                    printf("Tape Sensor Reading: %d\r\n", adc_Tape);
        //            printf("Track Wire Reading: %d\r\n", adc_TrackWire);
        //            }

        //        if (IO_PortsReadPort(PORTV) & PIN4) {
        //            printf("Motor Speed 50%\r\n");
        //            PWM_SetDutyCycle(PWM_PORTY10, 500);
        //            IO_PortsSetPortBits(PORTV, PIN5);
        //            IO_PortsClearPortBits(PORTV, PIN6);
        //        } else {
        //            printf("Motor Speed 100%\r\n");
        //            PWM_SetDutyCycle(PWM_PORTY10, 1000);
        //            IO_PortsClearPortBits(PORTV, PIN5);
        //            IO_PortsSetPortBits(PORTV, PIN6);
        //        }
        if (IO_PortsReadPort(PORTV) & PIN4) {
            printf("Servo State 1000\r\n");
            RC_SetPulseTime(RC_PORTV03, 1000);
        } else {
            printf("Servo State 2000\r\n");
            RC_SetPulseTime(RC_PORTV03, 2000);
        }
    }
    return 0;
}