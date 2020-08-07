#!/bin/bash

while read line
do
code=$line
done < code.txt

while : ;do
	echo ---------------------------
	OLD_IFS="$IFS"
	IFS=","
	array=($code)
	IFS="$OLD_IFS"

	for i in ${array[@]}
	do
		while read line
		do
		online=$line
		done < txt/$i.txt
		
		OLD_IFS="$IFS"
		IFS=","
		array=($online)
		IFS="$OLD_IFS"

		zhoushou=0
		index=1
		for var in ${array[@]}
		do
		   if [ $index == '2' ] ; then
		      name=$var
		   fi
		   if [ $index == '4' ] ; then
		      zhoushou=$var
		   fi
		   if [ $index == '5' ] ; then
			three=10.0
			one=$(echo "$var-$zhoushou"|bc)
			two=$(echo "scale=3;$zhoushou/10"|bc)
			#echo "$var $var $zhoushou $one $two" | awk '{printf("%6.2f %6.2f %6.2f\n",$1,$2-$3,$4/$5*10)}'
			echo "$var $one $two" | awk '{printf("%6.2f %6.2f\n",$1,$2/$3*10)}'
		   fi
		   let index+=1
		done
		echo ---------------------------
	done

	sleep 5s	#1s(1秒),1m(1分),1h(1小时)
done
