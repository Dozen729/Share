#!/bin/bash

while read line
do
code=$line
done < code.txt


while : ;do

	OLD_IFS="$IFS"
	IFS=","
	array=($code)
	IFS="$OLD_IFS"

	for var in ${array[@]}
	do
		curl http://hq.sinajs.cn/list=$var |iconv -f gb2312 -t utf8 >txt/$var.txt
	done
	sleep 3s	#1s(1秒),1m(1分),1h(1小时)
done
