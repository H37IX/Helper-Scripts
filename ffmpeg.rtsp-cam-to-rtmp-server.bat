::ffmpeg conversion from RTSP to RTMP so you can stream from an IP camera to your NGINX RTMP Server using libx265

@ECHO OFF
SET USERNAME=your-user
SET PASSWORD=your-pass
SET RTSP_IP=192.168.1.1
SET RTMP_IP=10.1.1.10

ffmpeg.exe -v verbose -rtsp_transport tcp -i "rtsp://%USERNAME%:%PASSWORD%@%RTSP_IP%/cam/realmonitor?channel=1&subtype=0" -c:v libx265 -crf 30 -preset fast -c:a aac -b:a 128k -f mp2 "rtmp://%RTMP_IP%:1935/livestream/stream"

pause
