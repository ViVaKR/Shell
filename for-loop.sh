#!/usr/local/bin/bash

clear

for i in `seq 1 5`;do echo $i; done
echo

for i in 1 2 3; do echo $i; done
echo

for word in This is a sequence of words
do
    echo $word
done

for i in {1..10}
do
    echo "Loop spin:" $i
done

echo "Bash version ${BASH_VERSION}..."
for i in {0..12..3}
do
  echo "Welcome $i times"
done

# 스텝 2
for i in $(seq 1 4 20)
do
    echo "Welcom $i times"
done

for ((c=1;c<=5;c++))
do
    echo "Welcom $c times"
done

# Infinite loops
# for ((;;))
# do
#     echo "infinite loops [ hit CTRL+C to stop]"
#     sleep 1
# done

echo
# 폴더내부의 특정 파일 찾기 및 내용 으로 통계
echo "폴더내부의 특정 파일 찾기 및 내용 으로 통계"
echo
for file in /etc/*
do
    if [ "${file}" == "/etc/resolv.conf" ]
    then
        ns=$(grep -c nameserver /etc/resolv.conf)
        echo "Total ( ${ns} ) nameservers defined in ${file}"
        break
    fi
done

# continue
for i in $(seq 1 100)
do
    if [ $(expr $i % 2) -eq "0" ]
    then
        echo "$i"
    else
        continue
    fi
done
