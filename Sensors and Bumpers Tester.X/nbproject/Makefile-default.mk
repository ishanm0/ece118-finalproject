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
SOURCEFILES_QUOTED_IF_SPACED=C:/ECE118/src/AD.c C:/ECE118/src/BOARD.c C:/ECE118/src/IO_Ports.c C:/ECE118/src/LED.c C:/ECE118/src/RC_Servo.c C:/ECE118/src/pwm.c C:/ECE118/src/serial.c C:/ECE118/src/timers.c Main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/C:/ECE118/src/AD.o ${OBJECTDIR}/C:/ECE118/src/BOARD.o ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o ${OBJECTDIR}/C:/ECE118/src/LED.o ${OBJECTDIR}/C:/ECE118/src/RC_Servo.o ${OBJECTDIR}/C:/ECE118/src/pwm.o ${OBJECTDIR}/C:/ECE118/src/serial.o ${OBJECTDIR}/C:/ECE118/src/timers.o ${OBJECTDIR}/Main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/C:/ECE118/src/AD.o.d ${OBJECTDIR}/C:/ECE118/src/BOARD.o.d ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o.d ${OBJECTDIR}/C:/ECE118/src/LED.o.d ${OBJECTDIR}/C:/ECE118/src/RC_Servo.o.d ${OBJECTDIR}/C:/ECE118/src/pwm.o.d ${OBJECTDIR}/C:/ECE118/src/serial.o.d ${OBJECTDIR}/C:/ECE118/src/timers.o.d ${OBJECTDIR}/Main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/C:/ECE118/src/AD.o ${OBJECTDIR}/C:/ECE118/src/BOARD.o ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o ${OBJECTDIR}/C:/ECE118/src/LED.o ${OBJECTDIR}/C:/ECE118/src/RC_Servo.o ${OBJECTDIR}/C:/ECE118/src/pwm.o ${OBJECTDIR}/C:/ECE118/src/serial.o ${OBJECTDIR}/C:/ECE118/src/timers.o ${OBJECTDIR}/Main.o

# Source Files
SOURCEFILES=C:/ECE118/src/AD.c C:/ECE118/src/BOARD.c C:/ECE118/src/IO_Ports.c C:/ECE118/src/LED.c C:/ECE118/src/RC_Servo.c C:/ECE118/src/pwm.c C:/ECE118/src/serial.c C:/ECE118/src/timers.c Main.c



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
MP_LINKER_FILE_OPTION=,--script="C:/ECE118/bootloader320.ld"
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
${OBJECTDIR}/C:/ECE118/src/AD.o: C:/ECE118/src/AD.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/AD.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/AD.o.d" -o ${OBJECTDIR}/C:/ECE118/src/AD.o C:/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/BOARD.o: C:/ECE118/src/BOARD.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/BOARD.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/BOARD.o.d" -o ${OBJECTDIR}/C:/ECE118/src/BOARD.o C:/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/IO_Ports.o: C:/ECE118/src/IO_Ports.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/IO_Ports.o.d" -o ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o C:/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/LED.o: C:/ECE118/src/LED.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/LED.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/LED.o.d" -o ${OBJECTDIR}/C:/ECE118/src/LED.o C:/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/RC_Servo.o: C:/ECE118/src/RC_Servo.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/RC_Servo.o.d" -o ${OBJECTDIR}/C:/ECE118/src/RC_Servo.o C:/ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/pwm.o: C:/ECE118/src/pwm.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/pwm.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/pwm.o.d" -o ${OBJECTDIR}/C:/ECE118/src/pwm.o C:/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/serial.o: C:/ECE118/src/serial.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/serial.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/serial.o.d" -o ${OBJECTDIR}/C:/ECE118/src/serial.o C:/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/timers.o: C:/ECE118/src/timers.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/timers.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/timers.o.d" -o ${OBJECTDIR}/C:/ECE118/src/timers.o C:/ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Main.o: Main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/Main.o.d" -o ${OBJECTDIR}/Main.o Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/C:/ECE118/src/AD.o: C:/ECE118/src/AD.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/AD.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/AD.o.d" -o ${OBJECTDIR}/C:/ECE118/src/AD.o C:/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/BOARD.o: C:/ECE118/src/BOARD.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/BOARD.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/BOARD.o.d" -o ${OBJECTDIR}/C:/ECE118/src/BOARD.o C:/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/IO_Ports.o: C:/ECE118/src/IO_Ports.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/IO_Ports.o.d" -o ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o C:/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/LED.o: C:/ECE118/src/LED.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/LED.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/LED.o.d" -o ${OBJECTDIR}/C:/ECE118/src/LED.o C:/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/RC_Servo.o: C:/ECE118/src/RC_Servo.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/RC_Servo.o.d" -o ${OBJECTDIR}/C:/ECE118/src/RC_Servo.o C:/ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/pwm.o: C:/ECE118/src/pwm.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/pwm.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/pwm.o.d" -o ${OBJECTDIR}/C:/ECE118/src/pwm.o C:/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/serial.o: C:/ECE118/src/serial.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/serial.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/serial.o.d" -o ${OBJECTDIR}/C:/ECE118/src/serial.o C:/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/timers.o: C:/ECE118/src/timers.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/timers.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/timers.o.d" -o ${OBJECTDIR}/C:/ECE118/src/timers.o C:/ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Main.o: Main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../../../Documents/School/ECE 118/Labs/ECE118/include" -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/Main.o.d" -o ${OBJECTDIR}/Main.o Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Sensors_and_Bumpers_Tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Sensors_and_Bumpers_Tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/Sensors_and_Bumpers_Tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/ECE118/bootloader320.ld
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
