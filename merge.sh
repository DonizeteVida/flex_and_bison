#!/bin/bash

#how to use:
#./compile.sh wc

len=${#1}
input=$1
name=$input

echo $name

bison -d -o bison_$name.c bison/$name.y
flex -o flex_$name.c flex/$name.l

cc -o $name bison_$name.c flex_$name.c