#! /bin/bash

read -a array <<< "a b c d e f g"
echo ${array[4]}

echo
echo "For Loop"
echo
for i in $(seq 1 10);
do
    echo $i
done

echo

for i in `seq 1 10`;
do
    echo $i
done

echo
echo "While : 조건이 거짓 (false) 이 될 때가지 실행"
echo "참일 동안 실행"
echo

count=0
while [ $count -lt 10 ]; do
    echo The count is $count
    let count=count+1
done
echo

if [ $# -ne 2 ]; then
    echo "wrong number of arguments entered"
    exit 1
fi

echo You have entered $1 and $2

# ./bootcamp.sh 34 34
if [ $1 -eq $2 ]; then
    echo "they are equal"
else
    echo "they are NOT equal"
fi

echo
echo "until : 조건이 참 (true) 이 될때까지 실행"
echo "거짓일 동안 실행"
echo 

sum=0
until [ $sum -eq 10 ]
do
    echo $sum
    let sum=sum+1
done
echo
