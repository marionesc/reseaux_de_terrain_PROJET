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
FINAL_IMAGE=${DISTDIR}/Projet.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Projet.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=afficheur.h eep_spi.h i2c.h main.h spi.h oneWire.h afficheur.c eep_spi.c i2c.c main.c spi.c oneWire.c can.c can.h

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/afficheur.o ${OBJECTDIR}/eep_spi.o ${OBJECTDIR}/i2c.o ${OBJECTDIR}/main.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/oneWire.o ${OBJECTDIR}/afficheur.p1 ${OBJECTDIR}/eep_spi.p1 ${OBJECTDIR}/i2c.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/spi.p1 ${OBJECTDIR}/oneWire.p1 ${OBJECTDIR}/can.p1 ${OBJECTDIR}/can.o
POSSIBLE_DEPFILES=${OBJECTDIR}/afficheur.o.d ${OBJECTDIR}/eep_spi.o.d ${OBJECTDIR}/i2c.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/spi.o.d ${OBJECTDIR}/oneWire.o.d ${OBJECTDIR}/afficheur.p1.d ${OBJECTDIR}/eep_spi.p1.d ${OBJECTDIR}/i2c.p1.d ${OBJECTDIR}/main.p1.d ${OBJECTDIR}/spi.p1.d ${OBJECTDIR}/oneWire.p1.d ${OBJECTDIR}/can.p1.d ${OBJECTDIR}/can.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/afficheur.o ${OBJECTDIR}/eep_spi.o ${OBJECTDIR}/i2c.o ${OBJECTDIR}/main.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/oneWire.o ${OBJECTDIR}/afficheur.p1 ${OBJECTDIR}/eep_spi.p1 ${OBJECTDIR}/i2c.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/spi.p1 ${OBJECTDIR}/oneWire.p1 ${OBJECTDIR}/can.p1 ${OBJECTDIR}/can.o

# Source Files
SOURCEFILES=afficheur.h eep_spi.h i2c.h main.h spi.h oneWire.h afficheur.c eep_spi.c i2c.c main.c spi.c oneWire.c can.c can.h



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Projet.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F87K22
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/afficheur.o: afficheur.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/afficheur.o.d 
	@${RM} ${OBJECTDIR}/afficheur.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/afficheur.o afficheur.h 
	@-${MV} ${OBJECTDIR}/afficheur.d ${OBJECTDIR}/afficheur.o.d 
	@${FIXDEPS} ${OBJECTDIR}/afficheur.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/eep_spi.o: eep_spi.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eep_spi.o.d 
	@${RM} ${OBJECTDIR}/eep_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/eep_spi.o eep_spi.h 
	@-${MV} ${OBJECTDIR}/eep_spi.d ${OBJECTDIR}/eep_spi.o.d 
	@${FIXDEPS} ${OBJECTDIR}/eep_spi.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/i2c.o: i2c.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/i2c.o i2c.h 
	@-${MV} ${OBJECTDIR}/i2c.d ${OBJECTDIR}/i2c.o.d 
	@${FIXDEPS} ${OBJECTDIR}/i2c.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.o: main.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/main.o main.h 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.o.d 
	@${FIXDEPS} ${OBJECTDIR}/main.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/spi.o: spi.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/spi.o spi.h 
	@-${MV} ${OBJECTDIR}/spi.d ${OBJECTDIR}/spi.o.d 
	@${FIXDEPS} ${OBJECTDIR}/spi.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/oneWire.o: oneWire.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oneWire.o.d 
	@${RM} ${OBJECTDIR}/oneWire.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/oneWire.o oneWire.h 
	@-${MV} ${OBJECTDIR}/oneWire.d ${OBJECTDIR}/oneWire.o.d 
	@${FIXDEPS} ${OBJECTDIR}/oneWire.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/afficheur.p1: afficheur.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/afficheur.p1.d 
	@${RM} ${OBJECTDIR}/afficheur.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/afficheur.p1 afficheur.c 
	@-${MV} ${OBJECTDIR}/afficheur.d ${OBJECTDIR}/afficheur.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/afficheur.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/eep_spi.p1: eep_spi.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eep_spi.p1.d 
	@${RM} ${OBJECTDIR}/eep_spi.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/eep_spi.p1 eep_spi.c 
	@-${MV} ${OBJECTDIR}/eep_spi.d ${OBJECTDIR}/eep_spi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/eep_spi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/i2c.p1: i2c.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.p1.d 
	@${RM} ${OBJECTDIR}/i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/i2c.p1 i2c.c 
	@-${MV} ${OBJECTDIR}/i2c.d ${OBJECTDIR}/i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/spi.p1: spi.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.p1.d 
	@${RM} ${OBJECTDIR}/spi.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/spi.p1 spi.c 
	@-${MV} ${OBJECTDIR}/spi.d ${OBJECTDIR}/spi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/spi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/oneWire.p1: oneWire.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oneWire.p1.d 
	@${RM} ${OBJECTDIR}/oneWire.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/oneWire.p1 oneWire.c 
	@-${MV} ${OBJECTDIR}/oneWire.d ${OBJECTDIR}/oneWire.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/oneWire.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/can.p1: can.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/can.p1.d 
	@${RM} ${OBJECTDIR}/can.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/can.p1 can.c 
	@-${MV} ${OBJECTDIR}/can.d ${OBJECTDIR}/can.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/can.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/can.o: can.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/can.o.d 
	@${RM} ${OBJECTDIR}/can.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/can.o can.h 
	@-${MV} ${OBJECTDIR}/can.d ${OBJECTDIR}/can.o.d 
	@${FIXDEPS} ${OBJECTDIR}/can.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/afficheur.o: afficheur.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/afficheur.o.d 
	@${RM} ${OBJECTDIR}/afficheur.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/afficheur.o afficheur.h 
	@-${MV} ${OBJECTDIR}/afficheur.d ${OBJECTDIR}/afficheur.o.d 
	@${FIXDEPS} ${OBJECTDIR}/afficheur.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/eep_spi.o: eep_spi.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eep_spi.o.d 
	@${RM} ${OBJECTDIR}/eep_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/eep_spi.o eep_spi.h 
	@-${MV} ${OBJECTDIR}/eep_spi.d ${OBJECTDIR}/eep_spi.o.d 
	@${FIXDEPS} ${OBJECTDIR}/eep_spi.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/i2c.o: i2c.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/i2c.o i2c.h 
	@-${MV} ${OBJECTDIR}/i2c.d ${OBJECTDIR}/i2c.o.d 
	@${FIXDEPS} ${OBJECTDIR}/i2c.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.o: main.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/main.o main.h 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.o.d 
	@${FIXDEPS} ${OBJECTDIR}/main.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/spi.o: spi.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/spi.o spi.h 
	@-${MV} ${OBJECTDIR}/spi.d ${OBJECTDIR}/spi.o.d 
	@${FIXDEPS} ${OBJECTDIR}/spi.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/oneWire.o: oneWire.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oneWire.o.d 
	@${RM} ${OBJECTDIR}/oneWire.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/oneWire.o oneWire.h 
	@-${MV} ${OBJECTDIR}/oneWire.d ${OBJECTDIR}/oneWire.o.d 
	@${FIXDEPS} ${OBJECTDIR}/oneWire.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/afficheur.p1: afficheur.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/afficheur.p1.d 
	@${RM} ${OBJECTDIR}/afficheur.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/afficheur.p1 afficheur.c 
	@-${MV} ${OBJECTDIR}/afficheur.d ${OBJECTDIR}/afficheur.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/afficheur.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/eep_spi.p1: eep_spi.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eep_spi.p1.d 
	@${RM} ${OBJECTDIR}/eep_spi.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/eep_spi.p1 eep_spi.c 
	@-${MV} ${OBJECTDIR}/eep_spi.d ${OBJECTDIR}/eep_spi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/eep_spi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/i2c.p1: i2c.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.p1.d 
	@${RM} ${OBJECTDIR}/i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/i2c.p1 i2c.c 
	@-${MV} ${OBJECTDIR}/i2c.d ${OBJECTDIR}/i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/spi.p1: spi.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.p1.d 
	@${RM} ${OBJECTDIR}/spi.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/spi.p1 spi.c 
	@-${MV} ${OBJECTDIR}/spi.d ${OBJECTDIR}/spi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/spi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/oneWire.p1: oneWire.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oneWire.p1.d 
	@${RM} ${OBJECTDIR}/oneWire.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/oneWire.p1 oneWire.c 
	@-${MV} ${OBJECTDIR}/oneWire.d ${OBJECTDIR}/oneWire.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/oneWire.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/can.p1: can.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/can.p1.d 
	@${RM} ${OBJECTDIR}/can.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/can.p1 can.c 
	@-${MV} ${OBJECTDIR}/can.d ${OBJECTDIR}/can.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/can.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/can.o: can.h  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/can.o.d 
	@${RM} ${OBJECTDIR}/can.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/can.o can.h 
	@-${MV} ${OBJECTDIR}/can.d ${OBJECTDIR}/can.o.d 
	@${FIXDEPS} ${OBJECTDIR}/can.o.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

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
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Projet.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/Projet.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=pickit3  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/Projet.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/Projet.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/Projet.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/Projet.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1    -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"/Applications/microchip/xc8/v2.32/pic/include/proc" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/Projet.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
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

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
