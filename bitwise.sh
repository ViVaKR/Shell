#! /usr/bin/env zsh

for i in {1..32}; do
    echo "\$((1 << $i)) $((1 << i))"
done
