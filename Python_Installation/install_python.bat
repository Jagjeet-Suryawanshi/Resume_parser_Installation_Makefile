@ECHO OFF

FOR /F "tokens=2 delims= " %%I IN ('python --version 2^>^&1') DO (
    SET "MY_Version=%%I"
    ECHO Installed version is: %%I
)

Rem If python doesn't exist
winget install Python.Python.3.8

REM Store the Python version in a temporary text file
FOR /F "tokens=2 delims= " %%I IN ('python --version 2^>^&1') DO (
    ECHO %%I > version.txt
    SET "MY_V=%%I"
    ECHO Installed version is: %%I
)

SET /p MY_V=<version.txt
REM Delete the temporary text file
DEL version.txt

REM Remove dots from version string for comparison
SET "MY_V_COMP=%MY_V:.=%"
SET "COMPARE_VERSION=3810"

IF %MY_V_COMP% GTR %COMPARE_VERSION% (
    ECHO Existing Python version is greater than 3.8.10
    ECHO Python Version here: %MY_V%

    REM uninstalling higer version
    FOR /F "tokens=1,2 delims=." %%A IN ("%MY_V%") DO (
    winget uninstall Python.Python.%%A.%%B
)
    REM Install Required Python version
    winget install Python.Python.3.8

    REM If the python less than or equal to required version
) ELSE (
    ECHO Python version is equal to required version
)
