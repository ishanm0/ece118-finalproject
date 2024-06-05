/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "MainHSM.h"
#include "FollowWallSubHSM.h"
#include "AvoidGoLeftSubHSM.h"
#include "AvoidGoRightSubHSM.h"
#include "Common.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum
{
    InitPSubState,
    DriveAlongWallRight,
    GetCloserToWallRight,
    GetFurtherFromWallRight,
    TouchedWallRight,
    PauseRight,
    TurnAtTapeRight,
    DriveAlongWallLeft,
    GetCloserToWallLeft,
    GetFurtherFromWallLeft,
    TouchedWallLeft,
    TurnAtTapeLeft,
    AvoidGoLeft,
    AvoidGoRight,
} FollowWallSubHSMState_t;

static const char *StateNames[] = {
    "InitPSubState",
    "DriveAlongWallRight",
    "GetCloserToWallRight",
    "GetFurtherFromWallRight",
    "TouchedWallRight",
    "PauseRight",
    "TurnAtTapeRight",
    "DriveAlongWallLeft",
    "GetCloserToWallLeft",
    "GetFurtherFromWallLeft",
    "TouchedWallLeft",
    "TurnAtTapeLeft",
    "AvoidGoLeft",
    "AvoidGoRight",
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

static FollowWallSubHSMState_t CurrentState = InitPSubState; // <- change name to match ENUM
static uint8_t MyPriority;
static int wallStatus = 0;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitFollowWallSubHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitFollowWallSubHSM(void)
{
    ES_Event returnEvent;

    CurrentState = InitPSubState;
    returnEvent = RunFollowWallSubHSM(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT)
    {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunFollowWallSubHSM(ES_Event ThisEvent)
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
ES_Event RunFollowWallSubHSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE;    // use to flag transition
    FollowWallSubHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState)
    {
    case InitPSubState:                     // If current state is initial Psedudo State
        if (ThisEvent.EventType == ES_INIT) // only respond to ES_Init
        {
            // this is where you would put any actions associated with the
            // transition from the initial pseudo-state into the actual
            // initial state

            InitAvoidGoLeftSubHSM();
            InitAvoidGoRightSubHSM();

            // now put the machine into the actual initial state
            nextState = DriveAlongWallRight;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
        }
        break;

    case DriveAlongWallRight: // in the first state, replace this with correct names
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            if (wallStatus > 1)
            {
                SWITCH(GetCloserToWallRight);
            }
            else if (wallStatus < -1)
            {
                SWITCH(GetFurtherFromWallRight);
            }
            else
            {
                left(DRIVE_SPEED);
                right(DRIVE_SPEED);
                wallStatus = 0;
            }
            break;
        case WALL_FAR:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                SWITCH(GetCloserToWallRight);
            }
            break;
        case WALL_CLOSE:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                SWITCH(GetFurtherFromWallRight);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & (BUMPER_BLF | BUMPER_BLS))
            {
                SWITCH(TouchedWallRight);
            }
            else if (ThisEvent.EventParam & (BUMPER_TLF | BUMPER_TRF))
            {
                SWITCH(AvoidGoRight);
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & (TAPE_FL | TAPE_FR))
            {
                SWITCH(PauseRight);
                ThisEvent.EventType = AT_DOOR_TAPE;
            }
            break;
        case ES_NO_EVENT:
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;

    case GetCloserToWallRight:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(DRIVE_SPEED * WALL_DIST_SPEED_FACTOR);
            right(DRIVE_SPEED);
            wallStatus = 1;
            break;
        case WALL_IN_RANGE:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                SWITCH(DriveAlongWallRight);
            }
            break;
        case WALL_CLOSE:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                SWITCH(GetFurtherFromWallRight);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & (BUMPER_BLF | BUMPER_BLS))
            {
                SWITCH(TouchedWallRight);
            }
            else if (ThisEvent.EventParam & (BUMPER_TLF | BUMPER_TRF))
            {
                SWITCH(AvoidGoRight);
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & (TAPE_FL | TAPE_FR))
            {
                SWITCH(PauseRight);
                ThisEvent.EventType = AT_DOOR_TAPE;
            }
            break;
        default:
            break;
        }
        break;

    case GetFurtherFromWallRight:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(DRIVE_SPEED);
            right(DRIVE_SPEED * WALL_DIST_SPEED_FACTOR);
            wallStatus = -1;
            break;
        case WALL_IN_RANGE:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                SWITCH(DriveAlongWallRight);
            }
            break;
        case WALL_FAR:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                SWITCH(GetCloserToWallRight);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & (BUMPER_BLF | BUMPER_BLS))
            {
                SWITCH(TouchedWallRight);
            }
            else if (ThisEvent.EventParam & (BUMPER_TLF | BUMPER_TRF))
            {
                SWITCH(AvoidGoRight);
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & (TAPE_FL | TAPE_FR))
            {
                SWITCH(PauseRight);
                ThisEvent.EventType = AT_DOOR_TAPE;
            }
            break;
        default:
            break;
        }
        break;
    case TouchedWallRight:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(TURN_SPEED);
            right(-TURN_SPEED);
            break;
        case BUMPER_OFF:
            switch (wallStatus)
            {
            case 1:
                SWITCH(GetCloserToWallRight);
                break;
            case -1:
                SWITCH(GetFurtherFromWallRight);
                break;
            default:
                SWITCH(DriveAlongWallRight);
                break;
            }
            break;
        case WALL_CLOSE:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                wallStatus = -1;
            }
            break;
        case WALL_FAR:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                wallStatus = 1;
            }
            break;
        case WALL_IN_RANGE:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                wallStatus = 0;
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & (TAPE_FL | TAPE_FR))
            {
                SWITCH(PauseRight);
                ThisEvent.EventType = AT_DOOR_TAPE;
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & (BUMPER_TLF | BUMPER_TRF))
            {
                SWITCH(AvoidGoRight);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;

    case PauseRight:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(0);
            right(0);
            ES_Timer_InitTimer(TAPE_TURN_TIMER, PAUSE_TIME);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == TAPE_TURN_TIMER)
            {
                SWITCH(TurnAtTapeRight);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case TurnAtTapeRight:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(TURN_SPEED);
            right(-TURN_SPEED);
            ES_Timer_InitTimer(TAPE_TURN_TIMER, TAPE_TURN_TIME);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == TAPE_TURN_TIMER)
            {
                switch (wallStatus)
                {
                case 1:
                    SWITCH(GetCloserToWallLeft);
                    break;
                case -1:
                    SWITCH(GetFurtherFromWallLeft);
                    break;
                default:
                    SWITCH(DriveAlongWallLeft);
                    break;
                }
            }
            break;
        case WALL_CLOSE:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                wallStatus = -1;
            }
            break;
        case WALL_FAR:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                wallStatus = 1;
            }
            break;
        case WALL_IN_RANGE:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                wallStatus = 0;
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;

    case DriveAlongWallLeft:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(DRIVE_SPEED);
            right(DRIVE_SPEED);
            wallStatus = 0;
            break;
        case WALL_FAR:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                SWITCH(GetCloserToWallLeft);
            }
            break;
        case WALL_CLOSE:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                SWITCH(GetFurtherFromWallLeft);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & (BUMPER_BRF | BUMPER_BRS))
            {
                SWITCH(TouchedWallLeft);
            }
            else if (ThisEvent.EventParam & (BUMPER_TLF | BUMPER_TRF))
            {
                SWITCH(AvoidGoLeft);
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & (TAPE_FL | TAPE_FR))
            {
                SWITCH(TurnAtTapeLeft);
            }
            break;
        case ES_NO_EVENT:
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;

    case GetCloserToWallLeft:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(DRIVE_SPEED);
            right(DRIVE_SPEED * WALL_DIST_SPEED_FACTOR);
            wallStatus = 1;
            break;
        case WALL_IN_RANGE:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                SWITCH(DriveAlongWallLeft);
            }
            break;
        case WALL_CLOSE:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                SWITCH(GetFurtherFromWallLeft);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & (BUMPER_BRF | BUMPER_BRS))
            {
                SWITCH(TouchedWallLeft);
            }
            else if (ThisEvent.EventParam & (BUMPER_TLF | BUMPER_TRF))
            {
                SWITCH(AvoidGoLeft);
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & (TAPE_FL | TAPE_FR))
            {
                SWITCH(TurnAtTapeLeft);
            }
            break;
        default:
            break;
        }
        break;

    case GetFurtherFromWallLeft:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(DRIVE_SPEED * WALL_DIST_SPEED_FACTOR);
            right(DRIVE_SPEED);
            wallStatus = -1;
            break;
        case WALL_IN_RANGE:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                SWITCH(DriveAlongWallLeft);
            }
            break;
        case WALL_FAR:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                SWITCH(GetCloserToWallLeft);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & (BUMPER_BRF | BUMPER_BRS))
            {
                SWITCH(TouchedWallLeft);
            }
            else if (ThisEvent.EventParam & (BUMPER_TLF | BUMPER_TRF))
            {
                SWITCH(AvoidGoLeft);
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & (TAPE_FL | TAPE_FR))
            {
                SWITCH(TurnAtTapeLeft);
            }
            break;
        default:
            break;
        }
        break;

    case TouchedWallLeft:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(-TURN_SPEED);
            right(TURN_SPEED);
            break;
        case BUMPER_OFF:
            switch (wallStatus)
            {
            case 1:
                SWITCH(GetCloserToWallLeft);
                break;
            case -1:
                SWITCH(GetFurtherFromWallLeft);
                break;
            default:
                SWITCH(DriveAlongWallLeft);
                break;
            }
            break;
        case WALL_CLOSE:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                wallStatus = -1;
            }
            break;
        case WALL_FAR:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                wallStatus = 1;
            }
            break;
        case WALL_IN_RANGE:
            if (ThisEvent.EventParam & WALL_RIGHT)
            {
                wallStatus = 0;
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & (TAPE_FL | TAPE_FR))
            {
                SWITCH(TurnAtTapeLeft);
            }
            break;
        case BUMPER_ON:
            if (ThisEvent.EventParam & (BUMPER_TLF | BUMPER_TRF))
            {
                SWITCH(AvoidGoLeft);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;

    case TurnAtTapeLeft:
        switch (ThisEvent.EventType)
        {
        case ES_ENTRY:
            left(-TURN_SPEED);
            right(TURN_SPEED);
            ES_Timer_InitTimer(TAPE_TURN_TIMER, TAPE_TURN_TIME);
            break;
        case ES_TIMEOUT:
            if (ThisEvent.EventParam == TAPE_TURN_TIMER)
            {
                switch (wallStatus)
                {
                case 1:
                    SWITCH(GetCloserToWallRight);
                    break;
                case -1:
                    SWITCH(GetFurtherFromWallRight);
                    break;
                default:
                    SWITCH(DriveAlongWallRight);
                    break;
                }
            }
            break;
        case WALL_CLOSE:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                wallStatus = -1;
            }
            break;
        case WALL_FAR:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                wallStatus = 1;
            }
            break;
        case WALL_IN_RANGE:
            if (ThisEvent.EventParam & WALL_LEFT)
            {
                wallStatus = 0;
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;

    case AvoidGoLeft:
        // run sub-state machine for this state
        // NOTE: the SubState Machine runs and responds to events before anything in the this
        // state machine does
        ThisEvent = RunAvoidGoLeftSubHSM(ThisEvent);
        switch (ThisEvent.EventType)
        {
        case BUMPER_ON:
            if (ThisEvent.EventParam & (BUMPER_BLF | BUMPER_BLS | BUMPER_BRF | BUMPER_BRS))
            {
                SWITCH(TouchedWallLeft);
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & (TAPE_FL | TAPE_FR))
            {
                SWITCH(TurnAtTapeLeft);
            }
            break;
        case ES_NO_EVENT:
        default:
            break;
        }
        break;
    case AvoidGoRight:
        // run sub-state machine for this state
        // NOTE: the SubState Machine runs and responds to events before anything in the this
        // state machine does
        ThisEvent = RunAvoidGoRightSubHSM(ThisEvent);
        switch (ThisEvent.EventType)
        {
        case BUMPER_ON:
            if (ThisEvent.EventParam & (BUMPER_BLF | BUMPER_BLS | BUMPER_BRF | BUMPER_BRS))
            {
                SWITCH(TouchedWallRight);
            }
            break;
        case TAPE_ON:
            if (ThisEvent.EventParam & (TAPE_FL | TAPE_FR))
            {
                SWITCH(TurnAtTapeRight);
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
        RunFollowWallSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunFollowWallSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

void setWallStatus(int status)
{
    wallStatus = status * 2;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
