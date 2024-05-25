#!/usr/bin/env zsh

. $(dirname "$0")/Include/unicode.sh

if [ $# -eq 0 ]; then
  echo "Input Argument is required"
  exit 1
fi

started=$(perl -MTime::HiRes=time -e 'printf "%.9f\n", time') # start time

Choice=$1
case $Choice in
1)
  echo "$u01 Bitwise Operation $u01"
  ./bitwise.sh
  ;;
2)
  echo "$u01 File Manager $u01"
  time ./file.sh
  ;;
3)
  echo "$u01 IF Statement $u01"
  time ./if.sh
  ;; # if statement
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
9)
  echo "$u01 String $u01"
  ./string.sh
  ;;
10)
  echo "$u01 Perl $u01"
  ./Perl/hello.pl
  scriptFolder=$(cd $(dirname "$0") && pwd)
  scriptName=$(basename $scriptFolder)
  echo "$u01 $scriptFolder $u01"
  echo "$u01 $scriptName $u01"
  ;;
10*) # * is a wildcard for zero or more characters
  echo "$u01 Start Category $u01"
  ;;
?00??) # ? is a wildcard for a single character
  echo "$u01 Start Category $u01"
  ;;
11)
  echo "$u01 Backup $u01"
  ./backup.sh ./ ./Backup
  ;; # backup

12)
  echo "$u01 Random Number $u01"
  ./random_number.sh
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
sleep 1
end=$(perl -MTime::HiRes=time -e 'printf "%.9f\n", time') # end time

diff=$((end - started))

# $ date "+%Y-%m-%d %H:%M:%S %Z"
# 2017-09-25 13:43:51:

# $ date "+%Y-%m-%d %H:%M:%S %Z"
# 2017-09-25 13:42:31 EDT
# find . -type f -name '*.log.*' -mtime +365 | lss
echo "It took $diff seconds"
