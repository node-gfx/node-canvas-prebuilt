rem wraps preinstall.sh by setting up MSYS first
rem make sure the path to MSYS is correct

set WD=C:\msys64\usr\bin\
set MSYSTEM=MINGW64
%WD%sh --login %~dp0\try.sh

