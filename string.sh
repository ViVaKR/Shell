#! /usr/bin/env zsh

. $(dirname "$0")/Include/unicode.sh

s1="Hello, World!"
s2=""
s3=$null

echo "$cyw\${#var}$cclear returns the length of the string"
echo "$s1, len = ${#s1}"

echo "${s2:-"Default Value"}"                      # if null then assign this new value
echo "${s2:="if null then assign this new value"}" # if null then assign this new value
echo "$s2"
echo
echo "${s2:+$s1}" # if not null then return this value
echo "$s2"
echo
# echo "${s3:?"is null"}" # if null then print this error message
# echo "after error message"

unset s1
echo "${s1:-"after unset"}"

var2=/var/log/apt/log/hello/log/world/fine/thanks
echo ${var2%%log*} # remove the longest match from the end
echo ${var2%log*}  # remove the shortest match from the end
echo ${var2##*log} # remove the shortest match from the beginning
echo ${var2#*log}  # remove the longest match from the beginning
