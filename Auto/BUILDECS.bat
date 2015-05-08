@@echo off
cls

REM **********************
REM ** Folder locations **
REM **********************
set _root=%~dp0

REM **********************************************************
REM ** Concatenate the data to the end of the RedGate files **
REM **********************************************************
set _ps_sql_build="%~dp0ps_sql_build.bat"
call %_ps_sql_build% FullBuild.txt "Artifacts\ECS.SQL"


REM type Artifacts\ecs.sql