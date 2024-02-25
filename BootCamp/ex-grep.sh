#! /usr/bin/env zsh

echo e.g. grep
echo --- single ---
grep 'mouse' smp-grep.txt
echo --- multiple ---
grep 'mouse' smp-grep1.txt smp-grep2.txt smp-grep3.txt
echo --- glob ---
# glob operators for Zsh `*`, `C`, `|`, `[`, `?`
# e.g.
# > cat file*
grep 'mouse' smp-grep*.txt
# > cat file_?
# > ls./*file*

# [ ] - Matches one of the enclosed character, or a rang of charaters
ls [fle]*
ls [a-z]*
echo
# [:<set>:] - 특정 문자 집합과 일치
ls [^[:upper:]]_*

# Grouping : only Zsh.
# i - Case insensitive
# I - Case sensitive.
# l - Lowercase match lower case or uppercase; uppercase match only uppercase.
## Recursive Globbing
# -> 재귀적 glob 연산자 **를 사용하여 작업 디렉토리의 파일(*와 같이)과 모든 하위 디렉토리의 모든 파일을 재귀적으로 확장할 수도 있습니다.
ls ~/Temp/**/[k-z]*.txt | nl

## 전역 한정자 : Only Zsh

# -> 전역 연산자 뒤에 추가되어 파일 이름이 확장된 후에도 필터링됩니다. 항상 괄호 사이에 있습니다.
# -> 괄호 안에 여러 개의 한정자를 사용할 수 있으며, 콜론으로 구분됩니다.

# e.g.
# -> ^ - 그 뒤를 잇는 모든 한정자에 기록된 것을 필터링 합니다.
# -> `-` - 수식어는 (심볼릭 링크 자체가 아닌) 기호 링크의 대상에 대해 작동합니다릭
# -> `[<시작>, <끝>]` - 위치에 따라 확장할 파일 이름을 선택합니다. 마지막 대결에서 뒤로 세는 것은 음수일 수 있습니다.

grep 'ock' smp-grep*.txt
grep -E '(dock|clock)' smp-grep.txt
grep -i 'the' smp-grep.txt
