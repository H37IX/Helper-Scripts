# FFmpeg Helper Commands

This document contains various FFmpeg commands for different purposes. Make sure FFmpeg is installed and in your PATH. On Windows you can install FFmpeg with:
```bash
winget install ffmpeg
```

## RTSP Camera to RTMP Server Stream

Converts RTSP stream from IP camera to RTMP for streaming using libx265 codec.

```batch
SET USERNAME=your-user
SET PASSWORD=your-pass
SET RTSP_IP=192.168.1.1
SET RTMP_IP=10.1.1.10
ffmpeg.exe -v verbose -rtsp_transport tcp -i "rtsp://%USERNAME%:%PASSWORD%@%RTSP_IP%/cam/realmonitor?channel=1&subtype=0" -c:v libx265 -crf 30 -preset fast -c:a aac -b:a 128k -f mp2 "rtmp://%RTMP_IP%:1935/livestream/stream"
```

## Convert MP4 to MKV

Converts MP4 files to MKV format using libsvtav1 codec. Creates a 'Processed' folder for output.

```batch
set qp=17
for %%A in (*.mp4, *.mkv) do (
    mkdir "%%~dpAProcessed" 2>nul
    ffmpeg -i "%%A" -c:v libsvtav1 -map 0 -rc qcp -qp %qp% -c:a copy -n -dn "%%~dpAProcessed\%%~nA.mkv"
)
```

## Compress MP4 Files

Compresses MP4 files using h264_nvenc codec. Creates a 'Compressed' folder for output. Higher qp value means more compression (smaller file size).

```batch
setlocal enabledelayedexpansion
set qp=17
for %%A in (*.mp4) do (
    echo Processing file: %%A
    mkdir "%%~dpACompressed" 2>nul
    set "baseName=%%~dpACompressed\%%~nA_compressed"
    set "outputFile=!baseName!.mp4"
    set /a counter=1
    
    :checkFile
    if exist "!outputFile!" (
        set "outputFile=!baseName!_!counter!.mp4"
        set /a counter+=1
        goto checkFile
    )
    
    ffmpeg -i "%%A" -c:v h264_nvenc -preset fast -qp %qp% -c:a copy -n "!outputFile!"
)
```

## Convert Video to GIF

Converts a video file to GIF format. Adjust fps and scale as needed.

```batch
ffmpeg -i demo.mp4 -vf "fps=15,scale=640:-1:flags=lanczos" -c:v gif demo.gif
```

## Usage Instructions

To use these commands, you can create a batch file with the desired command or run them directly in the command prompt. For example:

```batch
ffmpeg-helpers.bat rtsp-to-rtmp
ffmpeg-helpers.bat mp4-to-mkv
ffmpeg-helpers.bat compress-mp4
ffmpeg-helpers.bat video-to-gif
```

### Notes:
- Replace placeholder values (like USERNAME, PASSWORD, IP addresses) with your actual values
- The `qp` (quantization parameter) value can be adjusted:
  - Lower values (e.g., 16-18) = better quality, larger file size
  - Higher values = more compression, smaller file size
- For the GIF conversion, you can adjust:
  - `fps`: frames per second (default: 15)
  - `scale`: output dimensions (default: 640 width, height auto) 