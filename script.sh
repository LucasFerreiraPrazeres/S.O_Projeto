#!/bin/bash
TIMEFORMAT=%R
total=0

for i in i$(seq 1 50); do
	time=$({ time python3 fernet.py &>/dev/null; } 2>&1)
	total=$(echo "scale=4;$total + $time" | bc)
done 

avg=$(echo "scale=4;$total / 50" | bc)
printf "Avg Time: %.4f\n" $avg 
