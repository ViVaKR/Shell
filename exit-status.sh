#!/usr/local/bin/bash

echo hello
echo $? # 명령어가 성공했기 때문에 0이 리턴됨
# exit 0 -> success
# 0이 아닌 값은 에러나 예외 상황을 나타냄
#- $? 명령의 결과를 확인하는 데 사용.

true
echo $?

! true # 빈 공간 필요 
echo $?

echo ${PATH#*:} # 매개변수 치환.
echo $(( 2#101011 )) # 진법변환

# case 옵션 종료자 : 이중 세미콜론
echo
echo "null command ':'"
:
echo $?

var1=`expr 14 + 35`
var2=`expr 2 \* 4`
echo $var1
echo result
echo "$((var1 + var2))"


