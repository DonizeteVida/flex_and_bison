#!/bin/bash

#how to use:
#./compile.sh wc

len=${#1}
input=$1
name=${input:0:len-2} #input, from 0 to len -2, to remove .l or .y extension

echo $name

flex -o $name.c $name.l

cc -o $name $name.c

./$name

rm $name.c
rm $name