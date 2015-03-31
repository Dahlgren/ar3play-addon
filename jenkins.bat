@echo off

REM Map variables from Jenkins
SET DRIVE=%1

REM Map build drive
SUBST %DRIVE% /d >nul 2>&1
IF EXIST a3 (RMDIR a3) >nul 2>&1
SUBST %DRIVE% .

REM Build with pboproject
REM
REM -Workspace]=\any\where a root drive or a folder
REM -Mod=
REM +/-Noisy
REM +/-Strip strip log
REM +/-Clean
REM +/-X external file checks
REM +/-MP multiplayer missions
REM -Engine= Arrowhead (default) or arma3
REM -P Do not pause
REM -Islands=\any\where comma,separated,list,of paths\to\any\where
REM +Key=\any\where sign pbo's using new privatekey
REM +Key sign these pbos using existing privatekey
REM -Key don't sign these pbos (but preserve existing privatekey if any)
REM
pboproject -P %DRIVE%\ar3play -Engine=Arma3 -Noisy +Strip +X +Clean -Workspace=%DRIVE%\ -Mod=%DRIVE%\@ar3play -Key
SET STATUSCODE=%ERRORLEVEL%

REM Echo log files
FOR /R temp %%F IN (*.log) DO TYPE %%F

REM Unmount drive
SUBST %DRIVE% /d >nul 2>&1

EXIT /B %STATUSCODE%
