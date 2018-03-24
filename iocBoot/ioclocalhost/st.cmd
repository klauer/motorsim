#!../../bin/darwin-x86/mtrSim

## You may have to change motorSim to something else
## everywhere it appears in this file

< envPaths
cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/mtrSim.dbd",0,0)
mtrSim_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadTemplate("db/sensor.substitutions")
dbLoadTemplate("db/motorSim.substitutions")
dbLoadRecords("db/fakemotor.db", "Sys=XF:31IDA-OP,Dev={Tbl-Ax:FakeMtr},Mtr=XF:31IDA-OP{Tbl-Ax:X1}Mtr")

motorSimCreateController("motorSim1", 8)
motorSimConfigAxis("motorSim1", 0, 20000, -20000,  500, 0)
motorSimConfigAxis("motorSim1", 1, 20000, -20000, 1500, 0)
motorSimConfigAxis("motorSim1", 2, 20000, -20000, 2500, 0)
motorSimConfigAxis("motorSim1", 3, 20000, -20000, 3000, 0)
motorSimConfigAxis("motorSim1", 4, 20000, -20000,  500, 0)
motorSimConfigAxis("motorSim1", 5, 20000, -20000, 1500, 0)
motorSimConfigAxis("motorSim1", 6, 20000, -20000, 2500, 0)
motorSimConfigAxis("motorSim1", 7, 20000, -20000, 3000, 0)

## autosave/restore machinery
save_restoreSet_Debug(0)
save_restoreSet_IncompleteSetsOk(1)
save_restoreSet_DatedBackupFiles(1)

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")

set_pass0_restoreFile("info_positions.sav")
set_pass0_restoreFile("info_settings.sav")
set_pass1_restoreFile("info_settings.sav")

cd ${TOP}/iocBoot/${IOC}
iocInit()

## more autosave/restore machinery
cd ${TOP}/as/req
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5 , "")
create_monitor_set("info_settings.req", 15 , "")
