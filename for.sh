#! /usr/bin/env zsh

. $(dirname "$0")/Include/unicode.sh

echo "$u01 for loop $u01"

for ((i = 1; i <= 5; i++)); do
    echo "$u02 $i"
done
echo
for x in 1 2 3 4 5; do
    printf $x
done

echo
echo "# 변수를 사용한 반복문"
data="1 2 3 4 5"
for x in $data; do
    printf $x
done

echo
echo
echo "# seq 명령어를 사용한 반복문"
for x in $(seq 1 5); do
    printf $x
done

echo
echo
echo "# 배열을 사용한 반복문"
printf "arr[@] 배열 전체를 의미\n"
arr=(1 2 3 4 5)
for x in ${arr[@]}; do # arr[@]는 배열 전체를 의미
    printf "%d " $x
done
echo
echo

echo "# range 를 사용한 반복문"
for x in {1..5}; do
    printf "$x "
done

echo
echo

echo "# ls 명령어를 사용한 반복문"

for x in $(ls); do
    printf "$x\n"
done

echo
echo

echo "# 한줄 코드"
# --> for i in $(ls); do echo $i; done
# ;는 명령어를 구분하는 역할을 한다. (엔터하고 작성하던것을 한줄로 작성할 수 있다.)

echo
echo

echo "# 쉘 인자를 사용한 반복문"

for x in $*; do
    printf "$x "
done
echo
echo

echo "# while 문을 사용한 반복문"

count=0
while (($count <= 5)); do # (( ))는 논리기호 사용 가능 문법
    printf "$count "
    ((count++))
done

echo
echo

echo "# until 문을 사용한 반복문"
count2=10
until (($count2 <= 5)); do
    printf "$count2 "
    ((count2--))
done
echo
echo
