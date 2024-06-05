/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "MainHSM.h"
#include "FollowWallSubHSM.h"
#include "AvoidGoLeftSubHSM.h"
#include "Common.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum
{
    InitPSubState,
    ReverseBack,
    Smack,
    Readjust
} AvoidGoLeftSubHSMState_t;

static const char *StateNames[] = {
    "InitPSubState",
    "ReverseBack",
    "Smack",
    "Readjust",
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

static AvoidGoLeftSubHSMState_t CurrentState = InitPSubState; // <- change name to match ENUM
static uint8_t MyPriority;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitAvoidGoLeftSubHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitAvoidGoLeftSubHSM(void)
{
    ES_Event returnEvent;

    CurrentState = InitPSubState;
    returnEvent = RunAvoidGoLeftSubHSM(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT)
    {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunAvoidGoLeftSubHSM(ES_Event ThisEvent)
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
ES_Event RunAvoidGoLeftSubHSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE;     // use to flag transition
    AvoidGoLeftSubHSMState_t nextState; // <- change type to correct enum

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
            nextState = ReverseBack;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
        }
        break;

    case ReverseBack: // in the first state, replace this with correct names
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(-1000);
            right(-800);
            ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 200);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == Pivit_ROTATE_TIMER)
            {
                SWITCH(Smack);
            }
            break;
        case ES_NO_EVENT:
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;

    case Smack:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(1000);
            right(1000);
            ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 350);
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & BUMPER_TRF)
            {
                SWITCH(ReverseBack);
                ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
            }
            else if (ThisEvent.EventParam & BUMPER_TLF)
            {
                SWITCH(ReverseBack);
                ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
            }
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == Pivit_ROTATE_TIMER)
            {
                SWITCH(Readjust);
            }
            break;
        case ES_NO_EVENT:
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;

    case Readjust:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(1000);
            right(0);
            ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 600);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == Pivit_ROTATE_TIMER)
            {
                SWITCH(ReverseBack);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & (BUMPER_TRF | BUMPER_TLF))
            {
                SWITCH(ReverseBack);
                ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
            }
            break;
        case ES_NO_EVENT:
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;

    default: // all unhandled states fall into here
        break;
    } // end switch on Current State

    if (makeTransition == TRUE)
    { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunAvoidGoLeftSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunAvoidGoLeftSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
