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
FINAL_IMAGE=${DISTDIR}/unoTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/unoTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=unoTest_main.c C:/ECE118/src/AD.c C:/ECE118/src/BOARD.c C:/ECE118/src/IO_Ports.c C:/ECE118/src/LED.c C:/ECE118/src/pwm.c C:/ECE118/src/serial.c C:/ECE118/src/timers.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/unoTest_main.o ${OBJECTDIR}/C:/ECE118/src/AD.o ${OBJECTDIR}/C:/ECE118/src/BOARD.o ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o ${OBJECTDIR}/C:/ECE118/src/LED.o ${OBJECTDIR}/C:/ECE118/src/pwm.o ${OBJECTDIR}/C:/ECE118/src/serial.o ${OBJECTDIR}/C:/ECE118/src/timers.o
POSSIBLE_DEPFILES=${OBJECTDIR}/unoTest_main.o.d ${OBJECTDIR}/C:/ECE118/src/AD.o.d ${OBJECTDIR}/C:/ECE118/src/BOARD.o.d ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o.d ${OBJECTDIR}/C:/ECE118/src/LED.o.d ${OBJECTDIR}/C:/ECE118/src/pwm.o.d ${OBJECTDIR}/C:/ECE118/src/serial.o.d ${OBJECTDIR}/C:/ECE118/src/timers.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/unoTest_main.o ${OBJECTDIR}/C:/ECE118/src/AD.o ${OBJECTDIR}/C:/ECE118/src/BOARD.o ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o ${OBJECTDIR}/C:/ECE118/src/LED.o ${OBJECTDIR}/C:/ECE118/src/pwm.o ${OBJECTDIR}/C:/ECE118/src/serial.o ${OBJECTDIR}/C:/ECE118/src/timers.o

# Source Files
SOURCEFILES=unoTest_main.c C:/ECE118/src/AD.c C:/ECE118/src/BOARD.c C:/ECE118/src/IO_Ports.c C:/ECE118/src/LED.c C:/ECE118/src/pwm.c C:/ECE118/src/serial.c C:/ECE118/src/timers.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/unoTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/unoTest_main.o: unoTest_main.c  .generated_files/flags/default/f4d4bdd325ceb77441642532f6d8e0e0f53f4d96 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/unoTest_main.o.d 
	@${RM} ${OBJECTDIR}/unoTest_main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/unoTest_main.o.d" -o ${OBJECTDIR}/unoTest_main.o unoTest_main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/AD.o: C:/ECE118/src/AD.c  .generated_files/flags/default/fcd3ab457e0d72a7a2178c53c0e19924d9d442c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/AD.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/AD.o.d" -o ${OBJECTDIR}/C:/ECE118/src/AD.o C:/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/BOARD.o: C:/ECE118/src/BOARD.c  .generated_files/flags/default/9c0d70ef9176d290098e989bd17a9318729248fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/BOARD.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/BOARD.o.d" -o ${OBJECTDIR}/C:/ECE118/src/BOARD.o C:/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/IO_Ports.o: C:/ECE118/src/IO_Ports.c  .generated_files/flags/default/757c924444b41e131c51555ca9061b4695c37d6d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/IO_Ports.o.d" -o ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o C:/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/LED.o: C:/ECE118/src/LED.c  .generated_files/flags/default/4b434961692d851cd579cd988fb7179af6d89a0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/LED.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/LED.o.d" -o ${OBJECTDIR}/C:/ECE118/src/LED.o C:/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/pwm.o: C:/ECE118/src/pwm.c  .generated_files/flags/default/b15fd33cfa371ab8f19a193f1c8ec8219249a2f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/pwm.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/pwm.o.d" -o ${OBJECTDIR}/C:/ECE118/src/pwm.o C:/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/serial.o: C:/ECE118/src/serial.c  .generated_files/flags/default/fea9a6a6688fe5a4590e2bc8b920cff41b9fc512 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/serial.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/serial.o.d" -o ${OBJECTDIR}/C:/ECE118/src/serial.o C:/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/timers.o: C:/ECE118/src/timers.c  .generated_files/flags/default/dcaaa3cfe741287b1f0bca5c969509a6091f5983 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/timers.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/timers.o.d" -o ${OBJECTDIR}/C:/ECE118/src/timers.o C:/ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/unoTest_main.o: unoTest_main.c  .generated_files/flags/default/e4613d960c068af904a6867e60ac5f84659025f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/unoTest_main.o.d 
	@${RM} ${OBJECTDIR}/unoTest_main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/unoTest_main.o.d" -o ${OBJECTDIR}/unoTest_main.o unoTest_main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/AD.o: C:/ECE118/src/AD.c  .generated_files/flags/default/b6c714e8c10fcabaaf005249d004cac568eb9e98 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/AD.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/AD.o.d" -o ${OBJECTDIR}/C:/ECE118/src/AD.o C:/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/BOARD.o: C:/ECE118/src/BOARD.c  .generated_files/flags/default/f403efbc534b121f86121229e269357bdd169aec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/BOARD.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/BOARD.o.d" -o ${OBJECTDIR}/C:/ECE118/src/BOARD.o C:/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/IO_Ports.o: C:/ECE118/src/IO_Ports.c  .generated_files/flags/default/61c1674d079ac467840bca9f43062e5ae59dfed4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/IO_Ports.o.d" -o ${OBJECTDIR}/C:/ECE118/src/IO_Ports.o C:/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/LED.o: C:/ECE118/src/LED.c  .generated_files/flags/default/14cebbbbb329949d7c37bb0f0b99db19efc3d4a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/LED.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/LED.o.d" -o ${OBJECTDIR}/C:/ECE118/src/LED.o C:/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/pwm.o: C:/ECE118/src/pwm.c  .generated_files/flags/default/c1dde2cbe3b6331b44c43dcf2bc90ae43c8a279 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/pwm.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/pwm.o.d" -o ${OBJECTDIR}/C:/ECE118/src/pwm.o C:/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/serial.o: C:/ECE118/src/serial.c  .generated_files/flags/default/54918fa74f958e8ebe692f6da4a7a5b75b52b325 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/serial.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/serial.o.d" -o ${OBJECTDIR}/C:/ECE118/src/serial.o C:/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/C:/ECE118/src/timers.o: C:/ECE118/src/timers.c  .generated_files/flags/default/69d388da6194fc94fe7adfdac05c30d9920d80e4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/C:/ECE118/src" 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/timers.o.d 
	@${RM} ${OBJECTDIR}/C:/ECE118/src/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/C:/ECE118/src/timers.o.d" -o ${OBJECTDIR}/C:/ECE118/src/timers.o C:/ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/unoTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/unoTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/unoTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/unoTest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}/xc32-bin2hex ${DISTDIR}/unoTest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
