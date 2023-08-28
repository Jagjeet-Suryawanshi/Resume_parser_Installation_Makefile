@echo off

dir /s /b punkt > temp_file1.txt

SET /P source_folder=<temp_file1.txt

REM Remove the trailing backslash if present
for %%i in ("%source_folder%\..") do set "source_folder=%%~dpi"
if "%source_folder:~-1%"=="\" set "source_folder=%source_folder:~0,-1%"

Echo folder: %source_folder%

dir /s /b Myenv > temp_file2.txt

set /P destinationFolder=<temp_file2.txt
for %%i in ("%destinationFolder%\.") do set "destinationFolder=%%~dpi"

echo New path:%destinationFolder%

mkdir %destinationFolder%nltk_data\taggers
mkdir %destinationFolder%nltk_data\tokenizers

move "%source_folder%\averaged_perceptron_tagger" "%destinationFolder%nltk_data\taggers"
move "%source_folder%\punkt" "%destinationFolder%nltk_data\tokenizers"

REM dir /s /b taggers
REM set "files_to_move=punkt.zip averaged_perceptron_tagger.zip"

REM for %%f in (%files_to_move%) do (
REM     move "%source_folder%\%%f" "%destinationFolder%nltk_data\taggers"
REM )



