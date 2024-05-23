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
FINAL_IMAGE=${DISTDIR}/Sensors_and_Bumpers_Tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Sensors_and_Bumpers_Tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED="/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/RC_Servo.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c" Main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/976406494/AD.o ${OBJECTDIR}/_ext/976406494/BOARD.o ${OBJECTDIR}/_ext/976406494/IO_Ports.o ${OBJECTDIR}/_ext/976406494/LED.o ${OBJECTDIR}/_ext/976406494/RC_Servo.o ${OBJECTDIR}/_ext/976406494/pwm.o ${OBJECTDIR}/_ext/976406494/serial.o ${OBJECTDIR}/_ext/976406494/timers.o ${OBJECTDIR}/Main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/976406494/AD.o.d ${OBJECTDIR}/_ext/976406494/BOARD.o.d ${OBJECTDIR}/_ext/976406494/IO_Ports.o.d ${OBJECTDIR}/_ext/976406494/LED.o.d ${OBJECTDIR}/_ext/976406494/RC_Servo.o.d ${OBJECTDIR}/_ext/976406494/pwm.o.d ${OBJECTDIR}/_ext/976406494/serial.o.d ${OBJECTDIR}/_ext/976406494/timers.o.d ${OBJECTDIR}/Main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/976406494/AD.o ${OBJECTDIR}/_ext/976406494/BOARD.o ${OBJECTDIR}/_ext/976406494/IO_Ports.o ${OBJECTDIR}/_ext/976406494/LED.o ${OBJECTDIR}/_ext/976406494/RC_Servo.o ${OBJECTDIR}/_ext/976406494/pwm.o ${OBJECTDIR}/_ext/976406494/serial.o ${OBJECTDIR}/_ext/976406494/timers.o ${OBJECTDIR}/Main.o

# Source Files
SOURCEFILES=/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/RC_Servo.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c Main.c



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

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Sensors_and_Bumpers_Tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/976406494/AD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/AD.c  .generated_files/flags/default/7bf989ee2e52672830ace281d6615fe171e475a5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/AD.o.d" -o ${OBJECTDIR}/_ext/976406494/AD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/BOARD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/BOARD.c  .generated_files/flags/default/5b9ce0cd4a9a66c94c1660b19c1bf611d72711cd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/BOARD.o.d" -o ${OBJECTDIR}/_ext/976406494/BOARD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/IO_Ports.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/IO_Ports.c  .generated_files/flags/default/1d5b1f2f7433db44884e1dfe4262f866a2775cec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/976406494/IO_Ports.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/LED.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/LED.c  .generated_files/flags/default/8bd5cffd5c1f79ae1d32af84a4508900255066a3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/LED.o.d" -o ${OBJECTDIR}/_ext/976406494/LED.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/RC_Servo.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/RC_Servo.c  .generated_files/flags/default/145310b28132548f02306c5a909d2ebf25619ada .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/976406494/RC_Servo.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/RC_Servo.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/pwm.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/pwm.c  .generated_files/flags/default/1582d96bdfaf007129c37cc66389c923aa2f7ab8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/pwm.o.d" -o ${OBJECTDIR}/_ext/976406494/pwm.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/serial.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/serial.c  .generated_files/flags/default/8597e0d7cdfb9883a44687de6d57db32feb48d61 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/serial.o.d" -o ${OBJECTDIR}/_ext/976406494/serial.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/timers.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/timers.c  .generated_files/flags/default/6d18b9da6fbf8a34514fadd2b2247bbd5cfdc0b2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/timers.o.d" -o ${OBJECTDIR}/_ext/976406494/timers.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Main.o: Main.c  .generated_files/flags/default/33cbdb933f952aec380742c3bd6319fb9ce8d148 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/Main.o.d" -o ${OBJECTDIR}/Main.o Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/976406494/AD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/AD.c  .generated_files/flags/default/b5894c61ad782468230e42e81fc12d4672ec126a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/AD.o.d" -o ${OBJECTDIR}/_ext/976406494/AD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/BOARD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/BOARD.c  .generated_files/flags/default/f9a856dfe62965fc3c7bc41f485a2351dcfb3cc8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/BOARD.o.d" -o ${OBJECTDIR}/_ext/976406494/BOARD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/IO_Ports.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/IO_Ports.c  .generated_files/flags/default/6adb1f46ab6ea5bdcbbce63218098c0d4a573d55 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/976406494/IO_Ports.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/LED.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/LED.c  .generated_files/flags/default/dee4717024dc749958e3152f41f75e5efd0d6755 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/LED.o.d" -o ${OBJECTDIR}/_ext/976406494/LED.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/RC_Servo.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/RC_Servo.c  .generated_files/flags/default/47ec27911324300d52f9dd254085513cc8c0e65f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/976406494/RC_Servo.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/RC_Servo.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/pwm.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/pwm.c  .generated_files/flags/default/9f0f15a0ead1070addcb1809568bd4abec3f382 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/pwm.o.d" -o ${OBJECTDIR}/_ext/976406494/pwm.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/serial.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/serial.c  .generated_files/flags/default/1fb0f1c544fdec2160a53d5f92abd0ca4b89bd11 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/serial.o.d" -o ${OBJECTDIR}/_ext/976406494/serial.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/timers.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/timers.c  .generated_files/flags/default/c6eb16518b0674094f4193d52c3c6248637ac37b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/timers.o.d" -o ${OBJECTDIR}/_ext/976406494/timers.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Main.o: Main.c  .generated_files/flags/default/36532492e5dfd362cc8eab2882fae90f63f3a1e9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/Main.o.d" -o ${OBJECTDIR}/Main.o Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Sensors_and_Bumpers_Tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Sensors_and_Bumpers_Tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/Sensors_and_Bumpers_Tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Sensors_and_Bumpers_Tester.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}/xc32-bin2hex ${DISTDIR}/Sensors_and_Bumpers_Tester.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


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
