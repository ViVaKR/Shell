#! /usr/bin/env zsh

. $(dirname "$0")/Include/unicode.sh

echo "$u01 배열 $u01"
declare -a arr

arr=(1 2 3 4 5)

echo "# 배열 요소 추가"
arr+=(6 7 8 9 10)
echo "배열의 길이를 인덱스로 사용하여 요소 추가"
arr[$(expr ${#arr[@]} + 1)]=11

echo "배열 전체 출력"
echo "${arr[@]}"
echo "${arr[*]}"

echo "배열의 일부 출력"
echo "${arr[@]:2:3}"

echo
echo "배열의 길이"
echo "배열의 길이: ${#arr[@]}"

echo
echo

echo "배열의 특정 인덱스 요소 삭제"

# echo ${arr[(i)1]}

echo
echo "배열의 요소 출력"
echo "배열의 첫번째 요소: $arr[1]"
# echo "${arr[2]}"
echo
echo

echo "# 리눅스 쉘은 1차원 배열만 지원함"

echo "$u01 연관배열 $u01"

declare -A map=([1]="one" [2]="two" [3]="three")
map+=([4]="four" [5]="five")
echo "$u02 연관배열 정보 출력"
declare -p map

echo "$map[1]"

for key value in ${(@kv)map[@]};do
    echo "key: $key, value: $value"
done

echo

ctrs=("a123" "b345" "c" "d" "e" "f" "g" "h" "i" "j")

echo "배열의 길이 => ${#ctrs[@]}"

for x in "${ctrs[@]}"; do
    printf "$x "
done
echo

unset arr
unset map
