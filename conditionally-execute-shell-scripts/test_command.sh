#!/bin/bash
read -p "Enter a number: " num

if test $num -lt 5; then
    echo "Number is less than 5."
else
    echo "Number is 5 or greater."
fi
