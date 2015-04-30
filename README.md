#Building Vim with vendors support

##Which support?
This file provide vim support for:
* Python3
* Ruby
* Lua

##Howto

###Get this content

```
git clone https://github.com/elpapito/vim_support.git
cd vim_support
git submodule init
git submodule update
```

###Set the variables

```shell
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

~~set vim_src="vim\\src\\"~~
~~set workdir="..\\..\\workdir\\"~~
~~set logfile=%workdir%log.txt~~

PATH = C:\MinGW\bin;%PATH%
```

###Run and fingers crossed

From vim\_support repository:

```shel
vim.bat
```

Next if the build does not fail, vim and gvim executable files both would be located to [workdir](https://github.com/elpapito/vim_support/tree/master/workdir) directory.

##Why ?

##How to add much support?

