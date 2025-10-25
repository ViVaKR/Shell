#! /bin/bash

a=5;
echo "a = $a"
let "a+=1"
echo "a = $a"

b=(($a + 2))
echo $b
