/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "MainHSM.h"
#include "DepositSubHSM.h"
#include "Common.h"
#include "IO_Ports.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum
{
    InitPSubState,
    Start,
    AlignRightToTape,
    AlignLeftToTape,
    BackFromTape,
    TurnRightAlignWithDoor,
    BackToDoor,
    FrontFromDoor,
    Depositing,
    TurnBackToWall,
} DepositSubHSMState_t;

static const char *StateNames[] = {
    "InitPSubState",
    "Start",
    "AlignRightToTape",
    "AlignLeftToTape",
    "BackFromTape",
    "TurnRightAlignWithDoor",
    "BackToDoor",
    "FrontFromDoor",
    "Depositing",
    "TurnBackToWall",
};

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

static DepositSubHSMState_t CurrentState = InitPSubState; // <- change name to match ENUM
static uint8_t MyPriority;
static int initCount;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitDepositSubHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitDepositSubHSM(void)
{
    ES_Event returnEvent;

    CurrentState = InitPSubState;
    returnEvent = RunDepositSubHSM(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT)
    {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunDepositSubHSM(ES_Event ThisEvent)
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
ES_Event RunDepositSubHSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE; // use to flag transition
    DepositSubHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState)
    {
    case InitPSubState:                     // If current state is initial Psedudo State
        if (ThisEvent.EventType == ES_INIT) // only respond to ES_Init
        {
            // this is where you would put any actions associated with the
            // transition from the initial pseudo-state into the actual
            // initial state

            // now put the machine into the actual initial state
            nextState = Start;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
        }
        break;

    case Start:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            if (initCount)
            {
                uint16_t left_tape = IO_PortsReadPort(PORTZ) & PIN12;
                uint16_t right_tape = IO_PortsReadPort(PORTX) & PIN4;
                if (left_tape && right_tape)
                {
                    SWITCH(BackFromTape);
                }
                else if (left_tape)
                {
                    SWITCH(AlignRightToTape);
                }
                else if (right_tape)
                {
                    SWITCH(AlignLeftToTape);
                }
                else
                {
                    SWITCH(BackFromTape);
                }
            }
            else
            {
                initCount++;
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(AlignRightToTape);
            }
            else if (ThisEvent.EventParam & TAPE_FR)
            {
                SWITCH(AlignLeftToTape);
            }
            break;

        default:
            break;
        }
        break;

    case AlignRightToTape:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(0);
            right(TURN_SPEED);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_FR)
            {
                SWITCH(BackFromTape);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case AlignLeftToTape:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(TURN_SPEED);
            right(0);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(BackFromTape);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case BackFromTape:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(-DRIVE_SPEED);
            right(-DRIVE_SPEED);
            ES_Timer_InitTimer(NAV_TIMER, BACK_FROM_TAPE_MS);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == NAV_TIMER)
            {
                SWITCH(TurnRightAlignWithDoor);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case TurnRightAlignWithDoor:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(TURN_SPEED);
            right(-TURN_SPEED);
            ES_Timer_InitTimer(NAV_TIMER, RIGHT_TANK_TURN_MS);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == NAV_TIMER)
            {
                SWITCH(BackToDoor);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case BackToDoor:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(-DRIVE_SPEED);
            right(-DRIVE_SPEED);
            ES_Timer_InitTimer(NAV_TIMER, BACK_TO_DOOR_MS);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == NAV_TIMER)
            {
                SWITCH(FrontFromDoor);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case FrontFromDoor:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(DRIVE_SPEED);
            right(DRIVE_SPEED);
            ES_Timer_InitTimer(NAV_TIMER, FRONT_FROM_DOOR_MS);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == NAV_TIMER)
            {
                SWITCH(Depositing);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case Depositing:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(0);
            right(0);
            door(TRUE);
            ES_Timer_InitTimer(DEPOSIT_TIMER, DEPOSIT_TIME);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == DEPOSIT_TIMER)
            {
                door(FALSE);
                SWITCH(TurnBackToWall);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;

    case TurnBackToWall:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(-TURN_SPEED);
            right(TURN_SPEED);
            ES_Timer_InitTimer(NAV_TIMER, RIGHT_TANK_TURN_MS);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == NAV_TIMER)
            {
                ThisEvent.EventType = DEPOSIT_DONE;
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
        RunDepositSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunDepositSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
