#ifndef CONSTANTS_H
#define CONSTANTS_H

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "AD.h"
#include <stdio.h>

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

#define WALL_LEFT BIT_0
#define WALL_RIGHT BIT_1

#define DRIVE_SPEED 1000
#define TURN_SPEED 800

#define RIGHT_TANK_TURN_MS 450
#define RIGHT_ONEWHEEL_TURN_MS 800
#define BACK_FROM_TAPE_MS 300
#define BACK_TO_DOOR_MS 1000
#define FRONT_FROM_DOOR_MS 100
#define TAPE_TURN_TIME_RIGHT 1000
#define TAPE_TURN_TIME_LEFT 1200
#define DEPOSIT_TIME 1500
#define PAUSE_TIME 200

#define WALL_DIST_SPEED_FACTOR 0.8

#define LEFT_FACTOR 1
#define RIGHT_FACTOR 1

#define BUMPER_PORT PORTZ

#define WALL_DIST_CLOSE_MAX 40
#define WALL_DIST_IN_RANGE_MIN 60
#define WALL_DIST_IN_RANGE_MAX 500
#define WALL_DIST_FAR_MIN 550

#define WALL_DIST_L_PORT AD_PORTV5
#define WALL_DIST_R_PORT AD_PORTV4

#define SWITCH(x)                      \
    nextState = x;                     \
    makeTransition = TRUE;             \
    ThisEvent.EventType = ES_NO_EVENT; \
    printf("\r\nTransitioning to %s", StateNames[x]);

void left(int speed);
void right(int speed);
void intake(uint8_t on);
void door(uint8_t open);

#endif /* CONSTANTS_H */