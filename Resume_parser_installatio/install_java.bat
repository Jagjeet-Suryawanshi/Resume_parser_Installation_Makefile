@ECHO OFF

REM Check if OpenJDK is already installed
FOR /F "tokens=3" %%I IN ('java -version 2^>^&1 ^| findstr /i "version"') DO (
    SET "INSTALLED_JAVA_V=%%I"
    REM ECHO Installed Java version is: %%I
)

REM Remove dots from version string for comparison
SET /a "INSTALLED_JAVA_V_COMP=%INSTALLED_JAVA_V:.=%"
SET "COMPARE_VERSION=1703"

REM Check if installed version is not equal to desired version
IF NOT "%INSTALLED_JAVA_V_COMP%"=="%COMPARE_VERSION%" (
    ECHO Either Java doesn't exist or version not equal to 17.0.3
    FOR /F "tokens=1,2 delims=." %%A IN ("%INSTALLED_JAVA_V%") DO (
    winget uninstall ojdkbuild.openjdk.%%A.jdk
)
    REM Oracle - 18
    winget install ojdkbuild.openjdk.17.jdk
) ELSE (
    ECHO Java version is already 17.0.3
)