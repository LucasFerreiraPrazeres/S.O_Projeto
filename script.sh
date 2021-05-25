#!/bin/bash


TIMEFORMAT=%R
total=0

for i in $(seq 1 500); do
	
	tempo=$({ //usr/bin/time --format='tempo=%E
memoria= %M kernel=%S usr=%U' python3 fernet.py &>/dev/null; } 2>&1)
	total=$(echo "scale=4;$total + $tempo" | bc)
done 

resultado=$(echo "scale=4;$total / 500" | bc)
printf "Tempo: %.4f\n" $resultado 
