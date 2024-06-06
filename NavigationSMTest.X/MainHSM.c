/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "MainHSM.h"
#include "Common.h"

#include "FindWallSubHSM.h" //#include all sub state machines called
#include "FollowWallSubHSM.h"
#include "DepositSubHSM.h"
#include "FollowTapeSubHSM.h"
#include "ZigZagSubHSM.h"

/*******************************************************************************
 * PRIVATE #DEFINES                                                            *
 ******************************************************************************/
// Include any defines you need to do

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/

typedef enum {
    InitPState,
    FindWall,
    FollowWall,
    Deposit,
    FollowTape,
    ZigZag,
    AvoidOpenSpace,
    AvoidGoLeft,
    AvoidGoRight,
    GameOver,
} MainHSMState_t;

static const char *StateNames[] = {
	"InitPState",
	"FindWall",
	"FollowWall",
	"Deposit",
	"FollowTape",
	"ZigZag",
	"AvoidOpenSpace",
	"AvoidGoLeft",
	"AvoidGoRight",
	"GameOver",
};

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine
   Example: char RunAway(uint_8 seconds);*/
/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

static MainHSMState_t CurrentState = InitPState; // <- change enum name to match ENUM
static uint8_t MyPriority;

static uint8_t collect1Timer = 0;
static uint8_t collect2Timer = 0;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitMainHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitMainHSM(uint8_t Priority) {
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
 * @Function PostMainHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostMainHSM(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @Function RunMainHSM(ES_Event ThisEvent)
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
int x = 0;
ES_Event RunMainHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    MainHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPState: // If current state is initial Pseudo State
            if (ThisEvent.EventType == BATTERY_CONNECTED) // only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state
                // Initialize all sub-state machines
                InitFindWallSubHSM();
                InitFollowWallSubHSM();
                InitDepositSubHSM();
                InitFollowTapeSubHSM();
                InitZigZagSubHSM();
                // now put the machine into the actual initial state
                nextState = FindWall;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            } else if (ThisEvent.EventType == ES_EXIT) {
                ES_Timer_InitTimer(GAME_TIMER, 2 * 60 * 1000);
                ES_Timer_InitTimer(COLLECT1_TIMER, 5 * 1000);
                ES_Timer_InitTimer(COLLECT2_TIMER, 90 * 1000);
            }
            break;

        case FindWall: // in the first state, replace this with correct names
            // run sub-state machine for this state
            // NOTE: the SubState Machine runs and responds to events before anything in the this
            // state machine does
            ThisEvent = RunFindWallSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case WALL_ALIGNED: // TODO: the sub hsm needs to throw this event but idk where it does
                    SWITCH(FollowWall);
                    break;
                    //        case ES_TIMEOUT:
                    //            if (ThisEvent.EventParam == COLLECT1_TIMER)
                    //            {
                    //                collect1Timer++;
                    //            }
                    //            break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case FollowWall:
            // run sub-state machine for this state
            // NOTE: the SubState Machine runs and responds to events before anything in the this
            // state machine does
            ThisEvent = RunFollowWallSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                    //        case ES_TIMEOUT:
                    //            if (ThisEvent.EventParam == COLLECT1_TIMER)
                    //            {
                    //                collect1Timer++;
                    //            }
                    //            else if (ThisEvent.EventParam == COLLECT2_TIMER)
                    //            {
                    //                collect2Timer++;
                    //            }
                    //            break;
                case AT_DOOR_TAPE:
                    if (x == 0) {
                        x++;
                    }else{
                        SWITCH(Deposit);
                        collect1Timer = 0;
                    }

                    //            else if (collect2Timer)
                    //            {
                    //                SWITCH(ZigZag);
                    //                collect2Timer = 0;
                    //            }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case Deposit:
            // run sub-state machine for this state
            // NOTE: the SubState Machine runs and responds to events before anything in the this
            // state machine does
            ThisEvent = RunDepositSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case DEPOSIT_DONE:
                    SWITCH(FollowTape);
                    break;
                    //        case ES_TIMEOUT:
                    //            if (ThisEvent.EventParam == COLLECT2_TIMER)
                    //            {
                    //                collect2Timer++;
                    //            }
                    //            break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case FollowTape:
            // run sub-state machine for this state
            // NOTE: the SubState Machine runs and responds to events before anything in the this
            // state machine does
            ThisEvent = RunFollowTapeSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == COLLECT2_TIMER) {
                        collect2Timer++;
                    }
                    break;
                case BUMPER_ON:
                    if (ThisEvent.EventParam & (BUMPER_BLF | BUMPER_BRF)) {
                        SWITCH(FollowWall);
                        InitFollowWallSubHSM();
                    }

                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case ZigZag:
            // run sub-state machine for this state
            // NOTE: the SubState Machine runs and responds to events before anything in the this
            // state machine does
            ThisEvent = RunZigZagSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == GAME_TIMER) {
                        SWITCH(GameOver);
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case GameOver:
            if (ThisEvent.EventType == ES_ENTRY) {
                left(0);
                right(0);
                intake(FALSE);
                door(FALSE);
            }
            break;
        default: // all unhandled states fall into here
            break;
    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunMainHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunMainHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
