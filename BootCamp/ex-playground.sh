#!/usr/bin/bash

string="Hello, World"

function string_test() {

	# 지역변수
	local string="Hi Everyone"
	echo ${string}
}

if [ $(whoami) = 'vivakr' ]; then
	echo "You are ViV"
fi

echo -n "Enter Number: "
read x

if [ $((x % 2)) == 0 ]; then
	echo "Number is Even"
else
	echo "Number is Odd"
fi

string_test	# 지역변수 콜
echo ${string} # 전역변수 콜

# 변수 초기화
unset string
