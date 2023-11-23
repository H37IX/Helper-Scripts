::convert mp4 to mkv using ffmpeg 
::put this in the same folder as the mp4 file and run it, it will convert to mkv file automatically if you have ffmpeg installed and in your PATH
for %%A in (*.mp4, *.mkv) do (
	mkdir "%%~dpAProcessed"
	ffmpeg -i "%%A" -c:v libsvtav1 -map 0 -rc qcp -qp %qp% -c:a copy -n -dn "%%~dpAProcessed\%%~nA.mkv"
)

pause