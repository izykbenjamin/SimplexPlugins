setlocal

SET BUILD=pybuild
SET PY_VERSION=3.8.8 
SET COMPILER=Visual Studio 16 2019

SET PFX=%~dp0
cd %PFX%
rmdir %BUILD% /s /q
mkdir %BUILD%
cd %BUILD%


if "%ARCH%" == "64" (
    set PY_VERSION=%PY_VERSION%_64
    SET COMPILER=%COMPILER% Win64
)

cmake ^
    -DTARGET_DCC=Python ^
    -DPY_VERSION=%PY_VERSION% ^
    -G "%COMPILER%" ..\

cmake --build . --config Release --target INSTALL

pause

