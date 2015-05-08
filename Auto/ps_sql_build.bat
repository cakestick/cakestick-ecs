@@echo off
set _proj=%~dp0buildscripts\build.ps1
set _root=%~dp0
set inputfile=
set outputfile=

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC%==2 (
set inputfile=%1
set outputfile=%2
) else (
   SET /p inputfile="Source .TXT file: "
   SET /p outputfile="Output .SQL file: "
)

call :DeQuote _root
call :DeQuote inputfile
call :DeQuote outputfile

set _root="'%_root%'"
set inputfile="'%inputfile%'"
set outputfile="'%outputfile%'"

powershell.exe -command "& {&'%_proj%' %_root% %inputfile% %outputfile%}"
goto :eof

:DeQuote
for /f "delims=" %%A in ('echo %%%1%%') do set %1=%%~A
Goto :eof