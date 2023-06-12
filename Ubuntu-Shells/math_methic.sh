#!/usr/bin/bash

num1=10
num2=20

add=`expr $num1 + $num2`
echo "add : ${add}"

sub=`expr $num1 - $num2`
echo "sub : ${sub}"

mul=`expr $num1 + $num2`
echo "mul : ${mul}"

div=`expr $num1 \* $num2`
echo "div : ${div}"

mod=`expr $num1 % $num2`
echo "mod : ${mod}"

calc=`expr \( ${num1} + ${num2} \) / 4 + 1`
echo "calc : ${calc}"

echo 
echo let example
let rs=num1+num2 # add
echo "add:$rs"

echo
echo "\$(( )) example"
num3=28
num4=19

echo add:$((num3+num4))
echo mul:$((num3 * num4))

echo
echo 멀티라인 주석
: << "END"
echo Hello World
echo Fine Thanks
END
