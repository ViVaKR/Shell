#! /usr/bin/env zsh

. $(dirname "$0")/Include/unicode.sh

echo
echo "$u01 if statement $u01"

echo

echo "이중 소괄호 (( )) 를 사용하면 산술 연산을 수행할 수 있습니다."
num1="10"
num2="30"

if (($num1 < $num2)); then
    echo "$u02 $num1 < $num2"
elif (($num1 == $num2)); then
    echo "$u02 $num1 = $num2"
else
    echo "$u02 $num1 > $num2"
fi

echo
echo "u02 한줄 작성"
# if [ $num1 -lt $num2 ]; then elif [ $num1 -eq $num2 ]; then echo "bbb"; else echo "no"; fi
