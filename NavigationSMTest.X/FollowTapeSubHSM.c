/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "MainHSM.h"
#include "FollowTapeSubHSM.h"
#include "Common.h"
#include "IO_Ports.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum
{
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
    LeftMove,
} FollowTapeSubHSMState_t;

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
    "LeftMove",
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

static FollowTapeSubHSMState_t CurrentState = InitPState; // <- change name to match ENUM
static uint8_t MyPriority;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitFollowTapeSubHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitFollowTapeSubHSM(void)
{
    ES_Event returnEvent;

    CurrentState = InitPState;
    returnEvent = RunFollowTapeSubHSM(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT)
    {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunFollowTapeSubHSM(ES_Event ThisEvent)
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
ES_Event RunFollowTapeSubHSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE;    // use to flag transition
    FollowTapeSubHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState)
    {
    case InitPState: // If current state is initial Pseudo State
        if (ThisEvent.EventType == BATTERY_CONNECTED)
        {
            nextState = pivit;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            ;
        }
        break;
    case pivit: // move to have the front sensor on the line and the back not on the line assume both are on the line
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            printf("Pivot\r\n");
            left(500);
            right(800);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(forwardLeft);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & BUMPER_TLF)
            {
                SWITCH(REVERSEBACK);
            }
            else if (ThisEvent.EventParam & BUMPER_TRF)
            {
                SWITCH(REVERSEBACK);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case forwardRight:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            printf("forwardRight\r\n");
            left(500);
            right(1000);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(forwardLeft);
            }
            else if (ThisEvent.EventParam & TAPE_FR)
            {
                SWITCH(QCW);
            }
            break;
        case TAPE_OFF:
            if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(forwardLeft);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & BUMPER_TLF)
            {
                SWITCH(REVERSEBACK);
            }
            else if (ThisEvent.EventParam & BUMPER_TRF)
            {
                SWITCH(REVERSEBACK);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case forwardLeft:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            printf("forwardLeft\r\n");
            left(1000);
            right(500);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(forwardRight);
            }
            else if (ThisEvent.EventParam & TAPE_FR)
            {
                SWITCH(QCW);
            }
            break;
        case TAPE_OFF:
            if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(forwardRight);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & BUMPER_TLF)
            {
                SWITCH(REVERSEBACK);
            }
            else if (ThisEvent.EventParam & BUMPER_TRF)
            {
                SWITCH(REVERSEBACK);
            }

            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case QCW:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            printf("QCW\r\n");
            left(800);
            right(-800);
            ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 700);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == Pivit_ROTATE_TIMER)
            {
                SWITCH(pause);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case pause:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            printf("pause\n\r");
            left(0);
            right(0);
            ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 100);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == Pivit_ROTATE_TIMER)
            {
                if ((IO_PortsReadPort(PORTZ) & PIN12))
                { // left side on tape
                    SWITCH(forwardLeft);
                }
                else
                {
                    SWITCH(forwardRight); // left side not on tape
                }
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case REVERSEBACK:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            printf("reverseBack\r\n");
            left(-800);
            right(-1000);
            ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 200);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == Pivit_ROTATE_TIMER)
            {
                SWITCH(smack);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case smack:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            printf("smack\r\n");
            left(1000);
            right(1000);
            ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 350);
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & BUMPER_TRF)
            {
                SWITCH(REVERSEBACK);
                ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
            }
            else if (ThisEvent.EventParam & BUMPER_TLF)
            {
                SWITCH(REVERSEBACK);
                ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(LeftMove);
                ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
            }
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == Pivit_ROTATE_TIMER)
            {
                SWITCH(reajust);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case reajust: // my loop
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            printf("reajust\r\n");
            left(0);
            right(1000);
            ES_Timer_InitTimer(Pivit_ROTATE_TIMER, 600);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == Pivit_ROTATE_TIMER)
            {
                SWITCH(REVERSEBACK);
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_FL)
            {
                SWITCH(LeftMove);
                ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
            }
            else if (ThisEvent.EventParam & TAPE_FR)
            {
                SWITCH(LeftMove);
                ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & BUMPER_TRF)
            {
                SWITCH(REVERSEBACK);
                ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case LeftMove:
        printf("LeftMove\r\n");
        left(900);
        right(-900);
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(900);
            right(-900);
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & TAPE_BL)
            {
                SWITCH(pause);
                ES_Timer_StopTimer(Pivit_ROTATE_TIMER);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
    default: // all unhandled states fall into here
        break;
    } // end switch on Current State

    if (makeTransition == TRUE)
    { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunFollowTapeSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunFollowTapeSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
