/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "EventChecker.h"
#include "ES_Events.h"
#include "serial.h"
#include "AD.h"

// #include "TemplateService.h"
// #include "NavigationTestHSM.h"
#include "MainHSM.h"
#include <stdio.h>
#include "IO_Ports.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
#define BATTERY_DISCONNECT_THRESHOLD 175

#define BUMPER_PORT PORTZ
#define NUM_CHECKS 5

#define WALL_DIST_CLOSE_MAX 40
#define WALL_DIST_IN_RANGE_MIN 60
#define WALL_DIST_IN_RANGE_MAX 500
#define WALL_DIST_FAR_MIN 550

#define WALL_DIST_L_PORT AD_PORTV5
#define WALL_DIST_R_PORT AD_PORTV4

/*******************************************************************************
 * EVENTCHECKER_TEST SPECIFIC CODE                                                             *
 ******************************************************************************/

#define DELAY(x)                          \
    for (int wait = 0; wait <= x; wait++) \
    {                                     \
        asm("nop");                       \
    }

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this EventChecker. They should be functions
   relevant to the behavior of this particular event checker */

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/

/* Any private module level variable that you might need for keeping track of
   events would be placed here. Private variables should be STATIC so that they
   are limited in scope to this module. */

static uint8_t bumperState;
static uint8_t bumperBuffer[NUM_CHECKS];
static uint8_t idx;
static uint16_t tapeState = 0;
static int distLStatus = 0;
static int distRStatus = 0;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function TemplateCheckBattery(void)
 * @param none
 * @return TRUE or FALSE
 * @brief This function is a prototype event checker that checks the battery voltage
 *        against a fixed threshold (#defined in the .c file). Note that you need to
 *        keep track of previous history, and that the actual battery voltage is checked
 *        only once at the beginning of the function. The function will post an event
 *        of either BATTERY_CONNECTED or BATTERY_DISCONNECTED if the power switch is turned
 *        on or off with the USB cord plugged into the Uno32. Returns TRUE if there was an
 *        event, FALSE otherwise.
 * @note Use this code as a template for your other event checkers, and modify as necessary.
 * @author Gabriel H Elkaim, 2013.09.27 09:18
 * @modified Gabriel H Elkaim/Max Dunne, 2016.09.12 20:08 */
uint8_t TemplateCheckBattery(void)
{
    static ES_EventTyp_t lastEvent = BATTERY_DISCONNECTED;
    ES_EventTyp_t curEvent;
    ES_Event thisEvent;
    uint8_t returnVal = FALSE;
    uint16_t batVoltage = AD_ReadADPin(BAT_VOLTAGE); // read the battery voltage

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
        thisEvent.EventType = curEvent;
        thisEvent.EventParam = batVoltage;
        returnVal = TRUE;
        lastEvent = curEvent; // update history
#ifndef EVENTCHECKER_TEST     // keep this as is for test harness
        PostMainHSM(thisEvent);
        // PostNavigationTestHSM(thisEvent);
        // PostPETERHSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif
    }
    return returnVal;
}

// static uint16_t bumperState = 0;

uint8_t CheckBumpers(void)
{
    uint8_t returnVal = FALSE;
    ES_Event thisEvent;
    uint16_t newBumperState = IO_PortsReadPort(BUMPER_PORT) >> 3;
    // printf("\r\n%x", newBumperState);
    newBumperState &= (~BIT_7); // mask off bit 7 (glitchy)
    newBumperState |= (newBumperState & BIT_8) >> 1;
    newBumperState &= 0xff; // mask off the repeated bit and any unused bits

    uint8_t j = 0xff;

    bumperBuffer[idx] = newBumperState;
    idx = (idx + 1) % NUM_CHECKS;

    for (int i = 0; i < NUM_CHECKS; i++)
    {
        j &= bumperBuffer[i];
    }

    newBumperState = j;

    // printf(" %x", newBumperState);

    if (newBumperState != bumperState)
    {
        uint16_t xor = newBumperState ^ bumperState;
        if (xor&bumperState)
        {
            // any high bit represents a bumper that was released
            thisEvent.EventType = BUMPER_OFF;
            thisEvent.EventParam = xor&bumperState;
            returnVal = TRUE;
            PostMainHSM(thisEvent);
            // PostNavigationTestHSM(thisEvent);
        }
        if (xor&newBumperState)
        {
            // any high bit represents a bumper that was pressed
            thisEvent.EventType = BUMPER_ON;
            thisEvent.EventParam = xor&newBumperState;
            returnVal = TRUE;
            PostMainHSM(thisEvent);
            // PostNavigationTestHSM(thisEvent);
        }
        bumperState = newBumperState;
    }
    return returnVal;
}

uint8_t CheckTapeSensors(void)
{
    uint8_t returnVal = FALSE;
    ES_Event thisEvent;
    uint16_t newTapeState = (IO_PortsReadPort(PORTX) & PIN4) >> 4; // shift from bit_4 to bit_0
    newTapeState |= (IO_PortsReadPort(PORTY) & PIN9) >> (9 - 1);   // shift from bit_9 to bit_1
    newTapeState |= (IO_PortsReadPort(PORTY) & PIN11) >> (11 - 2); // etc
    newTapeState |= (IO_PortsReadPort(PORTZ) & PIN12) >> (12 - 3);
    newTapeState &= 0xf; // mask off the unused bits - only 4 bits are used

    if (newTapeState != tapeState)
    {
        uint16_t xor = newTapeState ^ tapeState;
        if (xor&tapeState)
        {
            // any high bit represents a tape sensor that is now off tape
            thisEvent.EventParam = xor&tapeState;
            thisEvent.EventType = TAPE_OFF;
            returnVal = TRUE;
            PostMainHSM(thisEvent);
            // PostNavigationTestHSM(thisEvent);
        }
        if (xor&newTapeState)
        {
            // any high bit represents a tape sensor that is now on tape
            thisEvent.EventParam = xor&newTapeState;
            thisEvent.EventType = TAPE_ON;
            returnVal = TRUE;
            PostMainHSM(thisEvent);
            // PostNavigationTestHSM(thisEvent);
        }
        tapeState = newTapeState;
    }
    return returnVal;
}

uint8_t CheckWallSensors(void)
{
    if (!(AD_IsNewDataReady()))
    {
        return FALSE;
    }
    uint8_t returnVal = FALSE;
    ES_Event thisEvent;
    uint16_t distL = AD_ReadADPin(WALL_DIST_L_PORT);
    uint16_t distR = AD_ReadADPin(WALL_DIST_R_PORT);

    int newLStatus = 0;
    int newRStatus = 0;

    if (distLStatus == 0 && distL < WALL_DIST_CLOSE_MAX)
    {
        newLStatus = -1;
    }
    else if (distLStatus == -1 && distL > WALL_DIST_IN_RANGE_MIN)
    {
        newLStatus = 0;
    }
    else if (distLStatus == 0 && distL > WALL_DIST_FAR_MIN)
    {
        newLStatus = 1;
    }
    else if (distLStatus == 1 && distL < WALL_DIST_IN_RANGE_MAX)
    {
        newLStatus = 0;
    }
    else
    {
        newLStatus = distLStatus;
    }

    if (distRStatus == 0 && distR < WALL_DIST_CLOSE_MAX)
    {
        newRStatus = -1;
    }
    else if (distRStatus == -1 && distR > WALL_DIST_IN_RANGE_MIN)
    {
        newRStatus = 0;
    }
    else if (distRStatus == 0 && distR > WALL_DIST_FAR_MIN)
    {
        newRStatus = 1;
    }
    else if (distRStatus == 1 && distR < WALL_DIST_IN_RANGE_MAX)
    {
        newRStatus = 0;
    }
    else
    {
        newRStatus = distRStatus;
    }

    if (newLStatus != distLStatus)
    {
        if (newLStatus == -1)
        {
            thisEvent.EventType = WALL_CLOSE;
            thisEvent.EventParam = 0x01;
            returnVal = TRUE;
            PostMainHSM(thisEvent);
            // PostNavigationTestHSM(thisEvent);
        }
        else if (newLStatus == 1)
        {
            thisEvent.EventType = WALL_FAR;
            thisEvent.EventParam = 0x01;
            returnVal = TRUE;
            PostMainHSM(thisEvent);
            // PostNavigationTestHSM(thisEvent);
        }
        else
        {
            thisEvent.EventType = WALL_IN_RANGE;
            thisEvent.EventParam = 0x01;
            returnVal = TRUE;
            PostMainHSM(thisEvent);
            // PostNavigationTestHSM(thisEvent);
        }
        distLStatus = newLStatus;
    }

    if (newRStatus != distRStatus)
    {
        if (newRStatus == -1)
        {
            thisEvent.EventType = WALL_CLOSE;
            thisEvent.EventParam = 0x02;
            returnVal = TRUE;
            PostMainHSM(thisEvent);
            // PostNavigationTestHSM(thisEvent);
        }
        else if (newRStatus == 1)
        {
            thisEvent.EventType = WALL_FAR;
            thisEvent.EventParam = 0x02;
            returnVal = TRUE;
            PostMainHSM(thisEvent);
            // PostNavigationTestHSM(thisEvent);
        }
        else
        {
            thisEvent.EventType = WALL_IN_RANGE;
            thisEvent.EventParam = 0x02;
            returnVal = TRUE;
            PostMainHSM(thisEvent);
            // PostNavigationTestHSM(thisEvent);
        }
        distRStatus = newRStatus;
    }
    return returnVal;
}