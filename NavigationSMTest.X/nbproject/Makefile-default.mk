#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/NavigationSMTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/NavigationSMTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../ECE118/src/AD.c ../ECE118/src/BOARD.c ../ECE118/src/ES_CheckEvents.c ../ECE118/src/ES_Framework.c ../ECE118/src/ES_KeyboardInput.c ../ECE118/src/ES_PostList.c ../ECE118/src/ES_Queue.c ../ECE118/src/ES_TattleTale.c ../ECE118/src/ES_Timers.c ../ECE118/src/IO_Ports.c ../ECE118/src/LED.c ../ECE118/src/pwm.c ../ECE118/src/RC_Servo.c ../ECE118/src/serial.c ../ECE118/src/timers.c EventChecker.c ES_Main.c NavigationTestHSM.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1347132459/AD.o ${OBJECTDIR}/_ext/1347132459/BOARD.o ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o ${OBJECTDIR}/_ext/1347132459/ES_Framework.o ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1347132459/ES_PostList.o ${OBJECTDIR}/_ext/1347132459/ES_Queue.o ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o ${OBJECTDIR}/_ext/1347132459/ES_Timers.o ${OBJECTDIR}/_ext/1347132459/IO_Ports.o ${OBJECTDIR}/_ext/1347132459/LED.o ${OBJECTDIR}/_ext/1347132459/pwm.o ${OBJECTDIR}/_ext/1347132459/RC_Servo.o ${OBJECTDIR}/_ext/1347132459/serial.o ${OBJECTDIR}/_ext/1347132459/timers.o ${OBJECTDIR}/EventChecker.o ${OBJECTDIR}/ES_Main.o ${OBJECTDIR}/NavigationTestHSM.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1347132459/AD.o.d ${OBJECTDIR}/_ext/1347132459/BOARD.o.d ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/1347132459/ES_Framework.o.d ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/1347132459/ES_PostList.o.d ${OBJECTDIR}/_ext/1347132459/ES_Queue.o.d ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o.d ${OBJECTDIR}/_ext/1347132459/ES_Timers.o.d ${OBJECTDIR}/_ext/1347132459/IO_Ports.o.d ${OBJECTDIR}/_ext/1347132459/LED.o.d ${OBJECTDIR}/_ext/1347132459/pwm.o.d ${OBJECTDIR}/_ext/1347132459/RC_Servo.o.d ${OBJECTDIR}/_ext/1347132459/serial.o.d ${OBJECTDIR}/_ext/1347132459/timers.o.d ${OBJECTDIR}/EventChecker.o.d ${OBJECTDIR}/ES_Main.o.d ${OBJECTDIR}/NavigationTestHSM.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1347132459/AD.o ${OBJECTDIR}/_ext/1347132459/BOARD.o ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o ${OBJECTDIR}/_ext/1347132459/ES_Framework.o ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1347132459/ES_PostList.o ${OBJECTDIR}/_ext/1347132459/ES_Queue.o ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o ${OBJECTDIR}/_ext/1347132459/ES_Timers.o ${OBJECTDIR}/_ext/1347132459/IO_Ports.o ${OBJECTDIR}/_ext/1347132459/LED.o ${OBJECTDIR}/_ext/1347132459/pwm.o ${OBJECTDIR}/_ext/1347132459/RC_Servo.o ${OBJECTDIR}/_ext/1347132459/serial.o ${OBJECTDIR}/_ext/1347132459/timers.o ${OBJECTDIR}/EventChecker.o ${OBJECTDIR}/ES_Main.o ${OBJECTDIR}/NavigationTestHSM.o

# Source Files
SOURCEFILES=../ECE118/src/AD.c ../ECE118/src/BOARD.c ../ECE118/src/ES_CheckEvents.c ../ECE118/src/ES_Framework.c ../ECE118/src/ES_KeyboardInput.c ../ECE118/src/ES_PostList.c ../ECE118/src/ES_Queue.c ../ECE118/src/ES_TattleTale.c ../ECE118/src/ES_Timers.c ../ECE118/src/IO_Ports.c ../ECE118/src/LED.c ../ECE118/src/pwm.c ../ECE118/src/RC_Servo.c ../ECE118/src/serial.c ../ECE118/src/timers.c EventChecker.c ES_Main.c NavigationTestHSM.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=/
ShExtension=.sh
Device=PIC32MX320F128H
ProjectDir=/Users/ishanmadan/Developer/_school/ece118-finalproject/NavigationSMTest.X
ProjectName=NavigationSMTest
ConfName=default
ImagePath=dist/default/${IMAGE_TYPE}/NavigationSMTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
ImageDir=dist/default/${IMAGE_TYPE}
ImageName=NavigationSMTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/NavigationSMTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=,--script="../ECE118/bootloader320.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1347132459/AD.o: ../ECE118/src/AD.c  .generated_files/flags/default/a42d54d2989d6555cebd6bbb93bc16718cf57d02 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/AD.o.d" -o ${OBJECTDIR}/_ext/1347132459/AD.o ../ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/BOARD.o: ../ECE118/src/BOARD.c  .generated_files/flags/default/5d2216012855ec46feb547a7e23df85cf613ece .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/BOARD.o.d" -o ${OBJECTDIR}/_ext/1347132459/BOARD.o ../ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o: ../ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/ed00f34ae8d30e95a383d643490dcf9343e84982 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o ../ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Framework.o: ../ECE118/src/ES_Framework.c  .generated_files/flags/default/eba5e7c65dbec451e65f5eea862ef0a74a7edb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Framework.o ../ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o: ../ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/f30196b1e3d4be5963893b55573079deaf5aa1f2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o ../ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_PostList.o: ../ECE118/src/ES_PostList.c  .generated_files/flags/default/1a62acb22630beed7916ec1556b01a80f6ce6c3a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_PostList.o ../ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Queue.o: ../ECE118/src/ES_Queue.c  .generated_files/flags/default/5cd42594e625680003eaf5bb5a13b018273bb565 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Queue.o ../ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o: ../ECE118/src/ES_TattleTale.c  .generated_files/flags/default/28b681c9c6243295b17bcc37358982b0d5cee19c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o ../ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Timers.o: ../ECE118/src/ES_Timers.c  .generated_files/flags/default/7153e393d4bb29cf211889e005e53d128d53f8f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Timers.o ../ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/IO_Ports.o: ../ECE118/src/IO_Ports.c  .generated_files/flags/default/aea4cd8ac0adbaab004827cc2e61ff9d5ab52784 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1347132459/IO_Ports.o ../ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/LED.o: ../ECE118/src/LED.c  .generated_files/flags/default/a8ba376536ab07fc044d3f6993d1a7f0036c8644 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/LED.o.d" -o ${OBJECTDIR}/_ext/1347132459/LED.o ../ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/pwm.o: ../ECE118/src/pwm.c  .generated_files/flags/default/1d5b73fd88c3e77931534d5544fa9c645d9a88cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/pwm.o.d" -o ${OBJECTDIR}/_ext/1347132459/pwm.o ../ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/RC_Servo.o: ../ECE118/src/RC_Servo.c  .generated_files/flags/default/a52da7b285464b1bdaf57f1de3f1585bc97a1234 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1347132459/RC_Servo.o ../ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/serial.o: ../ECE118/src/serial.c  .generated_files/flags/default/f962c529595c3c7f577200eeec2c7c40dfa32989 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/serial.o.d" -o ${OBJECTDIR}/_ext/1347132459/serial.o ../ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/timers.o: ../ECE118/src/timers.c  .generated_files/flags/default/f7da19d14ca94681f597c2c063752b67626eb65e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/timers.o.d" -o ${OBJECTDIR}/_ext/1347132459/timers.o ../ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/EventChecker.o: EventChecker.c  .generated_files/flags/default/1d849b41ba6b6228b34a3af7e4a196a688c57819 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EventChecker.o.d 
	@${RM} ${OBJECTDIR}/EventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/EventChecker.o.d" -o ${OBJECTDIR}/EventChecker.o EventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ES_Main.o: ES_Main.c  .generated_files/flags/default/2c9910fcf54dcbd1883432592579cd0e44d8d1ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ES_Main.o.d 
	@${RM} ${OBJECTDIR}/ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/ES_Main.o.d" -o ${OBJECTDIR}/ES_Main.o ES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/NavigationTestHSM.o: NavigationTestHSM.c  .generated_files/flags/default/8186214592b896eb70fbf35ff231b1dca168bf5b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NavigationTestHSM.o.d 
	@${RM} ${OBJECTDIR}/NavigationTestHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/NavigationTestHSM.o.d" -o ${OBJECTDIR}/NavigationTestHSM.o NavigationTestHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1347132459/AD.o: ../ECE118/src/AD.c  .generated_files/flags/default/fc54efbe8de5f928d798cd9f62a1f9e28692426e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/AD.o.d" -o ${OBJECTDIR}/_ext/1347132459/AD.o ../ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/BOARD.o: ../ECE118/src/BOARD.c  .generated_files/flags/default/c601b860ff68313246ec9aca0b3da24abc084762 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/BOARD.o.d" -o ${OBJECTDIR}/_ext/1347132459/BOARD.o ../ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o: ../ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/64f0f9beab276cbe2e7061f4f011a2729ff2b60b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o ../ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Framework.o: ../ECE118/src/ES_Framework.c  .generated_files/flags/default/1f75264cc8e63d79cad2c316a67c897b0c731aab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Framework.o ../ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o: ../ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/28dcde5955146241e6f116d657b32047b4f4148f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o ../ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_PostList.o: ../ECE118/src/ES_PostList.c  .generated_files/flags/default/89188ac7605cf564900f601de2d6b45cb8d7f432 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_PostList.o ../ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Queue.o: ../ECE118/src/ES_Queue.c  .generated_files/flags/default/471cc020b7a39d8a6ff6f996b94751f648f8ad3a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Queue.o ../ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o: ../ECE118/src/ES_TattleTale.c  .generated_files/flags/default/804d2b265a3b74b9eaac0c8816537f9de4702f51 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o ../ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Timers.o: ../ECE118/src/ES_Timers.c  .generated_files/flags/default/c4054170dbe01c4eef5a0e441b43cd4f366f1312 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Timers.o ../ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/IO_Ports.o: ../ECE118/src/IO_Ports.c  .generated_files/flags/default/c6c9323280a91ead0cdb764434a12a0f3c265880 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1347132459/IO_Ports.o ../ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/LED.o: ../ECE118/src/LED.c  .generated_files/flags/default/90256484edf79536d69103f05950013a677c0bed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/LED.o.d" -o ${OBJECTDIR}/_ext/1347132459/LED.o ../ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/pwm.o: ../ECE118/src/pwm.c  .generated_files/flags/default/6e77353330f3d29398f8f3ec2d4d9fe2a9602e87 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/pwm.o.d" -o ${OBJECTDIR}/_ext/1347132459/pwm.o ../ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/RC_Servo.o: ../ECE118/src/RC_Servo.c  .generated_files/flags/default/445eb0e0fb14ad196f52ec4a9cd4f47b47a75c2a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1347132459/RC_Servo.o ../ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/serial.o: ../ECE118/src/serial.c  .generated_files/flags/default/f05c972fc499e8f863b100c192a912f8ef544716 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/serial.o.d" -o ${OBJECTDIR}/_ext/1347132459/serial.o ../ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/timers.o: ../ECE118/src/timers.c  .generated_files/flags/default/90589fc9df3b4874860dd51fd07aeb0ca08f693c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/timers.o.d" -o ${OBJECTDIR}/_ext/1347132459/timers.o ../ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/EventChecker.o: EventChecker.c  .generated_files/flags/default/1018e3b9fe46086c4a591c3e09e2fcf123270f5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EventChecker.o.d 
	@${RM} ${OBJECTDIR}/EventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/EventChecker.o.d" -o ${OBJECTDIR}/EventChecker.o EventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ES_Main.o: ES_Main.c  .generated_files/flags/default/1fe4c6009c4b2c224fe81d81c37134ac48b7837f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ES_Main.o.d 
	@${RM} ${OBJECTDIR}/ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/ES_Main.o.d" -o ${OBJECTDIR}/ES_Main.o ES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/NavigationTestHSM.o: NavigationTestHSM.c  .generated_files/flags/default/c565034c0eaf399ea4bdd4d20bd468cbf8f9a31e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NavigationTestHSM.o.d 
	@${RM} ${OBJECTDIR}/NavigationTestHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -I"../../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/NavigationTestHSM.o.d" -o ${OBJECTDIR}/NavigationTestHSM.o NavigationTestHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/NavigationSMTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/NavigationSMTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=8192,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/NavigationSMTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/NavigationSMTest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=8192,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}/xc32-bin2hex ${DISTDIR}/NavigationSMTest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [python3 ../ECE118/scripts/Enum_To_String.py]"
	@python3 ../ECE118/scripts/Enum_To_String.py
	@echo "--------------------------------------"

# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
