@echo off

set MATLAB=D:\Matlab2020b

cd .

if "%1"=="" ("D:\MATLAB~1\bin\win64\gmake"  -f treemodel_rtw.mk all) else ("D:\MATLAB~1\bin\win64\gmake"  -f treemodel_rtw.mk %1)
@if errorlevel 1 goto error_exit

exit 0

:error_exit
echo The make command returned an error of %errorlevel%
exit 1