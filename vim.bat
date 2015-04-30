@echo off
rem ----------------------------------------------------
rem Set all variables
rem ----------------------------------------------------

rem Python
set python3_path="C:/Python34"
set python_version="34"

rem Lua
set lua_path="C:/Lua/5.1"
set lua_version="51"

rem Ruby
set ruby_path="C:/Ruby21"
set ruby_version="21"
set ruby_version_long="2.1.0" 

rem ----------------------------------------------------
rem Set directories
rem ----------------------------------------------------

set vim_src="vim\\src\\"
set workdir="..\\..\\workdir\\"
set logfile=%workdir%log.txt

PATH = C:\MinGW\bin;%PATH%

rem Change directory to vim_src 
cd /d %vim_src%

rem ----------------------------------------------------
rem Building
rem ----------------------------------------------------

echo Building gvim.exe ...
rem The following command will compile with both Python 2.7 and Python 3.3
mingw32-make.exe -f Make_ming.mak PYTHON3=python3_path PYTHON3_VER=python_version DYNAMIC_PYTHON3=yes FEATURES=HUGE GUI=yes LUA=lua_path LUA_VER=lua_version DYNAMIC_LUA=yes RUBY=ruby_path RUBY_VER=ruby_version DYNAMIC_RUBY=yes RUBY_VER_LONG=ruby_version_long gvim.exe >> "%logfile%"

echo Building vim.exe ...
rem The following command will compile with both Python 2.7 and Python 3.3
mingw32-make.exe -f Make_ming.mak PYTHON3=python3_path PYTHON3_VER=python_version DYNAMIC_PYTHON3=yes FEATURES=HUGE GUI=no LUA=lua_path LUA_VER=lua_version DYNAMIC_LUA=yes RUBY=ruby_path RUBY_VER=ruby_version DYNAMIC_RUBY=yes RUBY_VER_LONG=ruby_version_long vim.exe >> "%logfile%"

rem ----------------------------------------------------
rem mv exe file
rem ----------------------------------------------------

echo Moving files ...
move gvim.exe "%workdir%"
move vim.exe "%workdir%"

rem ----------------------------------------------------
rem Cleaning vim source
rem ----------------------------------------------------

echo Cleaning Vim source directory ...
rem NOTE: "mingw32-make.exe -f Make_ming.mak clean" does not finish the job
IF NOT %CD%==%vim_src% GOTO THEEND
IF NOT EXIST vim.h GOTO THEEND
IF EXIST pathdef.c DEL pathdef.c
IF EXIST obj\NUL      RMDIR /S /Q obj
IF EXIST obji386\NUL  RMDIR /S /Q obji386
IF EXIST gobj\NUL     RMDIR /S /Q gobj
IF EXIST gobji386\NUL RMDIR /S /Q gobji386
IF EXIST gvim.exe DEL gvim.exe
IF EXIST vim.exe  DEL vim.exe
:THEEND

pause
