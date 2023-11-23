:: Compress MP4 File Using FFMPEG h264_nven
:: Install with winget install ffmpeg

@echo off
setlocal enabledelayedexpansion

:: Define quality parameter for qp
:: Higher number means smaller file size, higher compression which = lower quality. 
:: 16-18 are good starting points
set qp=17

:: compress each mp4 into a folder called compressed
for %%A in (*.mp4) do (
    echo Processing file: %%A
    mkdir "%%~dpACompressed" 2>nul
    set "baseName=%%~dpACompressed\%%~nA_compressed"
    set "outputFile=!baseName!.mp4"
    set /a counter=1

:: check if the file already exists and create a new one with appended number that increments by 1
    :checkFile
    if exist "!outputFile!" (
        set "outputFile=!baseName!_!counter!.mp4"
        set /a counter+=1
        goto checkFile
    )

:: ffmpeg command on fast preset to output your file     
    ffmpeg -i "%%A" -c:v h264_nvenc -preset fast -qp %qp% -c:a copy -n "!outputFile!"

)

pause
