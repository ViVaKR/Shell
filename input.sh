#! /usr/bin/env zsh

. $(dirname "$0")/Include/unicode.sh

declare input
echo -n "Enter a string: "
read input

echo "You entered: $input"
