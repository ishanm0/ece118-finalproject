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

#define BUMPER_PIN_FLR PIN3 // port z
#define BUMPER_PIN_FLB PIN4 // port z
#define BUMPER_PIN_FRR PIN5 // port z
#define BUMPER_PIN_FRB PIN6 // port z
#define BUMPER_PIN_BLR PIN7 // port z
#define BUMPER_PIN_BLB PIN8 // port z
#define BUMPER_PIN_BRR PIN9 // port z
#define BUMPER_PIN_BRB PIN11 // port z

#define IR_SENSOR_FL PIN12 // port z
#define IR_SENSOR_FR PIN4 // port x
#define IR_SENSOR_BL PIN9 // port y
#define IR_SENSOR_BR PIN11 // port y

#define MAX_PWM 1000

#define MIN_SERVO 1000
#define MAX_SERVO 2000

#define DELAY(x)                          \
for (int wait = 0; wait <= x; wait++) {   \
    asm("nop");                           \
}                                         \


typedef enum {
    STATE_FORWARD,
    STATE_REVERSE,
    STATE_DETECT_FR,
    STATE_DETECT_FL,
    STATE_DETECT_FR_FL,
    STATE_DETECT_FR_BR,
    STATE_DROPOFF,
} IRState;

void right(int percentage) {
    int speed = (-percentage / 100) * MAX_PWM;
    if (percentage < 0) {
        speed = -speed;
        IO_PortsSetPortBits(PORTY, PIN8);
        IO_PortsClearPortBits(PORTY, PIN7);
    } else {
        IO_PortsSetPortBits(PORTY, PIN7);
        IO_PortsClearPortBits(PORTY, PIN8);
    }
    PWM_SetDutyCycle(PWM_PORTY10, speed);
}

void left(int percentage) {
    int speed = (-percentage / 100) * MAX_PWM;
    if (percentage < 0) {
        speed = -speed;
        IO_PortsSetPortBits(PORTY, PIN4);
        IO_PortsClearPortBits(PORTY, PIN6);
    } else {
        IO_PortsSetPortBits(PORTY, PIN6);
        IO_PortsClearPortBits(PORTY, PIN4);
    }
    PWM_SetDutyCycle(PWM_PORTX11, speed);
}

int main(void) {
    printf("Attempting setup and everything... \r\n");
    RC_Init();
    BOARD_Init();
    AD_Init();
    PWM_Init();

    PWM_AddPins(PWM_PORTY10 | PWM_PORTX11); // Motors for right and left
    
    RC_AddPins(RC_PORTV03); // For the trap door (servo)

    IO_PortsSetPortInputs(PORTZ, BUMPER_PIN_FLR | BUMPER_PIN_FLB | BUMPER_PIN_FRR
            | BUMPER_PIN_FRB | BUMPER_PIN_BLR | BUMPER_PIN_BLB
            | BUMPER_PIN_BRR | BUMPER_PIN_BRB); // all the bumpers

    IO_PortsSetPortInputs(PORTX, IR_SENSOR_FR); // front right tape sensor
    IO_PortsSetPortInputs(PORTZ, IR_SENSOR_FL); // front left tape sensor
    IO_PortsSetPortInputs(PORTY, IR_SENSOR_BL | IR_SENSOR_BR); // back left & back right tape sensor

    RC_SetPulseTime(RC_PORTV03, MAX_SERVO);
    IRState state = STATE_FORWARD;
    
    while (1) {
        switch (state) {
            case STATE_FORWARD:
                right(50);
                left(50);
                if (IO_PortsReadPort(PORTX) & IR_SENSOR_FR) {
                    state = STATE_DETECT_FR;
                }
                if (IO_PortsReadPort(PORTY) & IR_SENSOR_FL) {
                    state = STATE_DETECT_FL;
                }
                if ((IO_PortsReadPort(PORTZ) & IR_SENSOR_FL) && (IO_PortsReadPort(PORTX) & IR_SENSOR_FR)) {
                    state = STATE_DETECT_FR_FL;
                }
                if ((IO_PortsReadPort(PORTX) & IR_SENSOR_FR) && (IO_PortsReadPort(PORTY) & BUMPER_PIN_FLB & BUMPER_PIN_FRR)) {
                    state = STATE_DROPOFF;
                }
                break;
            case STATE_REVERSE:
                right(-50);
                left(-50);
                if ((IO_PortsReadPort(PORTY) & IR_SENSOR_BL & IR_SENSOR_BR)) {
                    right(0);
                    left(80);
                    if ((IO_PortsReadPort(PORTZ) & IR_SENSOR_FL) && (IO_PortsReadPort(PORTY) & IR_SENSOR_BL)){
                        state = STATE_FORWARD;
                    }
                }
                break;
            case STATE_DETECT_FR:
                right(0);
                left(-80);
                if ((IO_PortsReadPort(PORTX) & IR_SENSOR_FR) && (IO_PortsReadPort(PORTY) & IR_SENSOR_BR)) {
                    state = STATE_DETECT_FR_BR;
                }
                break;
            case STATE_DETECT_FL:
                right(0);
                left(-80);
                if ((IO_PortsReadPort(PORTX) & IR_SENSOR_FR) && (IO_PortsReadPort(PORTY) & IR_SENSOR_BR)) {
                    state = STATE_DETECT_FR_BR;
                }
                break;
            case STATE_DETECT_FR_FL:
                if ((IO_PortsReadPort(PORTZ) & IR_SENSOR_FL) && (IO_PortsReadPort(PORTX) & IR_SENSOR_FR) && (IO_PortsReadPort(PORTY) & IR_SENSOR_BR)) {
                    right(-80);
                    left(0);
                    state = STATE_REVERSE;
                }
                right(0);
                left(-80);
                if ((IO_PortsReadPort(PORTX) & IR_SENSOR_FR) && (IO_PortsReadPort(PORTY) & IR_SENSOR_BR)) {
                    state = STATE_DETECT_FR_BR;
                }
                break;
            case STATE_DETECT_FR_BR:
                right(50);
                left(50);
                if ((IO_PortsReadPort(PORTZ) & IR_SENSOR_FL) && (IO_PortsReadPort(PORTX) & IR_SENSOR_FR)) {
                    state = STATE_DETECT_FR_FL;
                }
                break;
            case STATE_DROPOFF:
                right(-50); 
                left(-50);
                
                right(80);
                left(0);
                
                right(50);
                left(50);
                
                right(80);
                left(0);
                
                right(-50);
                left(-50);
                
                if ((IO_PortsReadPort(PORTY) & BUMPER_PIN_FLB & BUMPER_PIN_FRR)){
                    RC_SetPulseTime(RC_PORTV03, MIN_SERVO);
                }
                break;
        }
    }
    return 0;
}