TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = stanfordSR570
# stanfordSR570.dbd will be created and installed
DBD += stanfordSR570.dbd

# stanfordSR570.dbd will be made up from these files:
stanfordSR570_DBD += base.dbd

# Include dbd files from all support applications:
stanfordSR570_DBD += caPutLog.dbd
stanfordSR570_DBD += asyn.dbd
stanfordSR570_DBD += stream.dbd
stanfordSR570_DBD += drvAsynIPPort.dbd
stanfordSR570_DBD += system.dbd
stanfordSR570_DBD += asSupport.dbd
stanfordSR570_DBD += devIocStats.dbd

# Add all the support libraries needed by this IOC
stanfordSR570_LIBS += caPutLog
stanfordSR570_LIBS += stream
stanfordSR570_LIBS += asyn
stanfordSR570_LIBS += devIocStats
stanfordSR570_LIBS += autosave

# stanfordSR570_registerRecordDeviceDriver.cpp derives from stanfordSR570.dbd
stanfordSR570_SRCS += stanfordSR570_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
stanfordSR570_SRCS_DEFAULT += stanfordSR570Main.cpp
stanfordSR570_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#stanfordSR570_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
stanfordSR570_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

