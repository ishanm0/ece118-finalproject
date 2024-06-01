/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "ObstacleDetectSM.h"
// #include "TemplateSubHSM.h" //#include all sub state machines called

#include <stdio.h>
#include "IO_Ports.h"
#include "pwm.h"
#include "RC_Servo.h"

/*******************************************************************************
 * PRIVATE #DEFINES                                                            *
 ******************************************************************************/
// Include any defines you need to do

#define BUMPER_BLF BIT_0 // bottom left front
#define BUMPER_BLS BIT_1 // bottom left side
#define BUMPER_BRS BIT_2 // bottom right side
#define BUMPER_BRF BIT_3 // bottom right front

#define BUMPER_TLF BIT_4 // top left front
#define BUMPER_TLS BIT_5 // top left side
#define BUMPER_TRS BIT_6 // top right side
#define BUMPER_TRF BIT_7 // top right front

#define TAPE_FR BIT_0
#define TAPE_BL BIT_1
#define TAPE_BR BIT_2
#define TAPE_FL BIT_3

#define DRIVE_SPEED 1000
#define TURN_SPEED 800
#define RIGHT_TANK_TURN_MS 700
#define FORWARD_A_BIT 450
#define ROTATE_AGAINST_WALL_MS 1400
#define REVERSE_TURN_MS 500

#define LEFT_FACTOR 1
#define RIGHT_FACTOR 0.985

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/

typedef enum {
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
} TemplateHSMState_t;

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

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine
   Example: char RunAway(uint_8 seconds);*/

void left(int speed);
void right(int speed);
void intake(uint8_t on);
void door(uint8_t open);

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

static TemplateHSMState_t CurrentState = InitPState; // <- change enum name to match ENUM
static uint8_t MyPriority;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitObstacleDetectSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitObstacleDetectSM(uint8_t Priority) {
    MyPriority = Priority;
    // put us into the Initial PseudoState
    CurrentState = InitPState;
    // post the initial transition event
    if (ES_PostToService(MyPriority, INIT_EVENT) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/**
 * @Function PostObstacleDetectSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostObstacleDetectSM(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @Function RunObstacleDetectSM(ES_Event ThisEvent)
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
ES_Event RunObstacleDetectSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    TemplateHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPState: // If current state is initial Pseudo State
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
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    printf("\r\ndriving!");
                    left(DRIVE_SPEED);
                    right(DRIVE_SPEED);
                    intake(TRUE);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_FL) {
                        nextState = RotateRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & TAPE_FR) {
                        nextState = RotateLeft;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & TAPE_BL) {
                        nextState = ReverseTurnRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & TAPE_BR) {
                        nextState = ReverseTurnLeft;
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
                    } else if (ThisEvent.EventParam & BUMPER_BLF) {
                        nextState = RotateAgainstTheLeftSide;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_BRF) {
                        nextState = RotateAgainstTheRightSide;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
            //        case DriveForwardABit: // in the first state, replace this with correct names
            //            // run sub-state machine for this state
            //            // NOTE: the SubState Machine runs and responds to events before anything in the this
            //            // state machine does
            //            // ThisEvent = RunTemplateSubHSM(ThisEvent);
            //            switch (ThisEvent.EventType) {
            //                case ES_ENTRY:
            //                    printf("\r\ndriving!");
            //                    left(DRIVE_SPEED);
            //                    right(DRIVE_SPEED);
            //                    break;
            //                case TAPE_ON:
            //                    if (ThisEvent.EventParam & TAPE_FL) {
            //                        nextState = RotateRight;
            //                        makeTransition = TRUE;
            //                    } else if (ThisEvent.EventParam & TAPE_FR) {
            //                        nextState = RotateLeft;
            //                        makeTransition = TRUE;
            //                    }
            //                    break;
            //                case BUMPER_ON:
            //                    if (ThisEvent.EventParam & BUMPER_TRF) {
            //                        nextState = ReverseTurnRight;
            //                        makeTransition = TRUE;
            //                    } else if (ThisEvent.EventParam & BUMPER_TLF) {
            //                        nextState = ReverseTurnLeft;
            //                        makeTransition = TRUE;
            //                    }
            //                    break;
            //                    case BUMPER
            //                case ES_NO_EVENT:
            //                default:
            //                    break;
            //            }
            //            break;
        case DriveForwardLeftSide: // in the first state, replace this with correct names
            // run sub-state machine for this state
            // NOTE: the SubState Machine runs and responds to events before anything in the this
            // state machine does
            // ThisEvent = RunTemplateSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    printf("\r\ndriving!");
                    left(DRIVE_SPEED);
                    right(DRIVE_SPEED);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_FL) {
                        nextState = RotateUntilHitBackRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & TAPE_FR) {
                        nextState = RotateUntilHitBackLeft;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & TAPE_BL) {
                        nextState = ReverseTurnRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & TAPE_BR) {
                        nextState = ReverseTurnLeft;
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
                    } else if (ThisEvent.EventParam & BUMPER_BLF) {
                        nextState = RotateAgainstTheLeftSide;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_BRF) {
                        nextState = RotateAgainstTheRightSide;
                        makeTransition = TRUE;
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
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    printf("\r\ndriving!");
                    left(DRIVE_SPEED);
                    right(DRIVE_SPEED);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_FR) {
                        nextState = RotateUntilHitBackLeft;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & TAPE_FL) {
                        nextState = RotateUntilHitBackRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & TAPE_BL) {
                        nextState = ReverseTurnRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & TAPE_BR) {
                        nextState = ReverseTurnLeft;
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
                    } else if (ThisEvent.EventParam & BUMPER_BLF) {
                        nextState = RotateAgainstTheLeftSide;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_BRF) {
                        nextState = RotateAgainstTheRightSide;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case RotateLeft:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(-TURN_SPEED);
                    right(TURN_SPEED);
                    ES_Timer_InitTimer(NAV_ROTATE_TIMER, RIGHT_TANK_TURN_MS);
                    break;
                case BUMPER_ON:
                    if (ThisEvent.EventParam & BUMPER_TRF) {
                        nextState = ReverseTurnRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_TLF) {
                        nextState = ReverseTurnLeft;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & (BUMPER_BRF | BUMPER_BRS)) {
                        nextState = RotateAgainstTheRightSide;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == NAV_ROTATE_TIMER) {
                        nextState = DriveForward;
                        makeTransition = TRUE;
                    }
                    break;
                default:
                    break;
            }
            break;
        case RotateRight:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(TURN_SPEED);
                    right(-TURN_SPEED);
                    ES_Timer_InitTimer(NAV_ROTATE_TIMER, RIGHT_TANK_TURN_MS);
                    break;
                case BUMPER_ON:
                    if (ThisEvent.EventParam & BUMPER_TRF) {
                        nextState = ReverseTurnRight;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & BUMPER_TLF) {
                        nextState = ReverseTurnLeft;
                        makeTransition = TRUE;
                    } else if (ThisEvent.EventParam & (BUMPER_BLF | BUMPER_BLS)) {
                        nextState = RotateAgainstTheLeftSide;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == NAV_ROTATE_TIMER) {
                        nextState = DriveForward;
                        makeTransition = TRUE;
                    }
                    break;
                default:
                    break;
            }
            break;
        case RotateUntilHitBackLeft:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(-TURN_SPEED);
                    right(TURN_SPEED);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_BL) {
                        nextState = DriveForwardRightSide;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case RotateUntilHitBackRight:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(TURN_SPEED);
                    right(-TURN_SPEED);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_BR) {
                        nextState = DriveForwardLeftSide;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case ReverseTurnRight:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(-1000);
                    right(-700);
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
                        nextState = DriveForward;
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
                    left(-650);
                    right(-TURN_SPEED);
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
                        nextState = DriveForward;
                        makeTransition = TRUE;
                    }
                    break;
                default:
                    break;
            }
            break;
        case RotateAgainstTheLeftSide:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(TURN_SPEED);
                    right(-TURN_SPEED);
                    ES_Timer_InitTimer(NAV_ROTATE_TIMER, 600);
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == NAV_ROTATE_TIMER) {
                        nextState = DriveForwardLeftSide;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case RotateAgainstTheRightSide:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(-TURN_SPEED);
                    right(TURN_SPEED);
                    ES_Timer_InitTimer(NAV_ROTATE_TIMER, 600);
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == NAV_ROTATE_TIMER) {
                        nextState = DriveForwardRightSide;
                        makeTransition = TRUE;
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

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunObstacleDetectSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunObstacleDetectSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/

void left(int speed) {
    if (speed < 0) {
        speed = -speed;
        IO_PortsSetPortBits(PORTY, PIN4);
        IO_PortsClearPortBits(PORTY, PIN6);
    } else {
        IO_PortsClearPortBits(PORTY, PIN4);
        IO_PortsSetPortBits(PORTY, PIN6);
    }

    PWM_SetDutyCycle(PWM_PORTX11, speed * LEFT_FACTOR);
}

void right(int speed) {
    if (speed < 0) {
        speed = -speed;
        IO_PortsClearPortBits(PORTY, PIN7);
        IO_PortsSetPortBits(PORTY, PIN8);
    } else {
        IO_PortsSetPortBits(PORTY, PIN7);
        IO_PortsClearPortBits(PORTY, PIN8);
    }

    PWM_SetDutyCycle(PWM_PORTY10, speed * RIGHT_FACTOR);
}

void intake(uint8_t on) {
    if (on == TRUE) {
        IO_PortsSetPortBits(PORTY, PIN12);
    } else {
        IO_PortsClearPortBits(PORTY, PIN12);
    }
}

void door(uint8_t open) {
    if (open == TRUE) {
        RC_SetPulseTime(RC_PORTV03, 1000);
    } else {
        RC_SetPulseTime(RC_PORTV03, 2000);
    }
}