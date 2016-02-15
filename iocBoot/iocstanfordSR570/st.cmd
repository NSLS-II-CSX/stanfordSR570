#!../../bin/linux-x86_64/stanfordSR570

## You may have to change stanfordSR570 to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST" , "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST"      , "10.23.0.255")
epicsEnvSet("STREAM_PROTOCOL_PATH"    , "$(TOP)/proto")

## Register all support components
dbLoadDatabase("$(TOP)/dbd/stanfordSR570.dbd",0,0)
stanfordSR570_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("P1", "10.23.2.63:4001")
#asynSetTraceMask("P1", 0, 0x9)
#asynSetTraceIOMask("P1", 0, 0x2)
drvAsynIPPortConfigure("P2", "10.23.2.63:4002")
#asynSetTraceMask("P2", 0, 0x9)
#asynSetTraceIOMask("P2", 0, 0x2)

## Load record instances
dbLoadRecords("$(TOP)/db/sr570.db","Sys=XF:23ID1-ES,Dev={CurrAmp:1},PORT=P1")
dbLoadRecords("$(TOP)/db/sr570.db","Sys=XF:23ID1-ES,Dev={CurrAmp:2},PORT=P2")


system("install -m 777 -d $(TOP)/as/save") 
system("install -m 777 -d $(TOP)/as/req")

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")
set_pass0_restoreFile("info_positions.sav")
set_pass1_restoreFile("info_settings.sav")

asSetSubstitutions("WS=csxwsall")
asSetFilename("/epics/xf/23id/xf23id.acf")

iocInit()

caPutLogInit("xf23id-ca.cs.nsls2.local:7004", 0)

cd ${TOP}/as/req
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5 , "")
create_monitor_set("info_settings.req", 15 , "")

dbl > ${TOP}/records.dbl
system("cp ${TOP}/records.dbl /cf-update/xf23id1-ioc3.es-sr570.dbl")
