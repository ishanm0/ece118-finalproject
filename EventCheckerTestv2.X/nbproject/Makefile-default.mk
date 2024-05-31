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
MKDIR=gnumkdir -p
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
SOURCEFILES_QUOTED_IF_SPACED=../ECE118/src/AD.c ../ECE118/src/BOARD.c ../ECE118/src/ES_CheckEvents.c ../ECE118/src/ES_Framework.c ../ECE118/src/ES_KeyboardInput.c ../ECE118/src/ES_PostList.c ../ECE118/src/ES_Queue.c ../ECE118/src/ES_TattleTale.c ../ECE118/src/ES_Timers.c ../ECE118/src/IO_Ports.c ../ECE118/src/LED.c ../ECE118/src/pwm.c ../ECE118/src/RC_Servo.c ../ECE118/src/serial.c ../ECE118/src/timers.c TemplateEventChecker.c TemplateService.c ES_Main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1347132459/AD.o ${OBJECTDIR}/_ext/1347132459/BOARD.o ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o ${OBJECTDIR}/_ext/1347132459/ES_Framework.o ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1347132459/ES_PostList.o ${OBJECTDIR}/_ext/1347132459/ES_Queue.o ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o ${OBJECTDIR}/_ext/1347132459/ES_Timers.o ${OBJECTDIR}/_ext/1347132459/IO_Ports.o ${OBJECTDIR}/_ext/1347132459/LED.o ${OBJECTDIR}/_ext/1347132459/pwm.o ${OBJECTDIR}/_ext/1347132459/RC_Servo.o ${OBJECTDIR}/_ext/1347132459/serial.o ${OBJECTDIR}/_ext/1347132459/timers.o ${OBJECTDIR}/TemplateEventChecker.o ${OBJECTDIR}/TemplateService.o ${OBJECTDIR}/ES_Main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1347132459/AD.o.d ${OBJECTDIR}/_ext/1347132459/BOARD.o.d ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/1347132459/ES_Framework.o.d ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/1347132459/ES_PostList.o.d ${OBJECTDIR}/_ext/1347132459/ES_Queue.o.d ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o.d ${OBJECTDIR}/_ext/1347132459/ES_Timers.o.d ${OBJECTDIR}/_ext/1347132459/IO_Ports.o.d ${OBJECTDIR}/_ext/1347132459/LED.o.d ${OBJECTDIR}/_ext/1347132459/pwm.o.d ${OBJECTDIR}/_ext/1347132459/RC_Servo.o.d ${OBJECTDIR}/_ext/1347132459/serial.o.d ${OBJECTDIR}/_ext/1347132459/timers.o.d ${OBJECTDIR}/TemplateEventChecker.o.d ${OBJECTDIR}/TemplateService.o.d ${OBJECTDIR}/ES_Main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1347132459/AD.o ${OBJECTDIR}/_ext/1347132459/BOARD.o ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o ${OBJECTDIR}/_ext/1347132459/ES_Framework.o ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1347132459/ES_PostList.o ${OBJECTDIR}/_ext/1347132459/ES_Queue.o ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o ${OBJECTDIR}/_ext/1347132459/ES_Timers.o ${OBJECTDIR}/_ext/1347132459/IO_Ports.o ${OBJECTDIR}/_ext/1347132459/LED.o ${OBJECTDIR}/_ext/1347132459/pwm.o ${OBJECTDIR}/_ext/1347132459/RC_Servo.o ${OBJECTDIR}/_ext/1347132459/serial.o ${OBJECTDIR}/_ext/1347132459/timers.o ${OBJECTDIR}/TemplateEventChecker.o ${OBJECTDIR}/TemplateService.o ${OBJECTDIR}/ES_Main.o

# Source Files
SOURCEFILES=../ECE118/src/AD.c ../ECE118/src/BOARD.c ../ECE118/src/ES_CheckEvents.c ../ECE118/src/ES_Framework.c ../ECE118/src/ES_KeyboardInput.c ../ECE118/src/ES_PostList.c ../ECE118/src/ES_Queue.c ../ECE118/src/ES_TattleTale.c ../ECE118/src/ES_Timers.c ../ECE118/src/IO_Ports.c ../ECE118/src/LED.c ../ECE118/src/pwm.c ../ECE118/src/RC_Servo.c ../ECE118/src/serial.c ../ECE118/src/timers.c TemplateEventChecker.c TemplateService.c ES_Main.c



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
_/_=\\
ShExtension=.bat
Device=PIC32MX320F128H
ProjectDir="C:\Users\yafit\OneDrive\Desktop\ece118-finalproject\EventCheckerTestv2.X"
ProjectName=EventCheckerTestv2
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
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
MP_LINKER_FILE_OPTION=,--script="..\ECE118\bootloader320.ld"
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
${OBJECTDIR}/_ext/1347132459/AD.o: ../ECE118/src/AD.c  .generated_files/flags/default/dc33032b47ead6f20f7d6e96f03eaac08d3132ee .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/AD.o.d" -o ${OBJECTDIR}/_ext/1347132459/AD.o ../ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/BOARD.o: ../ECE118/src/BOARD.c  .generated_files/flags/default/de65fa1c2cd43ca2a98fb1040ea0de8aae479b5e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/BOARD.o.d" -o ${OBJECTDIR}/_ext/1347132459/BOARD.o ../ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o: ../ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/c3038c774be3fbb41f799f219a722a9364165f19 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o ../ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Framework.o: ../ECE118/src/ES_Framework.c  .generated_files/flags/default/85939e544c49738b881c0568629c4e0e4e69339c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Framework.o ../ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o: ../ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/8746348b217c08265c35896807075086b6a0b8bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o ../ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_PostList.o: ../ECE118/src/ES_PostList.c  .generated_files/flags/default/f7e3d96cf502fe413aba73a556bc0e78df697401 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_PostList.o ../ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Queue.o: ../ECE118/src/ES_Queue.c  .generated_files/flags/default/b6aa7388888fee1570a9deabd64f2a2cccbfcd0b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Queue.o ../ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o: ../ECE118/src/ES_TattleTale.c  .generated_files/flags/default/f36c1cd2cd82eacd4a34ba5783e06676e8ca19d0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o ../ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Timers.o: ../ECE118/src/ES_Timers.c  .generated_files/flags/default/794d1f914c852fc33d6e4d50e8b986dcda39784 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Timers.o ../ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/IO_Ports.o: ../ECE118/src/IO_Ports.c  .generated_files/flags/default/5cea70c7724a6bc5f3047de6a28ca1acee4bdb71 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1347132459/IO_Ports.o ../ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/LED.o: ../ECE118/src/LED.c  .generated_files/flags/default/f2d151f1765e48d2d4dba6b93886cbb5a04a6a93 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/LED.o.d" -o ${OBJECTDIR}/_ext/1347132459/LED.o ../ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/pwm.o: ../ECE118/src/pwm.c  .generated_files/flags/default/3fe20c396993a68ab8c16f996e001c2f3c1a075b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/pwm.o.d" -o ${OBJECTDIR}/_ext/1347132459/pwm.o ../ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/RC_Servo.o: ../ECE118/src/RC_Servo.c  .generated_files/flags/default/70149729b347df28bc422d831bba36bee7251506 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1347132459/RC_Servo.o ../ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/serial.o: ../ECE118/src/serial.c  .generated_files/flags/default/aab9fced59c808dcc160e2ac68811e01070835db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/serial.o.d" -o ${OBJECTDIR}/_ext/1347132459/serial.o ../ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/timers.o: ../ECE118/src/timers.c  .generated_files/flags/default/84b38da6ca53e3a3358b938f003198e70272db9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/timers.o.d" -o ${OBJECTDIR}/_ext/1347132459/timers.o ../ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TemplateEventChecker.o: TemplateEventChecker.c  .generated_files/flags/default/103fe5652e5bdb577ac88f60f4dd3fd26446647f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/TemplateEventChecker.o.d" -o ${OBJECTDIR}/TemplateEventChecker.o TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TemplateService.o: TemplateService.c  .generated_files/flags/default/20fcc5b9bd65144da503a65d733ad82b6af8e48c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TemplateService.o.d 
	@${RM} ${OBJECTDIR}/TemplateService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/TemplateService.o.d" -o ${OBJECTDIR}/TemplateService.o TemplateService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ES_Main.o: ES_Main.c  .generated_files/flags/default/a4db6f5b74d3000511deea6f55d9b56876d401a2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ES_Main.o.d 
	@${RM} ${OBJECTDIR}/ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/ES_Main.o.d" -o ${OBJECTDIR}/ES_Main.o ES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1347132459/AD.o: ../ECE118/src/AD.c  .generated_files/flags/default/70b427bf6933e123e98ceb36df21dd3f2f602383 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/AD.o.d" -o ${OBJECTDIR}/_ext/1347132459/AD.o ../ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/BOARD.o: ../ECE118/src/BOARD.c  .generated_files/flags/default/c31a5c04c4eb167a9d706781ae096cbb1a49c1dc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/BOARD.o.d" -o ${OBJECTDIR}/_ext/1347132459/BOARD.o ../ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o: ../ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/e292f79d44a31951304e85856b79627a20d2cee1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_CheckEvents.o ../ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Framework.o: ../ECE118/src/ES_Framework.c  .generated_files/flags/default/766f3519553cc336c6aa58791acfaafcc52d60df .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Framework.o ../ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o: ../ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/654fb32549314f88ce6b9f4fbcf7cc0bc6be28d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_KeyboardInput.o ../ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_PostList.o: ../ECE118/src/ES_PostList.c  .generated_files/flags/default/b5e3fdfed14f78fa1ccf8e8277b915749efa862c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_PostList.o ../ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Queue.o: ../ECE118/src/ES_Queue.c  .generated_files/flags/default/d244eae23036e9ec6341ffd18f78b90e5ac96d7c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Queue.o ../ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o: ../ECE118/src/ES_TattleTale.c  .generated_files/flags/default/c374178bfc5c6d0b3d154719806c74b6a1c13d0d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_TattleTale.o ../ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/ES_Timers.o: ../ECE118/src/ES_Timers.c  .generated_files/flags/default/197d0de63a48ce08cd8fdb6bb654b9ccba06a591 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1347132459/ES_Timers.o ../ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/IO_Ports.o: ../ECE118/src/IO_Ports.c  .generated_files/flags/default/6db3d4698340b2a65044db945d46b95cf85b400f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1347132459/IO_Ports.o ../ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/LED.o: ../ECE118/src/LED.c  .generated_files/flags/default/c4c0015cda40b20450ac58d01f63f3a6a299c76c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/LED.o.d" -o ${OBJECTDIR}/_ext/1347132459/LED.o ../ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/pwm.o: ../ECE118/src/pwm.c  .generated_files/flags/default/3a8b9943a8dbc8e36febda04381f2ed42c3b121 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/pwm.o.d" -o ${OBJECTDIR}/_ext/1347132459/pwm.o ../ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/RC_Servo.o: ../ECE118/src/RC_Servo.c  .generated_files/flags/default/6dc124717d2bc50a230d0aeb85831afb4d0493d8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1347132459/RC_Servo.o ../ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/serial.o: ../ECE118/src/serial.c  .generated_files/flags/default/1e364e61177bcbb92406543f049d41fd507809f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/serial.o.d" -o ${OBJECTDIR}/_ext/1347132459/serial.o ../ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1347132459/timers.o: ../ECE118/src/timers.c  .generated_files/flags/default/b3dda529d030d359e2b39a6b50375929b93a6b7c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1347132459" 
	@${RM} ${OBJECTDIR}/_ext/1347132459/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1347132459/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1347132459/timers.o.d" -o ${OBJECTDIR}/_ext/1347132459/timers.o ../ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TemplateEventChecker.o: TemplateEventChecker.c  .generated_files/flags/default/dcaca70eaeae097ff980a58476b8d40609d39925 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/TemplateEventChecker.o.d" -o ${OBJECTDIR}/TemplateEventChecker.o TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TemplateService.o: TemplateService.c  .generated_files/flags/default/b2ef899efa59e08da82d609e9c7dd667afb3ab81 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TemplateService.o.d 
	@${RM} ${OBJECTDIR}/TemplateService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/TemplateService.o.d" -o ${OBJECTDIR}/TemplateService.o TemplateService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ES_Main.o: ES_Main.c  .generated_files/flags/default/22e170eb69299c5658f803a4f7eb0c9923426f9f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ES_Main.o.d 
	@${RM} ${OBJECTDIR}/ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/ES_Main.o.d" -o ${OBJECTDIR}/ES_Main.o ES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=8192,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=8192,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/EventCheckerTestv2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [python ../ECE118/scripts/Enum_To_String.py]"
	@python ../ECE118/scripts/Enum_To_String.py
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

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
