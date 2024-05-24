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
FINAL_IMAGE=${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED="/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_CheckEvents.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Framework.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_KeyboardInput.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_PostList.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Queue.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_TattleTale.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Timers.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/RC_Servo.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c" TemplateEventChecker.c TemplateService.c ES_Main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/976406494/AD.o ${OBJECTDIR}/_ext/976406494/BOARD.o ${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o ${OBJECTDIR}/_ext/976406494/ES_Framework.o ${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o ${OBJECTDIR}/_ext/976406494/ES_PostList.o ${OBJECTDIR}/_ext/976406494/ES_Queue.o ${OBJECTDIR}/_ext/976406494/ES_TattleTale.o ${OBJECTDIR}/_ext/976406494/ES_Timers.o ${OBJECTDIR}/_ext/976406494/IO_Ports.o ${OBJECTDIR}/_ext/976406494/LED.o ${OBJECTDIR}/_ext/976406494/pwm.o ${OBJECTDIR}/_ext/976406494/RC_Servo.o ${OBJECTDIR}/_ext/976406494/serial.o ${OBJECTDIR}/_ext/976406494/timers.o ${OBJECTDIR}/TemplateEventChecker.o ${OBJECTDIR}/TemplateService.o ${OBJECTDIR}/ES_Main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/976406494/AD.o.d ${OBJECTDIR}/_ext/976406494/BOARD.o.d ${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/976406494/ES_Framework.o.d ${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/976406494/ES_PostList.o.d ${OBJECTDIR}/_ext/976406494/ES_Queue.o.d ${OBJECTDIR}/_ext/976406494/ES_TattleTale.o.d ${OBJECTDIR}/_ext/976406494/ES_Timers.o.d ${OBJECTDIR}/_ext/976406494/IO_Ports.o.d ${OBJECTDIR}/_ext/976406494/LED.o.d ${OBJECTDIR}/_ext/976406494/pwm.o.d ${OBJECTDIR}/_ext/976406494/RC_Servo.o.d ${OBJECTDIR}/_ext/976406494/serial.o.d ${OBJECTDIR}/_ext/976406494/timers.o.d ${OBJECTDIR}/TemplateEventChecker.o.d ${OBJECTDIR}/TemplateService.o.d ${OBJECTDIR}/ES_Main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/976406494/AD.o ${OBJECTDIR}/_ext/976406494/BOARD.o ${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o ${OBJECTDIR}/_ext/976406494/ES_Framework.o ${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o ${OBJECTDIR}/_ext/976406494/ES_PostList.o ${OBJECTDIR}/_ext/976406494/ES_Queue.o ${OBJECTDIR}/_ext/976406494/ES_TattleTale.o ${OBJECTDIR}/_ext/976406494/ES_Timers.o ${OBJECTDIR}/_ext/976406494/IO_Ports.o ${OBJECTDIR}/_ext/976406494/LED.o ${OBJECTDIR}/_ext/976406494/pwm.o ${OBJECTDIR}/_ext/976406494/RC_Servo.o ${OBJECTDIR}/_ext/976406494/serial.o ${OBJECTDIR}/_ext/976406494/timers.o ${OBJECTDIR}/TemplateEventChecker.o ${OBJECTDIR}/TemplateService.o ${OBJECTDIR}/ES_Main.o

# Source Files
SOURCEFILES=/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_CheckEvents.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Framework.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_KeyboardInput.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_PostList.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Queue.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_TattleTale.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Timers.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/RC_Servo.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c TemplateEventChecker.c TemplateService.c ES_Main.c



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
ProjectDir=/Users/ishanmadan/Developer/_school/ece118-finalproject/EventCheckerTestv2.X
ProjectName=EventCheckerTestv2
ConfName=default
ImagePath=dist/default/${IMAGE_TYPE}/EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
ImageDir=dist/default/${IMAGE_TYPE}
ImageName=EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=,--script="/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/bootloader320.ld"
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
${OBJECTDIR}/_ext/976406494/AD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/AD.c  .generated_files/flags/default/d52546d931f9fd67dc01a6bb78736943605fbadd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/AD.o.d" -o ${OBJECTDIR}/_ext/976406494/AD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/BOARD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/BOARD.c  .generated_files/flags/default/6b6fc3ce56f863fc35b10aef935aff0b0d52ad94 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/BOARD.o.d" -o ${OBJECTDIR}/_ext/976406494/BOARD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/fec972ecfa7f96fa8f8093ceadc771abfa026f60 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_CheckEvents.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_Framework.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_Framework.c  .generated_files/flags/default/c972029e6ce9107f8dcd8fe97091ae054d65dd46 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_Framework.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Framework.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/af6499313c9415a806677aa58bae135a73413a94 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_KeyboardInput.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_PostList.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_PostList.c  .generated_files/flags/default/c9b501cf7d04a4f45cf75aa6ed3efd795e97e5ba .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_PostList.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_PostList.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_Queue.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_Queue.c  .generated_files/flags/default/26c1ff84c5c73a380ba787dc621a37b495cf091e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_Queue.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Queue.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_TattleTale.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/4bd6d422f6684a9744966d6c77635085c9b18bef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_TattleTale.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_TattleTale.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_Timers.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_Timers.c  .generated_files/flags/default/efc264fbfef8f7d72a41d4ef86359c1544c7fb04 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_Timers.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/IO_Ports.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/IO_Ports.c  .generated_files/flags/default/f6496b32eeb9bdab9e18427152aaf736154ee75a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/976406494/IO_Ports.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/LED.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/LED.c  .generated_files/flags/default/34572f7020dda585f168a9df2bd30c4b8a28d1ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/LED.o.d" -o ${OBJECTDIR}/_ext/976406494/LED.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/pwm.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/pwm.c  .generated_files/flags/default/d58711becaba736d57ad84e9cbbd1f8bc799d39f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/pwm.o.d" -o ${OBJECTDIR}/_ext/976406494/pwm.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/RC_Servo.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/RC_Servo.c  .generated_files/flags/default/948e7454a8906daf6332eb2b0be7d5243ecc9d59 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/976406494/RC_Servo.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/RC_Servo.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/serial.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/serial.c  .generated_files/flags/default/264da73ac8cd0b32157cf8e1dd742ac529a4c03b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/serial.o.d" -o ${OBJECTDIR}/_ext/976406494/serial.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/timers.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/timers.c  .generated_files/flags/default/ccc87cf1dbd35066dd1935879f129a2c6cfb1096 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/timers.o.d" -o ${OBJECTDIR}/_ext/976406494/timers.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TemplateEventChecker.o: TemplateEventChecker.c  .generated_files/flags/default/137deb223c4c1e273449e8a190dc2b6d94ccaa82 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/TemplateEventChecker.o.d" -o ${OBJECTDIR}/TemplateEventChecker.o TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TemplateService.o: TemplateService.c  .generated_files/flags/default/58d61db913bf5710784cbcdf68580683ba0a1fb9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TemplateService.o.d 
	@${RM} ${OBJECTDIR}/TemplateService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/TemplateService.o.d" -o ${OBJECTDIR}/TemplateService.o TemplateService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ES_Main.o: ES_Main.c  .generated_files/flags/default/d8229c931728f64ccb7e7e3227891894ea48a186 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ES_Main.o.d 
	@${RM} ${OBJECTDIR}/ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/ES_Main.o.d" -o ${OBJECTDIR}/ES_Main.o ES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/976406494/AD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/AD.c  .generated_files/flags/default/8232a45d939143cba613f390d623a6624272d81a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/AD.o.d" -o ${OBJECTDIR}/_ext/976406494/AD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/BOARD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/BOARD.c  .generated_files/flags/default/5406c2c43609cd14745d0a73a4e5723a01d66af .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/BOARD.o.d" -o ${OBJECTDIR}/_ext/976406494/BOARD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/2891924d217bb2b4773373242371dc5b3fb5f46d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_CheckEvents.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_CheckEvents.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_Framework.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_Framework.c  .generated_files/flags/default/f35e0dfa68ffeec168f5e5895251778e88a9afc6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_Framework.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Framework.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/7551cafc33b55bc95c89e27401e17fd5aa73ad99 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_KeyboardInput.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_KeyboardInput.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_PostList.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_PostList.c  .generated_files/flags/default/5b8ac3d56c23759b09d09e1fe6fc61783ebb6949 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_PostList.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_PostList.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_Queue.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_Queue.c  .generated_files/flags/default/d20627a3b2af251f6d023c03b16226d44272d719 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_Queue.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Queue.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_TattleTale.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/df3a7205b3112cbd27193a617b43e8215c6a579f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_TattleTale.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_TattleTale.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/ES_Timers.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/ES_Timers.c  .generated_files/flags/default/16466befe61cd777b99ad6be19e38965385f8e0b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/976406494/ES_Timers.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/ES_Timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/IO_Ports.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/IO_Ports.c  .generated_files/flags/default/ded9740039b9762c77cc9562c224ffa5fecdb73b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/976406494/IO_Ports.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/LED.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/LED.c  .generated_files/flags/default/e793cc29a2b29dcbe8f4395d2d9734fba88f795 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/LED.o.d" -o ${OBJECTDIR}/_ext/976406494/LED.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/pwm.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/pwm.c  .generated_files/flags/default/ee3c752cf30d3142a37eae1bb28ef137e619efe4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/pwm.o.d" -o ${OBJECTDIR}/_ext/976406494/pwm.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/RC_Servo.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/RC_Servo.c  .generated_files/flags/default/e5fd7ae9a53bd533466b2a9212769d68359345f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/976406494/RC_Servo.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/RC_Servo.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/serial.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/serial.c  .generated_files/flags/default/70984c232b977695f5f6090aaa033b76611f254b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/serial.o.d" -o ${OBJECTDIR}/_ext/976406494/serial.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/timers.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/timers.c  .generated_files/flags/default/55539b009eac1455057b1e311f9720970c57ac0e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/timers.o.d" -o ${OBJECTDIR}/_ext/976406494/timers.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TemplateEventChecker.o: TemplateEventChecker.c  .generated_files/flags/default/2b91d3099b00c29794a9dd05370ddecf30109ac0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/TemplateEventChecker.o.d" -o ${OBJECTDIR}/TemplateEventChecker.o TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TemplateService.o: TemplateService.c  .generated_files/flags/default/6a8cb75f7757fed40ad52e79a3f954493db0880a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TemplateService.o.d 
	@${RM} ${OBJECTDIR}/TemplateService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/TemplateService.o.d" -o ${OBJECTDIR}/TemplateService.o TemplateService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ES_Main.o: ES_Main.c  .generated_files/flags/default/15c4761fbcc9f35a84e9abcd8bc6265bd42e2be2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ES_Main.o.d 
	@${RM} ${OBJECTDIR}/ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/ES_Main.o.d" -o ${OBJECTDIR}/ES_Main.o ES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=8192,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=8192,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}/xc32-bin2hex ${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [python3 C:/ECE118/scripts/Enum_To_String.py]"
	@python3 C:/ECE118/scripts/Enum_To_String.py
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
