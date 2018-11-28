#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-MacOSX
CND_DLIB_EXT=dylib
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/ALGO/ContourAnalyzation.o \
	${OBJECTDIR}/ALGO/Sobel.o \
	${OBJECTDIR}/IPF/Series.o \
	${OBJECTDIR}/UTIL/CameraSource.o \
	${OBJECTDIR}/main.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-lopencv_core -lopencv_highgui -lopencv_imgcodecs -lopencv_imgproc -lopencv_video -lopencv_videoio -lopencv_videostab

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/iips

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/iips: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/iips ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/ALGO/ContourAnalyzation.o: ALGO/ContourAnalyzation.cpp
	${MKDIR} -p ${OBJECTDIR}/ALGO
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/local/Cellar/opencv/3.4.3/include/opencv2 -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ALGO/ContourAnalyzation.o ALGO/ContourAnalyzation.cpp

${OBJECTDIR}/ALGO/Sobel.o: ALGO/Sobel.cpp
	${MKDIR} -p ${OBJECTDIR}/ALGO
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/local/Cellar/opencv/3.4.3/include/opencv2 -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ALGO/Sobel.o ALGO/Sobel.cpp

${OBJECTDIR}/IPF/Series.o: IPF/Series.cpp
	${MKDIR} -p ${OBJECTDIR}/IPF
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/local/Cellar/opencv/3.4.3/include/opencv2 -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/IPF/Series.o IPF/Series.cpp

${OBJECTDIR}/UTIL/CameraSource.o: UTIL/CameraSource.cpp
	${MKDIR} -p ${OBJECTDIR}/UTIL
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/local/Cellar/opencv/3.4.3/include/opencv2 -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/UTIL/CameraSource.o UTIL/CameraSource.cpp

${OBJECTDIR}/main.o: main.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/local/Cellar/opencv/3.4.3/include/opencv2 -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc