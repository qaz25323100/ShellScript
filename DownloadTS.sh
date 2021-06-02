#!/bin/bash
#
# Program: ts video more download and merge
# Author: WayneChiu
URL="https://18porn.cc/videos/9497/file-"

INDEX=1
while [ $INDEX -le 620 ]
do
	filenum=$(printf "%03d" "$INDEX")
	wget ${URL}${filenum}".ts"
	(( INDEX++ ))
done
wait
filenames="`ls -rt1 *.ts $input | tr '\n' '|' | sed '$ s/.$//'`"
ffmpeg -i "concat:$filenames" -c copy out.ts
#echo $@ | tr " " "\n" > tslist
#while read line; do cat $line >> combined.ts; done < tslist
