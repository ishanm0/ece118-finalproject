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
    AD_Init();

//    AD_AddPins(AD_PORTV3);
//    AD_AddPins(AD_PORTV4);
//    AD_AddPins(AD_PORTV5);
//    AD_AddPins(AD_PORTV6);
    
    IO_PortsSetPortInputs(PORTZ, PIN3); // Bumper Front Left-Left
    IO_PortsSetPortInputs(PORTZ, PIN4); // Bumper Front Left-Right
    IO_PortsSetPortInputs(PORTZ, PIN5); // Bumper Front Right-Left
    IO_PortsSetPortInputs(PORTZ, PIN6); // Bumper Front Right-Right
    IO_PortsSetPortInputs(PORTZ, PIN7); // Bumper Back Left-Left
    IO_PortsSetPortInputs(PORTZ, PIN8); // Bumper Back Left-Right
    IO_PortsSetPortInputs(PORTZ, PIN9); // Bumper Back Right-Left
    IO_PortsSetPortInputs(PORTZ, PIN11); // Bumper Back Right-Right

    while (1) {
        //Sensors Testing
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
        
        //Bumpers Testing
        if (IO_PortsReadPort(PORTZ) & PIN3) {
            printf("Bumper Front Left-Left Hit\n");
        }
        
        if (IO_PortsReadPort(PORTZ) & PIN4) {
            printf("Bumper Front Left-Right Hit\n");
        }
        
        if (IO_PortsReadPort(PORTZ) & PIN5) {
            printf("Bumper Front Right-Left Hit\n");
        }
        
        if (IO_PortsReadPort(PORTZ) & PIN6) {
            printf("Bumper Front Right-Right Hit\n");
        }
        
        if (IO_PortsReadPort(PORTZ) & PIN7) {
            printf("Bumper Back Left-Left Hit\n");
        }
        
        if (IO_PortsReadPort(PORTZ) & PIN8) {
            printf("Bumper Back Left-Right Hit\n");
        }
        
        if (IO_PortsReadPort(PORTZ) & PIN9) {
            printf("Bumper Back Right-Left Hit\n");
        }
        
        if (IO_PortsReadPort(PORTZ) & PIN11) {
            printf("Bumper Back Right-Right Hit\n");
        }
    }
    return 0;
}