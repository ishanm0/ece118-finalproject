
/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "NavigationTestHSM.h"
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
#define TURN_SPEED 500
#define RIGHT_TURN_MS 700

#define LEFT_FACTOR 1
#define RIGHT_FACTOR 1

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/

typedef enum {
    InitPState,
    pivit,
    forwardRight,
    forwardLeft,
    QCW,
    QCWT,
    pause,
    REVERSEBACK,
    smack,
    reajust,
    reajustT,
    LeftMove,
    Stop,
} TemplateHSMState_t;

static const char *StateNames[] = {
	"InitPState",
	"pivit",
	"forwardRight",
	"forwardLeft",
	"QCW",
	"QCWT",
	"pause",
	"REVERSEBACK",
	"smack",
	"reajust",
	"reajustT",
	"LeftMove",
	"Stop",
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
int x = 0;

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
 * @Function InitNavigationTestHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitPETERHSM(uint8_t Priority) {
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
 * @Function PostNavigationTestHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostPETERHSM(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @Function RunNavigationTestHSM(ES_Event ThisEvent)
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
ES_Event RunPETERHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    TemplateHSMState_t nextState; // <- change type to correct enum
    int x = 0;
    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPState: // If current state is initial Pseudo State
            if (ThisEvent.EventType == BATTERY_CONNECTED) {
                nextState = pivit;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
                ;
            }
            break;
        case pivit: // move to have the front sensor on the line and the back not on the line assume both are on the line
            switch (ThisEvent.EventType) {
                case ES_ENTRY:

                    left(500);
                    right(800);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_FL) {
                        nextState = forwardLeft;
                        makeTransition = TRUE;
                    }
                    break;
                case BUMPER_ON:
                    nextState = REVERSEBACK;
                    makeTransition = TRUE;
                    break;
                case ES_NO_EVENT:

                default:
                    break;
            }
            break;
        case forwardRight:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(500);
                    right(1000);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_FL) {
                        nextState = forwardLeft;
                        makeTransition = TRUE;
                    }
                    if (ThisEvent.EventParam & TAPE_FR) {
                        nextState = QCW;
                        makeTransition = TRUE;
                    }
                    break;
                case TAPE_OFF:
                    if (ThisEvent.EventParam & TAPE_FL) {
                        nextState = forwardLeft;
                        makeTransition = TRUE;
                    }
                    break;
                case BUMPER_ON:
                    nextState = REVERSEBACK;
                    makeTransition = TRUE;
                    break;
                case ES_NO_EVENT:

                default:
                    break;
            }
            break;
        case forwardLeft:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(1000);
                    right(500);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_FL) {
                        nextState = forwardRight;
                        makeTransition = TRUE;
                    }
                    if (ThisEvent.EventParam & TAPE_FR) {
                        nextState = QCW;
                        makeTransition = TRUE;
                    }
                    break;
                case TAPE_OFF:
                    if (ThisEvent.EventParam & TAPE_FL) {
                        nextState = forwardRight;
                        makeTransition = TRUE;
                    }
                    break;
                case BUMPER_ON:
                    nextState = REVERSEBACK;
                    makeTransition = TRUE;
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case QCW:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(800);
                    right(-800);
                    ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 700);
                    break;
                case ES_TIMEOUT:
                    nextState = pause;
                    makeTransition = TRUE;
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case pause:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(0);
                    right(0);
                    ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 200);
                    break;
                case ES_TIMEOUT:
                    if ((IO_PortsReadPort(PORTZ) & PIN12)) {//left side on tape
                        nextState = forwardLeft;
                        makeTransition = TRUE;
                    }else{
                        nextState = forwardRight; //left side not on tape
                        makeTransition = TRUE;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case REVERSEBACK:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(-800);
                    right(-1000);
                    ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 200);
                    break;
                case ES_TIMEOUT:
                    nextState = smack;
                    makeTransition = TRUE;
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case smack:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(1000);
                    right(1000);
                    ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 350);
                    break;
                case BUMPER_ON:
                    if (ThisEvent.EventParam & BUMPER_TRF) {
                        nextState = REVERSEBACK;
                        makeTransition = TRUE;
                        ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
                    }
                    if (ThisEvent.EventParam & BUMPER_TLF) {
                        nextState = REVERSEBACK;
                        makeTransition = TRUE;
                        ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
                    }
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_FL) {
                        nextState = LeftMove;
                        makeTransition = TRUE;
                    }
                    
                    break;
                case ES_TIMEOUT:
                    nextState = reajust;
                    makeTransition = TRUE;
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case reajust://my loop
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(0);
                    right(1000);
                    ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 700);
                    break;
                case ES_TIMEOUT:
                    nextState = REVERSEBACK;
                    makeTransition = TRUE;
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_FL) {
                        nextState = LeftMove;
                        makeTransition = TRUE;
                    }
                    ES_Timer_StopTimer(1);
                    break;
                case BUMPER_ON:
                    if (ThisEvent.EventParam & BUMPER_TRF) {
                        nextState = REVERSEBACK;
                        makeTransition = TRUE;
                    }
                    if (ThisEvent.EventParam & BUMPER_TLF) {
                        nextState = reajustT;
                        makeTransition = TRUE;
                        ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
                    }
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case reajustT: //consume a front bumper event if it happens
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(0);
                    right(1000);
                    ES_Timer_InitTimer(1, 600);
                    break;
                case ES_TIMEOUT:
                    nextState = REVERSEBACK;
                    makeTransition = TRUE;
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_FL) {
                        nextState = LeftMove;
                        makeTransition = TRUE;
                    }
                    ES_Timer_StopTimer(1);
                    break;
                case BUMPER_ON:
                    if (ThisEvent.EventParam & BUMPER_TRF) {
                        nextState = REVERSEBACK;
                        makeTransition = TRUE;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case LeftMove:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(1000);
                    right(-1000);
                    break;
                case TAPE_ON:
                    if (ThisEvent.EventParam & TAPE_BL) {
                        nextState = pause;
                        makeTransition = TRUE;
                    }
                case ES_NO_EVENT:
                default:
                    break;
            }
        case Stop:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    left(0);
                    right(0);
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
        RunPETERHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunPETERHSM(ENTRY_EVENT); // <- rename to your own Run function
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
        IO_PortsClearPortBits(PORTY, PIN6);
        IO_PortsSetPortBits(PORTY, PIN4);
    } else {
        IO_PortsSetPortBits(PORTY, PIN6);
        IO_PortsClearPortBits(PORTY, PIN4);
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

