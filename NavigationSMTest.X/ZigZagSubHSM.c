/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "MainHSM.h"
#include "ZigZagSubHSM.h"
#include "Common.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum
{
    InitPState,
    DriveForwardPreparingRightTurn,
    DriveForwardPreparingLeftTurn,
    RotateLeft,
    RotateRight,
    RotateRandom,
    ReverseABit,
    ReverseTurnLeft,
    ReverseTurnRight,
} ZigZagSubHSMState_t;

static const char *StateNames[] = {
    "InitPState",
	"DriveForwardPreparingRightTurn",
	"DriveForwardPreparingLeftTurn",
	"RotateLeft",
	"RotateRight",
	"RotateRandom",
	"ReverseABit",
	"ReverseTurnLeft",
	"ReverseTurnRight",
};

#define REVERSE_TURN_MS 330

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

static ZigZagSubHSMState_t CurrentState = InitPState; // <- change name to match ENUM
static uint8_t MyPriority;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitZigZagSubHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitZigZagSubHSM(void)
{
    ES_Event returnEvent;

    CurrentState = InitPState;
    returnEvent = RunZigZagSubHSM(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT)
    {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunZigZagSubHSM(ES_Event ThisEvent)
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
ES_Event RunZigZagSubHSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE; // use to flag transition
    ZigZagSubHSMState_t nextState;  // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPState: // If current state is initial Pseudo State
            if (ThisEvent.EventType == ES_INIT) // only respond to ES_Init
            {
                // intake(TRUE);
                nextState = DriveForwardPreparingRightTurn;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;
        case DriveForwardPreparingRightTurn:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    printf("\r\ndriving!");
                    left(DRIVE_SPEED);
                    right(DRIVE_SPEED);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_FL | TAPE_FR) {
                        nextState = RotateRight;
                        makeTransition = TRUE;
                    }
                    break;
                case BUMPER_ON:
                    if (ThisEvent.EventParam & BUMPER_TRF) {
                        nextState = ReverseTurnRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_TLF) {
                        nextState = ReverseTurnLeft;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_BLF | BUMPER_BRF | BUMPER_BLS | BUMPER_BRS) {
                        nextState = ReverseABit;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case DriveForwardPreparingLeftTurn:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    printf("\r\ndriving!");
                    left(DRIVE_SPEED);
                    right(DRIVE_SPEED);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_FL | TAPE_FR) {
                        nextState = RotateLeft;
                        makeTransition = TRUE;
                    }
                    break;
                case BUMPER_ON:
                    if (ThisEvent.EventParam & BUMPER_TRF) {
                        nextState = ReverseTurnRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_TLF) {
                        nextState = ReverseTurnLeft;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_BLF | BUMPER_BRF | BUMPER_BLS | BUMPER_BRS) {
                        nextState = ReverseABit;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case RotateRight:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(-TURN_SPEED);
                    right(TURN_SPEED);
                    ES_Timer_InitTimer(NAV_ROTATE_TIMER, 1000);
                    break;
                case BUMPER_ON:
                    if (ThisEvent.EventParam & BUMPER_TRF) {
                        nextState = ReverseTurnRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_TLF) {
                        nextState = ReverseTurnLeft;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_BLF | BUMPER_BRF | BUMPER_BLS | BUMPER_BRS) {
                        nextState = ReverseABit;
                        makeTransition = TRUE;
                    }
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_BL) {
                        nextState = DriveForwardPreparingLeftTurn;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == NAV_ROTATE_TIMER){
                        nextState = DriveForwardPreparingLeftTurn;
                        makeTransition = TRUE;
                    }
                    break;
                default:
                    break;
            }
            break;
        case RotateLeft:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(TURN_SPEED);
                    right(-TURN_SPEED);
                    ES_Timer_InitTimer(NAV_ROTATE_TIMER, 1000);
                    break;
                case BUMPER_ON:
                    if (ThisEvent.EventParam & BUMPER_TRF) {
                        nextState = ReverseTurnRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_TLF) {
                        nextState = ReverseTurnLeft;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_BLF | BUMPER_BRF | BUMPER_BLS | BUMPER_BRS) {
                        nextState = ReverseABit;
                        makeTransition = TRUE;
                    }
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_BR) {
                        nextState = DriveForwardPreparingRightTurn;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == NAV_ROTATE_TIMER){
                        nextState = DriveForwardPreparingLeftTurn;
                        makeTransition = TRUE;
                    }
                    break;
                default:
                    break;
            }
            break;
        case RotateRandom:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(0);
                    right(-DRIVE_SPEED);
                    ES_Timer_InitTimer(NAV_ROTATE_TIMER, 1200);
                    break;
                case ES_TIMEOUT:
                    nextState = DriveForwardPreparingRightTurn;
                    makeTransition = TRUE;
                    break;
            }
            break;
        case ReverseABit:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(-DRIVE_SPEED);
                    right(-DRIVE_SPEED);
                    ES_Timer_InitTimer(NAV_ROTATE_TIMER, 200);
                    break;
                case ES_TIMEOUT:
                    nextState = RotateRandom;
                    makeTransition = TRUE;
                    break;
            }
            break;
        case ReverseTurnRight:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(-DRIVE_SPEED);
                    right(-500);
                    ES_Timer_InitTimer(NAV_ROTATE_TIMER, REVERSE_TURN_MS);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_BL) {
                        nextState = RotateRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & TAPE_BR) {
                        nextState = RotateLeft;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == NAV_ROTATE_TIMER) {
                        nextState = DriveForwardPreparingRightTurn;
                        makeTransition = TRUE;
                    }
                    break;
                default:
                    break;
            }
            break;
        case ReverseTurnLeft:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(-500);
                    right(-DRIVE_SPEED);
                    ES_Timer_InitTimer(NAV_ROTATE_TIMER, REVERSE_TURN_MS);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_BL) {
                        nextState = RotateLeft;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & TAPE_BR) {
                        nextState = RotateRight;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == NAV_ROTATE_TIMER) {
                        nextState = DriveForwardPreparingRightTurn;
                        makeTransition = TRUE;
                    }
                    break;
                default:
                    break;
            }
            break;
        default: // all unhandled states fall into here
            break;
    }

    if (makeTransition == TRUE)
    { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunZigZagSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunZigZagSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
