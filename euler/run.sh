#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of arguments. Only one expected."
    echo "Note: to run a problem, simply pass the problem number as argument"
    exit 1
fi

codefile=`printf "p_%03d.cpp" $1`

g++ $codefile -O3 && ./a.out $1