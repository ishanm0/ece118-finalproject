#include <BOARD.h>
#include <xc.h>
#include <stdio.h>
#include "ES_Configure.h"
#include "ES_Framework.h"

#include "IO_Ports.h"

void main(void)
{
    ES_Return_t ErrorType;

    BOARD_Init();

    printf("Starting ES Framework Template\r\n");
    printf("using the 2nd Generation Events & Services Framework\r\n");

    // Your hardware initialization function calls go here

    IO_PortsSetPortInputs(PORTZ, 0xbf8);        // bumper sensors - pins 3-9 and 11 (0xbf8 = 0b1011 1111 1000)
    IO_PortsSetPortInputs(PORTX, PIN4);         // front right tape sensor
    IO_PortsSetPortInputs(PORTY, PIN9 | PIN11); // back left & back right tape sensor
    IO_PortsSetPortInputs(PORTZ, PIN12);        // front left tape sensor

    // now initialize the Events and Services Framework and start it running
    ErrorType = ES_Initialize();
    if (ErrorType == Success)
    {
        ErrorType = ES_Run();
    }
    // if we got to here, there was an error
    switch (ErrorType)
    {
    case FailedPointer:
        printf("Failed on NULL pointer");
        break;
    case FailedInit:
        printf("Failed Initialization");
        break;
    default:
        printf("Other Failure: %d", ErrorType);
        break;
    }
    for (;;)
        ;
};

/*------------------------------- Footnotes -------------------------------*/
/*------------------------------ End of file ------------------------------*/
