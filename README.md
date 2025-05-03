# Helper Scripts Collection

This repository contains a collection of utility scripts for various media processing and system tasks.

## Media Processing Scripts

### FFmpeg Scripts

#### `ffmpeg-compress-mp4.bat`
- **Purpose**: Compresses MP4 files using FFmpeg with NVIDIA hardware acceleration (h264_nvenc)
- **Features**:
  - Creates a "Compressed" folder for output files
  - Automatically handles duplicate filenames by appending numbers
  - Uses configurable quality parameter (qp) for compression
  - Preserves original audio stream
- **Requirements**: FFmpeg with NVIDIA GPU support

#### `ffmpeg.convert-mp4-to-mkv.bat`
- **Purpose**: Converts MP4 files to MKV format using FFmpeg
- **Features**:
  - Creates a "Processed" folder for output files
  - Uses SVT-AV1 codec for video compression
  - Preserves original audio stream
- **Requirements**: FFmpeg with SVT-AV1 support

#### `ffmpeg.mov-to-transp-gif.ps1`
- **Purpose**: Converts MOV files to transparent GIFs
- **Features**:
  - Creates optimized color palette for better quality
  - Removes audio track
  - Creates looped GIF output
- **Requirements**: FFmpeg

#### `ffmpeg.rtsp-cam-to-rtmp-server.bat`
- **Purpose**: Streams video from an RTSP camera to an RTMP server
- **Features**:
  - Supports RTSP authentication
  - Uses H.265 (libx265) for efficient video compression
  - Configurable RTSP and RTMP server settings
- **Requirements**: FFmpeg with H.265 support

## System Integration

### `add_handbrake_context.reg`
- **Purpose**: Adds "Open with HandBrake" to Windows right-click context menu
- **Features**:
  - Adds HandBrake to the context menu for all files
  - Automatically passes selected file to HandBrake
- **Requirements**: HandBrake installed at default location

## Git Utilities

### `git-commands.txt`
- **Purpose**: Contains useful Git commands for repository management
- **Features**:
  - Instructions for reverting to specific commits
  - Commands for removing files from Git history
  - Force push operations for repository cleanup

## Requirements

- FFmpeg (install via `winget install ffmpeg`)
- HandBrake (for context menu integration)
- Git (for version control operations)
- NVIDIA GPU (for hardware-accelerated video compression) 