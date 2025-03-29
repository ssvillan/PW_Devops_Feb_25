#!/bin/bash
read -p "Enter a Number" num

if((num > 10)); then 
    echo "Number is Greater than 10"
elif((num==10)); then
    echo "Number is exactly 10"
else
    echo "Number is less than 10"
fi
