#! /usr/bin/env zsh

. $(dirname "$0")/Include/unicode.sh

demo="demo"
echo "Hello, $demo"

for i in {1..10}; do
    echo "$ulr test $((1 << i))"
done

echo "$((15 << 1))"
