@ECHO OFF

set serverHostName=%1
set configPath=%2

if "%1"=="" (
    ECHO REQUIRED: Please enter an argument to set Server Hostname / Ip 
) else (
    set "CCITCP2=%serverHostName%"
    ECHO CCITCP2 set to %serverHostName%
    
    if "%2"=="" (
        set "MFCSCFG=mfclisrv.cfg"
        ECHO MFCSCFG set to default mfclisrv.cfg
    ) else (
        set "MFCSCFG=%configPath%"
        ECHO MFCSCFG set to %configPath%
    )
)