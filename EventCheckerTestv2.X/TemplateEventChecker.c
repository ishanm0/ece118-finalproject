/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "TemplateEventChecker.h"
#include "ES_Events.h"
#include "serial.h"
#include "AD.h"

#include "TemplateService.h"
// #include "NavigationTestHSM.h"
#include <stdio.h>
#include "IO_Ports.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
#define BATTERY_DISCONNECT_THRESHOLD 175

#define BUMPER_PORT PORTZ
#define NUM_CHECKS 5
#define DISTANCE_THRESHOLD 1

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
static uint16_t distanceState = 0;

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
        PostTemplateService(thisEvent);
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
        thisEvent.EventParam = (xor&newBumperState) | ((xor&bumperState) << 8);
        // any high bit in the right 8 bits represents a bumper that was pressed
        // any high bit in the left 8 bits represents a bumper that was released
        bumperState = newBumperState;
        thisEvent.EventType = BUMPER;
        returnVal = TRUE;
        PostTemplateService(thisEvent);
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

    // printf("\r\n%x", newTapeState);
    if (newTapeState != tapeState)
    {
        uint16_t xor = newTapeState ^ tapeState;
        thisEvent.EventParam = (xor&newTapeState) | ((xor&tapeState) << 4);
        // any high bit in the right 4 bits represents a tape sensor that is now on tape
        // any high bit in the left 4 bits represents a tape sensor that is now off tape
        tapeState = newTapeState;
        thisEvent.EventType = TAPE;
        returnVal = TRUE;
        PostTemplateService(thisEvent);
    }
    return returnVal;
}