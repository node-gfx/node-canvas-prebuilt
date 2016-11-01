@echo off

rem sets up MSYS environment and invokes the script argument in bash

set WD=C:\msys64\usr\bin\
set MSYSTEM=MINGW64
%WD%bash --login -c "cd $(cygpath '%cd%'); ""%~1"" ""%~2"" ""%~3"" ""%~4"" ""%~5"" ""%~6"" ""%~7"" ""%~8"" ""%~9"""

