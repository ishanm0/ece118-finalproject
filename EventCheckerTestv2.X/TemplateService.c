/*
 * File: TemplateService.h
 * Author: J. Edward Carryer
 * Modified: Gabriel H Elkaim
 *
 * Template file to set up a simple service to work with the Events and Services
 * Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that this file
 * will need to be modified to fit your exact needs, and most of the names will have
 * to be changed to match your code.
 *
 * This is provided as an example and a good place to start.
 *
 * Created on 23/Oct/2011
 * Updated on 13/Nov/2013
 */

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "BOARD.h"
#include "AD.h"
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "TemplateService.h"
#include <stdio.h>

#include "IO_Ports.h"
#include "pwm.h"
#include "RC_Servo.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/

#define BATTERY_DISCONNECT_THRESHOLD 175

#define BUMPER_FLR BIT_0
#define BUMPER_FLB BIT_1
#define BUMPER_FRR BIT_2
#define BUMPER_FRB BIT_3
#define BUMPER_BLR BIT_4
#define BUMPER_BLB BIT_5
#define BUMPER_BRR BIT_6
#define BUMPER_BRB BIT_7

#define TAPE_FR BIT_0
#define TAPE_BL BIT_1
#define TAPE_BR BIT_2
#define TAPE_FL BIT_3

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine */

void left(int speed);
void right(int speed);

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/
/* You will need MyPriority and maybe a state variable; you may need others
 * as well. */

static uint8_t MyPriority;

static int leftDriving;
static int rightDriving;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitTemplateService(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateService function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitTemplateService(uint8_t Priority)
{
    ES_Event ThisEvent;

    MyPriority = Priority;

    // in here you write your initialization code
    // this includes all hardware and software initialization
    // that needs to occur.

    left(0);
    right(0);

    // post the initial transition event
    ThisEvent.EventType = ES_INIT;
    if (ES_PostToService(MyPriority, ThisEvent) == TRUE)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

/**
 * @Function PostTemplateService(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostTemplateService(ES_Event ThisEvent)
{
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @Function RunTemplateService(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the service,
 *        as this is called any time a new event is passed to the event queue.
 * @note Remember to rename to something appropriate.
 *       Returns ES_NO_EVENT if the event have been "consumed."
 * @author J. Edward Carryer, 2011.10.23 19:25 */
ES_Event RunTemplateService(ES_Event ThisEvent)
{
    ES_Event ReturnEvent;
    ReturnEvent.EventType = ES_NO_EVENT; // assume no errors

    /********************************************
     in here you write your service code
     *******************************************/
    static ES_EventTyp_t lastEvent = BATTERY_DISCONNECTED;
    ES_EventTyp_t curEvent;
    uint16_t batVoltage = AD_ReadADPin(BAT_VOLTAGE); // read the battery voltage

    switch (ThisEvent.EventType)
    {
    case ES_INIT:
        // No hardware initialization or single time setups, those
        // go in the init function above.
        //
        // This section is used to reset service for some reason
        break;

    // case BUMPER:
    //     printf("\r\nBumper: %04x", ThisEvent.EventParam);
    //     if ((ThisEvent.EventParam & (BUMPER_FLR | BUMPER_FLB)) && !leftDriving)
    //     {
    //         // left wheel forward
    //         printf("\r\nLeft wheel forward");
    //         leftDriving = 1;
    //         left(1000);
    //     }
    //     else if (((ThisEvent.EventParam >> 8) & (BUMPER_FLR | BUMPER_FLB)) && (leftDriving == 1))
    //     {
    //         // left wheel stop
    //         printf("\r\nLeft wheel stop");
    //         leftDriving = 0;
    //         left(0);
    //     }

    //     if ((ThisEvent.EventParam & (BUMPER_BLR | BUMPER_BLB)) && !leftDriving)
    //     {
    //         // left wheel backward
    //         printf("\r\nLeft wheel backward");
    //         leftDriving = -1;
    //         left(-1000);
    //     }
    //     else if (((ThisEvent.EventParam >> 8) & (BUMPER_BLR | BUMPER_BLB)) && (leftDriving == -1))
    //     {
    //         // left wheel stop
    //         printf("\r\nLeft wheel stop");
    //         leftDriving = 0;
    //         left(0);
    //     }

    //     if ((ThisEvent.EventParam & (BUMPER_FRR | BUMPER_FRB)) && !rightDriving)
    //     {
    //         // right wheel forward
    //         printf("\r\nRight wheel forward");
    //         rightDriving = 1;
    //         right(1000);
    //     }
    //     else if (((ThisEvent.EventParam >> 8) & (BUMPER_FRR | BUMPER_FRB)) && (rightDriving == 1))
    //     {
    //         // right wheel stop
    //         printf("\r\nRight wheel stop");
    //         rightDriving = 0;
    //         right(0);
    //     }

    //     if ((ThisEvent.EventParam & (BUMPER_BRR | BUMPER_BRB)) && !rightDriving)
    //     {
    //         // right wheel backward
    //         printf("\r\nRight wheel backward");
    //         rightDriving = -1;
    //         right(-1000);
    //     }
    //     else if (((ThisEvent.EventParam >> 8) & (BUMPER_BRR | BUMPER_BRB)) && (rightDriving == -1))
    //     {
    //         // right wheel stop
    //         printf("\r\nRight wheel stop");
    //         rightDriving = 0;
    //         right(0);
    //     }
    //     break;

    // case TAPE:
    //     printf("\r\nTape: %x", ThisEvent.EventParam);
    //     if ((ThisEvent.EventParam & (TAPE_FL | TAPE_FR)))
    //     {
    //         // intake motor on
    //         IO_PortsSetPortBits(PORTY, PIN12);
    //     }
    //     else if (((ThisEvent.EventParam >> 4) & (TAPE_FL | TAPE_FR)))
    //     {
    //         // intake motor off
    //         IO_PortsClearPortBits(PORTY, PIN12);
    //     }

    //     if ((ThisEvent.EventParam & (TAPE_BL | TAPE_BR)))
    //     {
    //         // door open
    //         RC_SetPulseTime(RC_PORTV03, 2000);
    //     }
    //     else if (((ThisEvent.EventParam >> 4) & (TAPE_BL | TAPE_BR)))
    //     {
    //         // door close
    //         RC_SetPulseTime(RC_PORTV03, 1000);
    //     }
    //     break;

    case ES_TIMEOUT:
        if (batVoltage > BATTERY_DISCONNECT_THRESHOLD)
        { // is battery connected?
            curEvent = BATTERY_CONNECTED;
        }
        else
        {
            curEvent = BATTERY_DISCONNECTED;
        }
        if (curEvent != lastEvent)
        { // check for change from last time
            ReturnEvent.EventType = curEvent;
            ReturnEvent.EventParam = batVoltage;
            lastEvent = curEvent; // update history
#ifndef SIMPLESERVICE_TEST        // keep this as is for test harness
            PostGenericService(ReturnEvent);
#else
            PostTemplateService(ReturnEvent);
#endif
        }
        break;
#ifdef SIMPLESERVICE_TEST // keep this as is for test harness
    default:
        printf("\r\nEvent: %s\tParam: 0x%X",
               EventNames[ThisEvent.EventType], ThisEvent.EventParam);
        break;
#endif
    }

    return ReturnEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONs                                                           *
 ******************************************************************************/

void left(int speed)
{
    if (speed < 0)
    {
        speed = -speed;
        IO_PortsClearPortBits(PORTY, PIN4);
        IO_PortsSetPortBits(PORTY, PIN6);
    }
    else
    {
        IO_PortsSetPortBits(PORTY, PIN4);
        IO_PortsClearPortBits(PORTY, PIN6);
    }

    PWM_SetDutyCycle(PWM_PORTX11, speed);
}

void right(int speed)
{
    if (speed < 0)
    {
        speed = -speed;
        IO_PortsClearPortBits(PORTY, PIN7);
        IO_PortsSetPortBits(PORTY, PIN8);
    }
    else
    {
        IO_PortsSetPortBits(PORTY, PIN7);
        IO_PortsClearPortBits(PORTY, PIN8);
    }

    PWM_SetDutyCycle(PWM_PORTY10, speed);
}