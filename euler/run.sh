#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of arguments. Only one expected."
    echo "Note: to run a problem, simply pass the problem number as argument"
    exit 1
fi

codefile=`printf "p_%03d.cpp" $1`
if [ -f "$codefile" ]; then
    echo "Running C++ solution!"
    g++ $codefile -O3 -std=c++2a && ./a.out $1
fi

codefile=`printf "p_%03d.erl" $1`
if [ -f "$codefile" ]; then
    echo "Running Erlang solution!"
    erlc run_solution.erl && erl -noshell -s run_solution run_solution $1
fi
