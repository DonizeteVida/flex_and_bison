#!/bin/bash

#how to use:
#./compile.sh wc

name=$1

flex -o $name.c $name.l

cc -o $name $name.c

./$name

rm $name.c
rm $name