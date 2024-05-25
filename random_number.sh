#! /usr/bin/env zsh

. $(dirname "$0")/Include/unicode.sh

echo "$u01 Random Number $u01"
echo
rnd="$((RANDOM % 100 + 1))"
echo "Random Number $rnd"
echo
for i in {1..6}; do
    echo "Random Number $((RANDOM % 50 + 50))"
done
echo
# Random Number 200 to 300
echo "Random Number $((RANDOM % 101 + 200))"
echo
# Random Number 100 to 10
echo "Random Number $((RANDOM % 11 + 100))"
echo
