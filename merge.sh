#!/bin/bash

#how to use:
#./compile.sh wc

len=${#1}
input=$1
name=$input

echo $name

bison -d -v -o bison_$name.c bison/$name.y
flex -o flex_$name.c flex/$name.l

cc -o $name -lm bison_$name.c flex_$name.c

./$name

rm bison_$name.c
rm bison_$name.h
rm bison_$name.output

rm flex_$name.c
rm $name