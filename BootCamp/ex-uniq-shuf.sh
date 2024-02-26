#! /usr/bin/env zsh

uniq b | nl # 연속된 라인만 처리
sort b | uniq 

# -c : 중복된 횟수 표시
uniq -c b | nl
echo
echo

# -d : 중복된 것만 표시
uniq -d -c b | nl

: -D
uniq -D b | nl

echo
echo

uniq -u b | nl
#
# -i
# -w
# -s
# -f

# shuf 

