#! /bin/bash

date | cut -d ' ' -f4
who | cut -d ' ' f1
echo {A..Z}
echo {a..z} | tr -d ' '
echo {a..z} | tr -d ' ' | cut -c 1,2,3,4,5
echo {A..Z} | tr -d ' ' | cut -c 1-5
echo {A..Z} | tr -d ' ' | cut -c -5
echo {A..Z} | tr -d ' ' | cut -c 1-
echo {A..Z} | tr -d ' ' | cut -b 1- # 바이트 단위, 한글은 바이트 단위로 처리 안됨
