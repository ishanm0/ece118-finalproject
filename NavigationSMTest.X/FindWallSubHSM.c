/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "MainHSM.h"
#include "FindWallSubHSM.h"
#include "Common.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum
{
    InitPState,
    DriveForward,
    DriveForwardLeftSide,
    DriveForwardRightSide,
    RotateLeft,
    RotateRight,
    RotateUntilHitBackLeft,
    RotateUntilHitBackRight,
    ReverseTurnLeft,
    ReverseTurnRight,
    TurnLeft,
    TurnRight,
    DriveForwardABit,
    RotateAgainstTheLeftSide,
    RotateAgainstTheRightSide,
} FindWallSubHSMState_t;

static const char *StateNames[] = {
    "InitPState",
    "DriveForward",
    "DriveForwardLeftSide",
    "DriveForwardRightSide",
    "RotateLeft",
    "RotateRight",
    "RotateUntilHitBackLeft",
    "RotateUntilHitBackRight",
    "ReverseTurnLeft",
    "ReverseTurnRight",
    "TurnLeft",
    "TurnRight",
    "DriveForwardABit",
    "RotateAgainstTheLeftSide",
    "RotateAgainstTheRightSide",
};

#define REVERSE_TURN_MS 500

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine */

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

static FindWallSubHSMState_t CurrentState = InitPState; // <- change name to match ENUM
static uint8_t MyPriority;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitFindWallSubHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitFindWallSubHSM(void)
{
    ES_Event returnEvent;

    CurrentState = InitPState;
    returnEvent = RunFindWallSubHSM(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT)
    {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunFindWallSubHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the heirarchical state
 *        machine, as this is called any time a new event is passed to the event
 *        queue. This function will be called recursively to implement the correct
 *        order for a state transition to be: exit current state -> enter next state
 *        using the ES_EXIT and ES_ENTRY events.
 * @note Remember to rename to something appropriate.
 *       The lower level state machines are run first, to see if the event is dealt
 *       with there rather than at the current level. ES_EXIT and ES_ENTRY events are
 *       not consumed as these need to pass pack to the higher level state machine.
 * @author J. Edward Carryer, 2011.10.23 19:25
 * @author Gabriel H Elkaim, 2011.10.23 19:25 */
ES_Event RunFindWallSubHSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE;  // use to flag transition
    FindWallSubHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState)
    {
    case InitPState:                                  // If current state is initial Pseudo State
        if (ThisEvent.EventType == BATTERY_CONNECTED) // only respond to ES_Init
        {
            // this is where you would put any actions associated with the
            // transition from the initial pseudo-state into the actual
            // initial state
            // Initialize all sub-state machines
            // InitTemplateSubHSM();
            // now put the machine into the actual initial state
            nextState = DriveForward;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
        }
        break;
    case DriveForward: // in the first state, replace this with correct names
        // run sub-state machine for this state
        // NOTE: the SubState Machine runs and responds to events before anything in the this
        // state machine does
        // ThisEvent = RunTemplateSubHSM(ThisEvent);
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            printf("\r\ndriving!");
            left(DRIVE_SPEED);
            right(DRIVE_SPEED);
            intake(TRUE);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(RotateRight);
            }
            else if (ThisEvent.EventParam & TAPE_FR)
            {
                SWITCH(RotateLeft);
            }
            else if (ThisEvent.EventParam & TAPE_BL)
            {
                SWITCH(ReverseTurnRight);
            }
            else if (ThisEvent.EventParam & TAPE_BR)
            {
                SWITCH(ReverseTurnLeft);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & BUMPER_TRF)
            {
                SWITCH(ReverseTurnRight);
            }
            else if (ThisEvent.EventParam & BUMPER_TLF)
            {
                SWITCH(ReverseTurnLeft);
            }
            else if (ThisEvent.EventParam & BUMPER_BLF)
            {
                SWITCH(RotateAgainstTheLeftSide);
            }
            else if (ThisEvent.EventParam & BUMPER_BRF)
            {
                SWITCH(RotateAgainstTheRightSide);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case DriveForwardLeftSide: // in the first state, replace this with correct names
        // run sub-state machine for this state
        // NOTE: the SubState Machine runs and responds to events before anything in the this
        // state machine does
        // ThisEvent = RunTemplateSubHSM(ThisEvent);
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            printf("\r\ndriving!");
            left(DRIVE_SPEED);
            right(DRIVE_SPEED);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(RotateUntilHitBackRight);
            }
            else if (ThisEvent.EventParam & TAPE_FR)
            {
                SWITCH(RotateUntilHitBackLeft);
            }
            else if (ThisEvent.EventParam & TAPE_BL)
            {
                SWITCH(ReverseTurnRight);
            }
            else if (ThisEvent.EventParam & TAPE_BR)
            {
                SWITCH(ReverseTurnLeft);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & BUMPER_TRF)
            {
                SWITCH(ReverseTurnRight);
            }
            else if (ThisEvent.EventParam & BUMPER_TLF)
            {
                SWITCH(ReverseTurnLeft);
            }
            else if (ThisEvent.EventParam & BUMPER_BLF)
            {
                SWITCH(RotateAgainstTheLeftSide);
            }
            else if (ThisEvent.EventParam & BUMPER_BRF)
            {
                SWITCH(RotateAgainstTheRightSide);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case DriveForwardRightSide: // in the first state, replace this with correct names
        // run sub-state machine for this state
        // NOTE: the SubState Machine runs and responds to events before anything in the this
        // state machine does
        // ThisEvent = RunTemplateSubHSM(ThisEvent);
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            printf("\r\ndriving!");
            left(DRIVE_SPEED);
            right(DRIVE_SPEED);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_FR)
            {
                SWITCH(RotateUntilHitBackLeft);
            }
            else if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(RotateUntilHitBackRight);
            }
            else if (ThisEvent.EventParam & TAPE_BL)
            {
                SWITCH(ReverseTurnRight);
            }
            else if (ThisEvent.EventParam & TAPE_BR)
            {
                SWITCH(ReverseTurnLeft);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & BUMPER_TRF)
            {
                SWITCH(ReverseTurnRight);
            }
            else if (ThisEvent.EventParam & BUMPER_TLF)
            {
                SWITCH(ReverseTurnLeft);
            }
            else if (ThisEvent.EventParam & BUMPER_BLF)
            {
                SWITCH(RotateAgainstTheLeftSide);
            }
            else if (ThisEvent.EventParam & BUMPER_BRF)
            {
                SWITCH(RotateAgainstTheRightSide);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case RotateLeft:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(-TURN_SPEED);
            right(TURN_SPEED);
            ES_Timer_InitTimer(NAV_ROTATE_TIMER, RIGHT_TANK_TURN_MS);
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & BUMPER_TRF)
            {
                SWITCH(ReverseTurnRight);
            }
            else if (ThisEvent.EventParam & BUMPER_TLF)
            {
                SWITCH(ReverseTurnLeft);
            }
            else if (ThisEvent.EventParam & (BUMPER_BRF | BUMPER_BRS))
            {
                SWITCH(RotateAgainstTheRightSide);
            }
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == NAV_ROTATE_TIMER)
            {
                SWITCH(DriveForward);
            }
            break;
        default:
            break;
        }
        break;
    case RotateRight:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(TURN_SPEED);
            right(-TURN_SPEED);
            ES_Timer_InitTimer(NAV_ROTATE_TIMER, RIGHT_TANK_TURN_MS);
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & BUMPER_TRF)
            {
                SWITCH(ReverseTurnRight);
            }
            else if (ThisEvent.EventParam & BUMPER_TLF)
            {
                SWITCH(ReverseTurnLeft);
            }
            else if (ThisEvent.EventParam & (BUMPER_BLF | BUMPER_BLS))
            {
                SWITCH(RotateAgainstTheLeftSide);
            }
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == NAV_ROTATE_TIMER)
            {
                SWITCH(DriveForward);
            }
            break;
        default:
            break;
        }
        break;
    case RotateUntilHitBackLeft:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(-TURN_SPEED);
            right(TURN_SPEED);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_BL)
            {
                SWITCH(DriveForwardRightSide);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case RotateUntilHitBackRight:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(TURN_SPEED);
            right(-TURN_SPEED);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_BR)
            {
                SWITCH(DriveForwardLeftSide);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case ReverseTurnRight:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(-1000);
            right(-700);
            ES_Timer_InitTimer(NAV_ROTATE_TIMER, REVERSE_TURN_MS);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_BL)
            {
                SWITCH(RotateRight);
            }
            else if (ThisEvent.EventParam & TAPE_BR)
            {
                SWITCH(RotateLeft);
            }
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == NAV_ROTATE_TIMER)
            {
                SWITCH(DriveForward);
            }
            break;
        default:
            break;
        }
        break;
    case ReverseTurnLeft:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(-650);
            right(-TURN_SPEED);
            ES_Timer_InitTimer(NAV_ROTATE_TIMER, REVERSE_TURN_MS);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_BL)
            {
                SWITCH(RotateRight);
            }
            else if (ThisEvent.EventParam & TAPE_BR)
            {
                SWITCH(RotateLeft);
            }
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == NAV_ROTATE_TIMER)
            {
                SWITCH(DriveForward);
            }
            break;
        default:
            break;
        }
        break;
    case RotateAgainstTheLeftSide:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(TURN_SPEED);
            right(-TURN_SPEED);
            ES_Timer_InitTimer(NAV_ROTATE_TIMER, 600);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == NAV_ROTATE_TIMER)
            {
                SWITCH(DriveForwardLeftSide);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case RotateAgainstTheRightSide:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(-TURN_SPEED);
            right(TURN_SPEED);
            ES_Timer_InitTimer(NAV_ROTATE_TIMER, 600);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == NAV_ROTATE_TIMER)
            {
                SWITCH(DriveForwardRightSide);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    default: // all unhandled states fall into here
        break;
    } // end switch on Current State

    if (makeTransition == TRUE)
    { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunFindWallSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunFindWallSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
