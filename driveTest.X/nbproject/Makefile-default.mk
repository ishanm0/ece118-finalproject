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
FINAL_IMAGE=${DISTDIR}/driveTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/driveTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=/Users/ishanmadan/Developer/_school/ece118-finalproject/driveTest.X/main.c "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c" "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c"

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/389407538/main.o ${OBJECTDIR}/_ext/976406494/AD.o ${OBJECTDIR}/_ext/976406494/BOARD.o ${OBJECTDIR}/_ext/976406494/IO_Ports.o ${OBJECTDIR}/_ext/976406494/LED.o ${OBJECTDIR}/_ext/976406494/pwm.o ${OBJECTDIR}/_ext/976406494/serial.o ${OBJECTDIR}/_ext/976406494/timers.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/389407538/main.o.d ${OBJECTDIR}/_ext/976406494/AD.o.d ${OBJECTDIR}/_ext/976406494/BOARD.o.d ${OBJECTDIR}/_ext/976406494/IO_Ports.o.d ${OBJECTDIR}/_ext/976406494/LED.o.d ${OBJECTDIR}/_ext/976406494/pwm.o.d ${OBJECTDIR}/_ext/976406494/serial.o.d ${OBJECTDIR}/_ext/976406494/timers.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/389407538/main.o ${OBJECTDIR}/_ext/976406494/AD.o ${OBJECTDIR}/_ext/976406494/BOARD.o ${OBJECTDIR}/_ext/976406494/IO_Ports.o ${OBJECTDIR}/_ext/976406494/LED.o ${OBJECTDIR}/_ext/976406494/pwm.o ${OBJECTDIR}/_ext/976406494/serial.o ${OBJECTDIR}/_ext/976406494/timers.o

# Source Files
SOURCEFILES=/Users/ishanmadan/Developer/_school/ece118-finalproject/driveTest.X/main.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c /Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/driveTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/389407538/main.o: /Users/ishanmadan/Developer/_school/ece118-finalproject/driveTest.X/main.c  .generated_files/flags/default/177c1a93f242b8e701a9fb343da38a62a8ce0a33 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/389407538" 
	@${RM} ${OBJECTDIR}/_ext/389407538/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/389407538/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/389407538/main.o.d" -o ${OBJECTDIR}/_ext/389407538/main.o /Users/ishanmadan/Developer/_school/ece118-finalproject/driveTest.X/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/AD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/AD.c  .generated_files/flags/default/290c7f373fd90f54831f42621b0162eb71b74f21 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/AD.o.d" -o ${OBJECTDIR}/_ext/976406494/AD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/BOARD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/BOARD.c  .generated_files/flags/default/ac73a1475f4270d22c92ac104bf00ef778aa9fd3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/BOARD.o.d" -o ${OBJECTDIR}/_ext/976406494/BOARD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/IO_Ports.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/IO_Ports.c  .generated_files/flags/default/bddb4f727c3927cc0ea79a89d7e9a2840b6b924b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/976406494/IO_Ports.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/LED.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/LED.c  .generated_files/flags/default/9d2591263f9286fb32b28ff6eb6f1fa8233f40e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/LED.o.d" -o ${OBJECTDIR}/_ext/976406494/LED.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/pwm.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/pwm.c  .generated_files/flags/default/d97f0f4e237f801a8ce2b142bab04cf545fa256 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/pwm.o.d" -o ${OBJECTDIR}/_ext/976406494/pwm.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/serial.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/serial.c  .generated_files/flags/default/e230df39b02a695f3855b04db16becf70dd2f6f8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/serial.o.d" -o ${OBJECTDIR}/_ext/976406494/serial.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/timers.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/timers.c  .generated_files/flags/default/a670a40d9a19d2b0569e1644da6083a9dbf0abbb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/timers.o.d" -o ${OBJECTDIR}/_ext/976406494/timers.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/389407538/main.o: /Users/ishanmadan/Developer/_school/ece118-finalproject/driveTest.X/main.c  .generated_files/flags/default/83e30477ab4df3d98190c35e2a943c5326cd3dbf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/389407538" 
	@${RM} ${OBJECTDIR}/_ext/389407538/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/389407538/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/389407538/main.o.d" -o ${OBJECTDIR}/_ext/389407538/main.o /Users/ishanmadan/Developer/_school/ece118-finalproject/driveTest.X/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/AD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/AD.c  .generated_files/flags/default/4a6145246dff762b73aa5277ad25611c5d85a992 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/AD.o.d" -o ${OBJECTDIR}/_ext/976406494/AD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/AD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/BOARD.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/BOARD.c  .generated_files/flags/default/333b4319f232d8cbe47b5b35b6ab5769d853631f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/BOARD.o.d" -o ${OBJECTDIR}/_ext/976406494/BOARD.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/BOARD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/IO_Ports.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/IO_Ports.c  .generated_files/flags/default/44fa9638c7fc73e59151a9b41be667152ce06cca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/976406494/IO_Ports.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/LED.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/LED.c  .generated_files/flags/default/d7a3b706b6590daf81e26d44f802f6724c4426e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/LED.o.d" -o ${OBJECTDIR}/_ext/976406494/LED.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/LED.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/pwm.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/pwm.c  .generated_files/flags/default/2b33857f23acf3b542d871e28447bf591bbc5a5c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/pwm.o.d" -o ${OBJECTDIR}/_ext/976406494/pwm.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/pwm.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/serial.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/serial.c  .generated_files/flags/default/c58edb3d39ce9908c1cba351a7ea1c49e03f7755 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/serial.o.d" -o ${OBJECTDIR}/_ext/976406494/serial.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/serial.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/976406494/timers.o: /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/src/timers.c  .generated_files/flags/default/e3fb13b010a06ccd879be959d48bf24c0adff0c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/976406494" 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/976406494/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/976406494/timers.o.d" -o ${OBJECTDIR}/_ext/976406494/timers.o "/Users/ishanmadan/Documents/School/ECE 118/Labs/ECE118/src/timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/driveTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/driveTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/driveTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   /Users/ishanmadan/Documents/School/ECE\ 118/Labs/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/driveTest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}/xc32-bin2hex ${DISTDIR}/driveTest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
