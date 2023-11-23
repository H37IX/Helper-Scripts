#mov into a trans gif
ffmpeg -i input.mov -filter_complex "[0:v]split[v0][v1];[v0]palettegen[p];[v1][p]paletteuse" -loop 0 -an -f gif output.gif