#include <BOARD.h> 
#include <xc.h>
#include <stdio.h>
#include "ES_Configure.h"
#include "ES_Framework.h"

#include "IO_Ports.h"
#include "RC_Servo.h"
#include "pwm.h"
#include "AD.h"

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

    RC_Init();              // initialize the RC Servo
    RC_AddPins(RC_PORTV03); // add the RC Servo pin

    PWM_Init();                             // initialize the PWM
    PWM_AddPins(PWM_PORTX11 | PWM_PORTY10); // drive motor pwm pins

    PWM_SetDutyCycle(PWM_PORTX11, 0); // set the duty cycle to 0
    PWM_SetDutyCycle(PWM_PORTY10, 0); // set the duty cycle to 0

    IO_PortsSetPortOutputs(PORTY, PIN4 | PIN6 | PIN7 | PIN8); // drive motor direction pins
    IO_PortsClearPortBits(PORTY, PIN4 | PIN6 | PIN7 | PIN8); // set drive motor direction pins off

    IO_PortsSetPortOutputs(PORTY, PIN12); // intake motor on/off pin
    IO_PortsSetPortBits(PORTY, PIN12);  // set intake motor off

    AD_Init(); // initialize the AD
    AD_AddPins(AD_PORTV4);

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
