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

#define BUMPER_PIN_FLR PIN3
#define BUMPER_PIN_FLB PIN4
#define BUMPER_PIN_FRR PIN5
#define BUMPER_PIN_FRB PIN6
#define BUMPER_PIN_BLR PIN7
#define BUMPER_PIN_BLB PIN8
#define BUMPER_PIN_BRR PIN9
#define BUMPER_PIN_BRB PIN11

#define DELAY(x)                          \
    for (int wait = 0; wait <= x; wait++) \
    {                                     \
        asm("nop");                       \
    }

int main(void)
{
    printf("Attempting setup and everything... \r\n");
    RC_Init();
    BOARD_Init();
    // AD_Init();

    //    AD_AddPins(AD_PORTV3);
    //    AD_AddPins(AD_PORTV4);
    //    AD_AddPins(AD_PORTV5);
    //    AD_AddPins(AD_PORTV6);
   
    IO_PortsSetPortInputs(PORTZ, BUMPER_PIN_FLR | BUMPER_PIN_FLB | BUMPER_PIN_FRR | BUMPER_PIN_FRB | BUMPER_PIN_BLR | BUMPER_PIN_BLB | BUMPER_PIN_BRR | BUMPER_PIN_BRB);
    IO_PortsSetPortInputs(PORTX, PIN4); // front right tape sensor
    IO_PortsSetPortInputs(PORTZ, PIN9 | PIN11);        // back left & back right tape sensor
    //portY 9 and 11 arent working
    RC_AddPins(RC_PORTV03);
    //y-10 is left bad ir
    //z-12 is front right ir
    //
    IO_PortsSetPortInputs(PORTZ, PIN12);       // front right tape sensor
    IO_PortsClearPortBits(PORTY, PIN12);
    IO_PortsSetPortBits(PORTY, PIN12);
    
    IO_PortsSetPortOutputs(PORTY, PIN12);
    uint8_t bumpers = 0;
    uint8_t tape = 0;

    while (1)
    {
        // Sensors Testing
        //        if (AD_IsNewDataReady() == TRUE) {
        //            unsigned int OD1 = AD_ReadADPin(AD_PORTV3);
        //            unsigned int OD2 = AD_ReadADPin(AD_PORTV4);
        //            unsigned int OD3 = AD_ReadADPin(AD_PORTV5);
        //            unsigned int OD4 = AD_ReadADPin(AD_PORTV6);

        //            printf("Obstacle Detector 1: %d \r\n\n", OD1);
        //            printf("Obstacle Detector 2: %d \r\n\n", OD2);
        //            printf("Obstacle Detector 3: %d \r\n\n", OD3);
        //            printf("Obstacle Detector 4: %d \r\n\n", OD4);
        //        }

        // Bumpers Testing

        if ((IO_PortsReadPort(PORTZ) & BUMPER_PIN_FLR) && !(bumpers & 0x01))
        {
            bumpers |= 0x01;
            printf("Bumper Front Left-Red Hit\n");
            RC_SetPulseTime(RC_PORTV03, 1000);
        }
        else if (!(IO_PortsReadPort(PORTZ) & BUMPER_PIN_FLR) && (bumpers & 0x01))
        {
            bumpers &= ~0x01;
            printf("Bumper Front Left-Red Not Hit\n");
        }

        if ((IO_PortsReadPort(PORTZ) & BUMPER_PIN_FLB) && !(bumpers & 0x02))
        {
            bumpers |= 0x02;
            RC_SetPulseTime(RC_PORTV03, 1000);
            printf("Bumper Front Left-Black Hit\n");
        }
        else if (!(IO_PortsReadPort(PORTZ) & BUMPER_PIN_FLB) && (bumpers & 0x02))
        {
            bumpers &= ~0x02;
            printf("Bumper Front Left-Black Not Hit\n");
        }

        if ((IO_PortsReadPort(PORTZ) & BUMPER_PIN_FRR) && !(bumpers & 0x04))
        {
            bumpers |= 0x04;
            RC_SetPulseTime(RC_PORTV03, 1000);
            printf("Bumper Front Right-Red Hit\n");
        }
        else if (!(IO_PortsReadPort(PORTZ) & BUMPER_PIN_FRR) && (bumpers & 0x04))
        {
            bumpers &= ~0x04;
            printf("Bumper Front Right-Red Not Hit\n");
        }

        if ((IO_PortsReadPort(PORTZ) & BUMPER_PIN_FRB) && !(bumpers & 0x08))
        {
            bumpers |= 0x08;
            RC_SetPulseTime(RC_PORTV03, 1000);
            printf("Bumper Front Right-Black Hit\n");
        }
        else if (!(IO_PortsReadPort(PORTZ) & BUMPER_PIN_FRB) && (bumpers & 0x08))
        {
            bumpers &= ~0x08;
            printf("Bumper Front Right-Black Not Hit\n");
        }

        if ((IO_PortsReadPort(PORTZ) & BUMPER_PIN_BLR) && !(bumpers & 0x10))
        {
            bumpers |= 0x10;
            RC_SetPulseTime(RC_PORTV03, 2000);
            printf("Bumper Back Left-Red Hit\n");
        }
        else if (!(IO_PortsReadPort(PORTZ) & BUMPER_PIN_BLR) && (bumpers & 0x10))
        {
            bumpers &= ~0x10;
            printf("Bumper Back Left-Red Not Hit\n");
        }

        if ((IO_PortsReadPort(PORTZ) & BUMPER_PIN_BLB) && !(bumpers & 0x20))
        {
            bumpers |= 0x20;
            RC_SetPulseTime(RC_PORTV03, 2000);
            printf("Bumper Back Left-Black Hit\n");
        }
        else if (!(IO_PortsReadPort(PORTZ) & BUMPER_PIN_BLB) && (bumpers & 0x20))
        {
            bumpers &= ~0x20;
            printf("Bumper Back Left-Black Not Hit\n");
        }

        if ((IO_PortsReadPort(PORTZ) & BUMPER_PIN_BRR) && !(bumpers & 0x40))
        {
            bumpers |= 0x40;
            RC_SetPulseTime(RC_PORTV03, 2000);
            printf("Bumper Back Right-Red Hit\n");
        }
        else if (!(IO_PortsReadPort(PORTZ) & BUMPER_PIN_BRR) && (bumpers & 0x40))
        {
            bumpers &= ~0x40;
            printf("Bumper Back Right-Red Not Hit\n");
        }

        if ((IO_PortsReadPort(PORTZ) & BUMPER_PIN_BRB) && !(bumpers & 0x80))
        {
            bumpers |= 0x80;
            RC_SetPulseTime(RC_PORTV03, 2000);
            printf("Bumper Back Right-Black Hit\n");
        }
        else if (!(IO_PortsReadPort(PORTZ) & BUMPER_PIN_BRB) && (bumpers & 0x80))
        {
            bumpers &= ~0x80;
            printf("Bumper Back Right-Black Not Hit\n");
        }

        // Tape Sensors Testing

        if ((IO_PortsReadPort(PORTX) & PIN4) && !(tape & 0x01))
        {
            tape |= 0x01;
            printf("Front Right Tape Sensor On\n");
        }
        else if (!(IO_PortsReadPort(PORTX) & PIN4) && (tape & 0x01))
        {
            tape &= ~0x01;
            printf("Front Right Tape Sensor Off\n");
        }

        if ((IO_PortsReadPort(PORTY) & PIN11) && !(tape & 0x02))
        {
            tape |= 0x02;
            printf("Back Right Tape Sensor On\n");
        }
        else if (!(IO_PortsReadPort(PORTY) & PIN11) && (tape & 0x02))
        {
            tape &= ~0x02;
            printf("Back Right Tape Sensor Off\n");
        }

        if ((IO_PortsReadPort(PORTY) & PIN9) && !(tape & 0x04))
        {
            tape |= 0x04;
            printf("Back Left Tape Sensor On\n");
        }
        else if (!(IO_PortsReadPort(PORTY) & PIN9) && (tape & 0x04))
        {
            tape &= ~0x04;
            printf("Back Left Tape Sensor Off\n");
        }

        if ((IO_PortsReadPort(PORTZ) & PIN12) && !(tape & 0x08))
        {
            tape |= 0x08;
            printf("Front Left Tape Sensor On\n");
        }
        else if (!(IO_PortsReadPort(PORTZ) & PIN12) && (tape & 0x08))
        {
            tape &= ~0x08;
            printf("Front Left Tape Sensor Off\n");
        }
        while (1) {
            
            //printf("%x \n",(IO_PortsReadPort(PORTZ) & PIN12));
            if (((IO_PortsReadPort(PORTY) & PIN9) >> 9)){
                printf("on\n");
            }else{
                printf("off\n");
            }

        }
    }
    return 0;
}