#!/usr/bin/env zsh

ulr="\u2728"
u1="\u27A5"
cyw="\033[33m"
cred="\033[31m"
crm="\033[0m"
echo
echo "$cyw $ulr ZSH Shell Start $ulr $crm"
echo
function test() {
	local arr=("hello", "world")
	echo
	echo ${arr[@]}
	echo
}
test


declare -r r=30 # 읽기전용 변수 선언
readonly const=400 # var 변수를 상수로 선언
declare -i num # number 변수를 정수형으로 선언
num=456

arr=(1 2 3 4 5) # 1부터 10까지의 배열을 만든다.
for i in ${arr[@]}; do
	echo -e "\033[33m \u27AD ${i}\033[0m"
done

declare -i number # number 변수를 정수형으로 선언
number=123
echo
printf "number = %d\n" $number
echo

declare -a array # array 변수를 배열로 선언
array=(123 456 678 999)
printf "\n[ declare -a array example ]\n"
for i in ${array[@]}; do
	printf "array = %d\n" $i
done

declare -a colors
colors=(30 31 32 33 34 35 36 37)

for i in ${colors[@]}; do
	printf "\033[%dm", $i
	printf "- Hi, Everyone! - %d\n" $i
	printf "\033[0m"
done

declare -A map # map 변수를 연관배열(MAP)로 선언
map["name"]="장길산"
map["age"]=30
map["addr"]="서울시 강남구"
echo -e "[ 연관배열 ]\n${map["name"]}\n${map["age"]}\n${map["addr"]}"

for key val in ${map[@]}; do
	echo -e "Key: ${key}, Value: ${val}"
done

echo ${map[@]}

declare -f demo # test 함수를 선언

function demo() {
	echo "Hello, World!"
}
demo

export HelloWorld="Hello, World!" # 환경변수로 선언
# echo $HelloWorld
# 변수명 앞에 export 키워드를 붙이면 환경변수로 선언된다.

echo $cred

echo "$u1 실행된 셀 스크립트 파일명: '\$0'"
echo $0

echo "$u1 총 아규먼트 갯수 : '\$#'"
echo $#

echo "실행후 반환값 '\$?'"
echo $?

for i in $*; do
    echo "$u1 아규먼트 값 : $i"
done

echo "$u1 현재 셸 PID : '\$$'"
echo "$u1 마지막 백그라운드 작업 PID : '\$!'"
echo $crm


printf "Hello World %s\n " 'scale=6; 3.141592'
bc <<< 'scale=6; 3.141592'
echo "scale=6; 3.141592" | bc
echo 1/3 | node -p

result=$(bc <<< 'scale=6; 3.141592')
echo result = $result

echo "전체 인자 수 : $#"
echo "전체 인자 값\n$*\n$@"
echo {a..z}
echo {1..10}

echo "프로그램 지원 언어 : $LANG"

# int terminal -> for i in {1..10}; do echo "test $i";done

echo "자릿수 맞춤"
for i in {00..3}
do
	echo "test $i"
done

echo "자릿수 맞춤"
echo A{00..10}B

for i in `seq 1 2 10`;do echo $i;done

echo "seq example"

echo $(seq 4)
echo $(seq 2 5)
echo $(seq 1 2 10)
echo $(seq -w 4 2 12)
echo $(seq -s, 4)
echo {0000..0010..2}

for (( i=0;i<10;i+=1 )); do
	echo $i
done

for i in $(seq 1 2 10)
do
	echo $i
done

echo "사용자 UID : $UID"
echo "사용자 이름 : $USER"
echo "사용자 홈 디렉토리 : $HOME"
echo "로그인 터미널 : $TERM"

echo "환경변수 확인 env"
# env 명령어로 환경변수 확인
echo "쉘 변수 확인 set"
echo "   Hello, World\fFine Thanks And You?\rGood Morning"

echo "쉘 산술 연산: expr, let, \$(())"

echo "expr 연산자"
echo "expr 1 + 2 = $(expr 1 + 2)"
echo "expr 12 + 18 = `expr 12 + 18`"
num1=10
echo "num1 = $num1"
echo "num1 + 12 = $(expr $num1 + 12)"
echo "괄호 \( 2 + 3 \) 와 곱셈문자는 모두 역슬래시 \\* 사용"
echo "`expr 10 \* 33`"
echo "$(expr 10 \* \( 2 + 3 \))"
echo "33 % 10 = $(expr 33 % 10)"
echo "100 / 3 = $(expr 100 / 3)"
echo "scale=6; 10/3" | bc

num1=42
num2=12
let add=$((num1 + num2))
let sub=num1-num2
let mul=$((num1*num2))
let div=num1/num2
let mod=num1%num2
echo "num1 = $num1, num2 = $num2"
echo "$add, $sub, $mul, $div, $mod"

: << "EOF"
  블럭 주석
  여러줄 주석
  echo "Hello, World!"

  if [ 값1 -eq 값2 ]; then
	echo "값1과 값2는 같다."
  else
	echo "값1과 값2는 다르다."
  fi

  * 비교 연산 *
  -z 문자열 : 문자열이 비어있으면 참
  -n 문자열 : 문자열이 비어있지 않으면 참
  문자열1 = 문자열2 : 문자열1과 문자열2가 같으면 참
  문자열1 != 문자열2 : 문자열1과 문자열2가 다르면 참
  값1 -eq 값2 : 값1과 값2가 같으면 참
  값1 -ne 값2 : 값1과 값2가 다르면 참
  값1 -gt 값2 : 값1이 값2보다 크면 참
  값1 -ge 값2 : 값1이 값2보다 크거나 같으면 참
  값1 -lt 값2 : 값1이 값2보다 작으면 참
  값1 -le 값2 : 값1이 값2보다 작거나 같으면 참

  * 이중괄호 사용 *
  (( 값1 > 값2 )) : 값1이 값2보다 크면 참
  (( 값1 >= 값2 )) : 값1이 값2보다 크거나 같으면 참
  (( 값1 < 값2 )) : 값1이 값2보다 작으면 참
  (( 값1 <= 값2 )) : 값1이 값2보다 작거나 같으면 참
  (( 값1 == 값2 )) : 값1과 값2가 같으면 참
  (( 값1 != 값2 )) : 값1과 값2가 다르면 참

  **
  ~
  <<
  >>
  &
  ||
  num++
  num--
  ++num
  --num
  !


EOF
echo "Hi"

a=50
b=45

echo "a = $a, b = $b"

if [ $a -eq $b ]; then
	echo "a와 b는 같다."
else
	echo "a와 b는 다르다."
fi


if [ $a -gt $b ];then
	echo "a는 b보다 크다."
else
	echo "a는 b보다 작다."
fi

echo "이중 소괄호를 사용한 산술 연산"

if (( a > b )); then
	echo "a는 b보다 크다."
else
	echo "a는 b보다 작다."
fi

b1=$(( 1 << 2 ))
echo $b1

for i in {1..32};do
  b1=$(( 1 << i))
  echo $b1
done



for i in {1..10}; do
echo "test $i"
done





















echo "==============================="
echo "\033[34m"
echo "$ulr [ End of ZSH Shell ] $ulr"
echo "\033[0m"

unset HelloWorld
unset arr
unset map
unset num


return 123
# (1) Shebang (#!) : 어떤 인터프리터를 사용할지 쉘 스크립트에게 알려주는 방법

# (2) PIPING : Send command output to other commands
# ~$ echo Hello there | grep there

# (3) Output redirection
# ~$ echo Hello World > hello.txt
# ~$ echo Hi Everyone >> hello.txt
