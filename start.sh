#!/usr/bin/env zsh

. $(dirname "$0")/Include/unicode.sh

case $1 in
1)
  echo "$u01 Bitwise Operation $u01"
  ./bitwise.sh
  ;;
2)
  echo "$u01 File Manager $u01"
  ./file.sh
  ;;
3)
  echo "$u01 IF Statement $u01"
  ./if.sh
  ;;
4)
  echo "$u01 Demo $u01"
  ./demo.sh
  ;;
5)
  echo "$u01 For Loop $u01"
  ./for.sh
  ;;
6)
  echo "$u01 Array $u01"
  ./array.sh
  ;;
7)
  echo "$u01 String Input $u01"
  ./input.sh
  ;;
8)
  echo "$u01 Function $u01"
  ./function.sh
  ;;
?0??) # ? is a wildcard for a single character
  echo "$u01 Start Category $u01"
  ;;

10*) # * is a wildcard for zero or more characters
  echo "$u01 10 단위 시작 $u01"
  ;;

a[0-9]) # [0-9] is a wildcard for a single digit
  echo "$u01 a로 시작하는 숫자 $u01"
  ;;

*) # default
  echo "$u01 Usage: $0 {1..100} $u01"
  ;;
esac

# case $1 in
# 1) ;;
# 2) ;;
# 3) ;;
# *) ;;
# esac
