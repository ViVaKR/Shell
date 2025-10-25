#! /usr/bin/bash

. $(dirname "$0")/Include/unicode.sh
echo
echo "$u01 파일 검사 $u01"
echo

pwd="/etc/passwd"
echo "[ -f FILE ]  파일이 존재하면 참"
if [ -e $pwd ]; then
    echo "$u02 '$pwd' 패스워드 파일이 존재합니다."
else
    echo "$u02 '$pwd' 패스워드 파일이 존재하지 않습니다."
fi

echo

localtime="/etc/localtime"
echo "[ -L $localtime ]  파일이 심볼릭 링크이면 참"
if [ -L $localtime ]; then
    echo "$u02 '$localtime' 은 심볼릭 링크입니다."
else
    echo "$u02 '$localtime' 은 심볼릭 링크가 아닙니다."
fi
echo
isdirectory="./BootCamp"
echo "[ -d $isdirectory ]  파일이 디렉토리이면 참"
if [ -d $isdirectory ]; then
    echo "$u02 '$isdirectory' 은 디렉토리입니다."
else
    echo "$u02 '$isdirectory' 은 디렉토리가 아닙니다."

fi

echo

isexisted="/etc/hosts"
echo "if [ ! -e $isexisted] 파일이 존재하지 않으면 참"
if [ ! -e $isexisted ]; then
    echo "$u02 '$isexisted' 파일이 존재하지 않습니다."
else
    echo "$u02 '$isexisted' 파일이 존재합니다."
fi
echo
if [ -f $isexisted -a -f $isdirectory ]; then
    echo "둘다 파일입니다."
else
    echo "둘중 하나는 파일은 아닙니다."
fi
echo
if [ -f $isexisted -o -f $pwd ]; then
    echo "둘중 하나는 파일입니다."
else
    echo "모두 파일은 아닙니다."
fi

echo
echo "$u02 이중 괄호 [[]] &&, ||, =, ~, *, (정규식매칭) 기능을 제공합니다."
s1="hello"
s2="hello"
s3="world"
s4="world"
if [[ $s1 == $s2 && $s3 == $s4 ]]; then
    echo "두 묶음 문자열은 모두 같습니다."
else
    echo "두 묶음 문자열중 모두 같지는 않습니다."
fi

echo $rs

echo "file.sh 파일정보"
stat ./file.sh

ls -lu
ls -lc

: <<"EOF"

[ -b FILE ]  파일이 블록 장치 파일이면 참
[ -c FILE ]  파일이 문자 장치 파일이면 참
[ -d FILE ]  파일이 디렉토리이면 참
[ -e FILE ]  파일이 존재하면 참
[ -f FILE ]  파일이 일반 파일이면 참
[ -g FILE ]  파일이 SGID가 설정된 상태이면 참
[ -h FILE ]  파일이 심볼릭 링크이면 참
[ -k FILE ]  파일이 스티키 비트가 설정된 상태이면 참
[ -p FILE ]  파일이 파이프 파일이면 참
[ -r FILE ]  파일이 읽기 가능이면 참
[ -s FILE ]  파일 크기가 0이 아니면 참
[ -t FD ]    파일 디스크립터 FD가 터미널과 연결되어 있으면 참
[ -u FILE ]  파일이 SUID가 설정된 상태이면 참
[ -w FILE ]  파일이 쓰기 가능이면 참
[ -x FILE ]  파일이 실행 가능이면 참
[ -O FILE ]  파일 소유자가 현재 사용자이면 참
[ -G FILE ]  파일의 그룹이 현재 사용자의 그룹이면 참
[ -L FILE ]  파일이 심볼릭 링크이면 참
[ -N FILE ]  파일이 마지막 읽기 이후로 변경되었으면 참
[ -S FILE ]  파일이 소켓 파일이면 참
[ FILE1 -nt FILE2 ]  FILE1이 FILE2보다 최신이면 참
[ FILE1 -ot FILE2 ]  FILE1이 FILE2보다 오래되었으면 참
[ FILE1 -ef FILE2 ]  FILE1과 FILE2가 동일한 파일이면 참

atime (access time) : 파일이 마지막으로 읽힌 시간
mtime (modify time) : 파일이 마지막으로 변경된 시간
ctime (change time) : 파일의 inode가 마지막으로 변경된 시간



EOF
