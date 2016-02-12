#!../../bin/linux-x86_64/stanfordSR570

## You may have to change stanfordSR570 to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/stanfordSR570.dbd",0,0)
stanfordSR570_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/stanfordSR570.db","user=swilkins")

iocInit()

## Start any sequence programs
#seq sncstanfordSR570,"user=swilkins"
