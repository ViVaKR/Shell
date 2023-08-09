#!/usr/local/bin/bash

char=$1

case $char in
[a-z])
echo "Small Alphabet." ;;
[A-Z])
echo "Big Alphabet." ;;
[0-9])
echo "Number." ;;
*)
echo "Special Character."
esac


