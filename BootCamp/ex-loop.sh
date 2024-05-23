#! /usr/bin/env zsh

arr=("a" "b" "c" "d")
for i in ${arr[@]}; do
	echo -e "\033[33m List is ${i} 입니다.\033[0m"
	printf "\t%s - %c\n" $i, $i
done
