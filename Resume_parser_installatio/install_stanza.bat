@echo off

dir /s /b stanza_models > temp_file3.txt
SET /P source_folder=<temp_file3.txt

REM Remove the trailing backslash if present
REM for %%i in ("%source_folder%\.") do set "source_folder=%%~dpi"
REM if "%source_folder:~-1%"=="\" set "source_folder=%source_folder:~0,-1%"

Echo folder: %source_folder%

dir /s /b Myenv > temp_file2.txt

set /P destinationFolder=<temp_file2.txt
for %%i in ("%destinationFolder%\.") do set "destinationFolder=%%~dpi"

echo New path:%destinationFolder%

move "%source_folder%\stanza_models" "%destinationFolder%"
