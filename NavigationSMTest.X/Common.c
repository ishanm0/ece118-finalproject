#include "Common.h"
#include "IO_Ports.h"
#include "pwm.h"
#include "RC_Servo.h"

void left(int speed)
{
    if (speed < 0)
    {
        speed = -speed;
        IO_PortsSetPortBits(PORTY, PIN4);
        IO_PortsClearPortBits(PORTY, PIN6);
    }
    else
    {
        IO_PortsClearPortBits(PORTY, PIN4);
        IO_PortsSetPortBits(PORTY, PIN6);
    }

    PWM_SetDutyCycle(PWM_PORTX11, speed * LEFT_FACTOR);
}

void right(int speed)
{
    if (speed < 0)
    {
        speed = -speed;
        IO_PortsClearPortBits(PORTY, PIN7);
        IO_PortsSetPortBits(PORTY, PIN8);
    }
    else
    {
        IO_PortsSetPortBits(PORTY, PIN7);
        IO_PortsClearPortBits(PORTY, PIN8);
    }

    PWM_SetDutyCycle(PWM_PORTY10, speed * RIGHT_FACTOR);
}

void intake(uint8_t on)
{
    if (on == TRUE)
    {
        IO_PortsSetPortBits(PORTY, PIN12);
    }
    else
    {
        IO_PortsClearPortBits(PORTY, PIN12);
    }
}

void door(uint8_t open)
{
    if (open == TRUE)
    {
        RC_SetPulseTime(RC_PORTV03, 1000);
    }
    else
    {
        RC_SetPulseTime(RC_PORTV03, 2000);
    }
}