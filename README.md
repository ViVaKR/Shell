
# SHELL

## shebang : `echo #SHELL`

### Arithmetic Expressions

`+` : addition
`-` : subtraction
`*` : multiplication
`/` : division
`**` : exponetiation
`%` : mudulus

```bash
expr 45 + 5
expr 16 / 4
expr 20 - 10
expr 5 * 6
echo "scale=2;22/7" | bc # 3.14
```

## `$ echo`

## `$ cat`

## `PIPING` : Send Command Output To Other Command

> Command one   >> Pipe Symbol    >> Command two
> `echo Hello`  >> echo Hello `|` >> echo Hello | `grep there`
>> (ex) `$ ls -l /usr/bin | grep zip`

## Output Redirection

- Symbol ( `>` ) : Write or OverWrite to a file
  -`$ echo Hello World! > hello.txt`
- Symbol ( `>>` ) : Append to a file
  -`$ echo Hi Everyone! >> hello.txt`

## `$ wc -w hello.txt` : 단어수

## `$ cat << EOF`

```bash
    ➜ cat << EOF
    ∙ I Will
    ∙ writer some
    ∙ text here
    ∙ EOF
```

### 테스트

```bash
    [ hello = hello ]
    echo $? # -> 0 ( 결과 0 = 문제없음)

    [ 1 = 0 ]
    echo $? # -> 1 (결과 1 = 문제있음 )

    [ 1 -eq 1 ]
    echo $? # 0


```

### wc -w <<< "Hello there wordcount!"

### If / Elif / Else Statements

```bash
    #! /bin/zsh

    if [ $1 = kim ]; then
        echo "Oh, you're the boss here. Welcom!"
    elif [ $1 = help ]; then
        echo "Just enter your Name, duh!"
    else
        echo "I don't know who you are. But you're not the boss of me!"
    fi
```

### Case statements

1. Checking for multiple values
2. Is easier to read

## Create `.sh` file

```bash
    chmod u+x hello_world.sh
```

## shebang :  `echo $SHELL`

## 쉘 선언문

- insert  `#! /bin/zsh` top of .sh script
- Bourne Shell : `/bin/sh`
- C Shell : `/bin/csh`
- tee-see-Shell (tcsh) : `/bin/tcsh`
- Z Shell (zsh) : 확장형 Burne Shell `/bin/zsh`
- Bourne-again Shell (bash) : `/bin/bash`

## 로그인 파일 순서

1. `/etc/profile`
2. `/etc/profile.d/*.sh`
3. `!/.bash_profile`
4. `~/.bashrc`
5. `/etc/bashrc`

## Define Variable

- 종류
  - 지역변수 : 변수명 앞에 local 을 붙여줌
  - 전역변수 : 쉘에서 선언된 변수는 기본적으로 Global Variable
  - 타입지정
    - 읽기전용 타입 (상수, const) : `-r`
      - `declare -r var1`
      - `readonly var2`
    - 정수 타입 : `-i`
      - `declare -i number`; * number=3; echo "number = $nubmer"
    - 배열 타입 : `-a`
      - `declare -a indices`
    - 연관 배열 (MAP) : `-A`
      - decalre -A map
    - 함수 타입 : `-f`
      - declare : `-f`

  - 환경변수 (export) : `-x`
    - `declare -x var`
    - 스크립트 외부 환경에서도 이 변수를 사용할 수 있게 해줌
    - 변수명 앞에 `export` 을 붙여주면 environment variable 로 설정됨
    - 환경변수 사용시 예약 변수 (reserved variable) 와 변수명이 중복되지 않도록 선언하여야 함.
  - 예약변수 : 시스템에서 미리 정의된 변수
    - `HOME` : 사용자 홈 디렉토리
    - `PATH` : 실행파일 경로 모음
    - `LANG` : 프로그램 실행 언어
    - `UID` : 사용자 UID
    - `SHELL` : 사용자가 로그인시 실행되는 쉘
    - `USER` : 사용자의 계정 이름
    - `FUNCNAME` :  함수이름
    - `TERM` : 로그인 터미널
  - 매개변수
    - `./test   a   b   c   d`
    - `    $0   $1  $2  $3  $4
      - `$0` : 실행된 쉘 스크립트 명
      - `$1` : 스크립트에 넘겨진 첫번째 아규먼트
      - `$2` : 스크립트에 넘겨진 두번째 아규먼트
      - `$3, $4 : 세번째 네번째 아규먼트
      - `$#` : 아규먼트 개수
      - `$$` : 쉘 스크립트의 PID
      - `$?` : 반환 값 (백그라운드 실행된 값은 제외)
      - `$!` : 실행을 위해 백그라운드로 보내진 마지막 프로그램 프로세스 번호
      - `$*` : 전달된 모든 인자 표현 IFS 환경변수 사용
      - `$@` : $* 와 동일하나 IFS 환경변수를 사용하지 않음
  - set : 쉘 변수 출력
  - env : 환경변수 출력
  - export : 변수 범위를 환경변수의 영역으로 전송 하여 전역변수로 만듬
  - unset : 선언된 변수를 제거
  - 이스케이프 문자
    - `\f` :  앞으로 이동
    - `\n` : 줄 바꿈
    - `\r` : 캐리지 리턴
    - `\t` : 탭 공간
- 대소문자 구분
- 변수의 모든 값은 문자열로 할당 됨
- 자료형을 기입하지 않음
- 변수의 값은 특수문자 `$`를 변수명 앞에 붙인다.
- 변수에 값을 할당할 때는 특수문자를 사용하지 않음
- 변수를 생성할 때는 `=` 대입문자 앞뒤로 공백이 없어야 함

## echo : 개행 출력

## printf : 개행을 포함하지 않음

## 산술 연산

- `expr` :
  - 역따옴표 로 감싸주어 연산함
  - `$(())` 과 동일
  - 피연산자와 연산자 사이에 공백이 필요함
  - 우선순위를 지정하기 위해 괄호르 사용할 때는 `\` 처리 필요
  - 곱셈문자(*)는 `\*` 처리를 해줌
- `let` :
- `$(())` :

`+` : addition
`-` : subtraction
`*` : multiplication
`/` : division
`**` : exponetiation
`%` : mudulus

```bash
    var=$((3 ** 4))
    echo $var
    echo "scale=2;22/7" | bc # 3.14
```

## 비교연산

- 문자열 비교
  - 문자1 = 문자2
  - 문자1 == 문자2
  - 문자1 != 문자2
  - 문자 == 패턴
  - 문자 != 패턴
  - -z 문자   # null 이면 true
  - -n 문자   # null 이 아니면 true

- 숫자 비교
  - 값1 -eq 값2  # equal
  - 값1 -ne 값2  # not equal
  - 값1 -lt 값2  # less than
  - 값1 -le 값2  # less or equal
  - 값1 -gt 값2  # greater than
  - 값1 -ge 값2  # greater or equal

## 이중 괄호 (( expression ))

- !   : 논리 부정
- ~   : 비트 부정
- **  : 지수화
- <<  : bit shift left
- >>  : bit shift right
- &   : bit and
- |   : bit or
- &&  : 논리 and
- ||  : 논리 or
- num++  : 후위 증가
- num--  : 후위 감소
- ++num  : 전위 증가
- --num  : 전위 감소

## 파일 검사

- [ -b file ] :
- [ -c file ] : file 이 문자 장치이면 true
- [ -d file ] : file 이 디렉토리이면 true
- [ -e file ] : file 이 존재하면 true
- [ -f file ] : file 이 존재하면 true
- [ -g file ] :
- [ -k file ] :
- [ -L file ] : file 이 심볼릭 링크이면 참
- [ -p file ] :
- [ -r file ] : file 이 읽을 수 있는 파일이면 true
- [ -s file ] : file 이 null 이 아니면 true
- [ -S file ] : file 이 socket 장치 이면 true
- [ -t file ] :

## 논리 연산

- 조건1 -a 조건2 : and
- 조건1 -o 조건2 : or
- 조건1 && 조건2 : and
- 조건1 || 조건2 : or
- !조건      : not

## 이중 괄호 : `(( ))`

## 이중 대괄호 : `[[ ]]`

## - `PIPING` : Send Command Output To Other Command

- Command one   >> Pipe Symbol    >> Command two
- `echo Hello`  >> echo Hello `|` >> echo Hello | `grep there`
- e.g. `$ ls -l /usr/bin | grep zip`
- Symbol ( `>` ) : Write or OverWrite to a file
  -`$ echo Hello World! > hello.txt`
- Symbol ( `>>` ) : Append to a file
  -`$ echo Hi Everyone! >> hello.txt`

## - `$ wc -w hello.txt` : 단어수

## $ cat << EOF

```bash
    ➜ cat << EOF
    ∙ I Will
    ∙ writer some
    ∙ text here
    ∙ EOF
```

```bash
    [ hello = hello ]
    echo $? # -> 0 ( 결과 0 = 문제없음)

    [ 1 = 0 ]
    echo $? # -> 1 (결과 1 = 문제있음 )

    [ 1 -eq 1 ]
    echo $? # 0
```

`wc -w <<< "Hello there wordcount!"`

`If / Elif / Else Statements`

```bash
    #! /bin/zsh

    if [ $1 = kim ]; then
        echo "Oh, you're the boss here. Welcom!"
    elif [ $1 = help ]; then
        echo "Just enter your Name, duh!"
    else
        echo "I don't know who you are. But you're not the boss of me!"
    fi
```

- `PWD` : Current working directory.
- `HOME` : The user's home directory location.
- `SHELL` : Current shell (bash, zsh, etc).
- `LOGNAME` :
- `USER`
- `UID` – User’s unique identifier.
- `HOSTNAME` – Device’s hostname on the network.
- `MAIL` – User’s mail directory.
- `EDITOR` – The Linux system default text editor.
- `TEMP` – Directory location for temporary files.

## Examples

```bash
    # View All Environment Variables
    printenv | less

    # 셀 변수를 환경변수로 변환하기, 셀 세션 종료 후 제거됨
    export [VARIABLE_NAME]

    # 영구 환경 변수 설정
    export [VARIABLE_NAME]=[variable_value]

    # 현재 세션 중에 변경사항을 적용하기
    source ~/.zshrc

    # 내보낸 모든 변수와 함수 출력
    export
    export -p

    # 환경변수 설정 해제
    unset [VARIABLE_NAME]

    # printf : 형식화된 출력
    #-> %s : string
    #-> %f : floating-point number
    #-> %d : decimal number
    #-> %e : exponential floating-point number
    #-> %u : Unsigned decimal number
    #-> %% : Percent sign
    #-> %Wd : W integer X digits wide
    var='hello'
    printf '|%10s|\n' "$var"
    #!-> |     Hello|

    echo Hello, World
    greeting=Hello
    name=Tux
    echo $greeting $name
    var=$((3 ** 4))
    echo $var
    expr 45 + 2

    # 소숫점 자릿수 지정
    echo "scale=5;22/7" | bc

    # 사용자 입력 받기
    read -p "Enter Your Age " v
    echo $v

    # Hide User Input (-s) : 비밀번호 입력 받기
    read -p "Enter your password: "$'\n' -s password
    echo $password

    # Set Character Limit
    read -p "3자 이하로 입력 : "$' ' -n 3 ch
    echo
    echo $ch

    read -N 3

    # 시간제한 설정
    read -t 5

    # 배열
    read -a array <<< "Hello World"
    echo ${array[0]}
    echo ${array[1]}

    # 백슬래시 해석 무시
    read -r arr2 <<< "Hi\Everyone"
    echo ${arr2[0]}

    # printf
    var='Viv'
    printf '|%-10s|, |%10s|\n' "$var" "$var"

    printf "Enter a double number: "
    read number <<< 34.12345
    printf "%5.2f\n" "$number"

    printf -v var 'Welcome'
    printf "%s\n" "$var"

    printf "Enter a hexadecimal number: \n"
    read number
    printf "%d\n" "$number"

    printf "종료시 - "
    read -d "-" var3
    echo $var3
```

## Loop

```bash

    # [= Until =] 조건이 참()일 될 때까지 명령을 실행
    until [ condition ]
    do
        # TODO command..
    done
```

## CHEAT SHEET

| Syntax                            | Description                                                      |
| --------------------------------- | ---------------------------------------------------------------- |
| #!/bin/bash                       | Shebang                                                          |
| #!/usr/bin/env bash               |                                                                  |
| #                                 | comments                                                         |
| chmod +x script.sh && ./script.sh |                                                                  |
| $#                                | Stores the number of arguments passed to the Bash script         |
| $1, $2, $3                        |                                                                  |
| exit                              | Exit from the Bash script, optionally add an error code          |
| $()                               | Execute a command inside of a subshell                           |
| sleep                             | Pause for a specified number of seconds, minutes, hours, or days |
| if then fi                        | Test a condigion and execute the clause if it is true then       |
| if then else fi                   |                                                                  |
| if then elif else fi              |                                                                  |
| for do done                       |                                                                  |
| until do done                     |                                                                  |
| while do done                     |                                                                  |
| break                             |                                                                  |
| continus                          |                                                                  |
| -lt                               | <                                                                |
| -gt                               | >                                                                |
| -le                               | <=                                                               |
| -ge                               | >=                                                               |
| -eq                               | ==                                                               |
| -ne                               | !=                                                               |
| ((i++))                           | Increment a variable                                             |
| ((i--))                           | Decrement a variable                                             |
| : String Comparison Operators :   |                                                                  |
| =                                 | equal                                                            |
| !=                                | not equal                                                        |
| <                                 | less then                                                        |
| -n s1                             | string s1 is not empty                                           |
| -z s1                             | string s1 is empty                                               |
| : Bash File Testing Operatiors :  |                                                                  |
| -b filename                       | Block special file                                               |
| -c filename                       | Special character file                                           |
| -d directoryname                  | Check for directory existence                                    |
| -e filename                       | Check for file existence                                         |
| -f filename                       | Check for regular file existence not a directory                 |
| -G filename                       | Check if file exists and is owned by effective group \| ID.      |
| -g filename                       | true if file exists and is set-group-id.                         |
| -k filename                       | Sticky bit                                                       |
| -L filename                       | Symbolic link                                                    |
| -O filename                       | True if file exists and is owned by the effective user \| id.    |
| -r filename                       | Check if file is a readable                                      |
| -S filename                       | Check if file is socket                                          |
| -s filename                       | Check if file is nonzero size                                    |
| -u filename                       | Check if file set-ser-id bit is set                              |
| -w filename                       | Check if file is writable                                        |
| -x filename                       | Check if file is executable                                      |
| : Boolean Operators :             |                                                                  |
| &&                                | Logical AND operator                                             |
| \|\|                              | Logical OR operator                                              |
| !                                 | NOT equal to operator                                            |

---

## bash 테스트 조건

|      조건      | 설명                               |
| :------------: | :--------------------------------- |
|   $a -lt $b    | a < b                              |
|   $a -gt $b    | a > b                              |
|   $a -le $b    | a <= b                             |
|   $a -ge $b    | a >= b                             |
|   $a -eq $b    | a == b                             |
|   $a -ne $b    | a != b                             |
|    -e $FILE    | $FILE exists                       |
|    -d $FILE    | $FILE exists and is a directory    |
|    -f $FILE    | $FILE exists and is a regular file |
|    -z $str1    | $str1 is empty                     |
| $str1 = $str2  | $str1 is equal to $str2            |
| $str1 != $str2 | $str1 is not equal to $str2        |

## To evaluate an expression on `bash` $\rightarrow$ `expr`

- addition, subtraction, multiplication, division, modulus
- string substring, length of strings, etc

## 들어오는 매개 변수 : `$1 ~ $999`, `$*, $@`

## Commands

```bash

  sort -k -1 -r ss | nl
  sort -c kor2
  echo $? # error = 1, ok = 0

  # 일련번호
  seq -s ' ' 1 50
  seq 10
  seq -s ', ' 30
  seq -s ' ' 1 5 100  # 5씩 증가
  seq -s ' ' 100 -5 10
  seq -w 0000 100 # 자릿수
  seq -w 100 0.5 110 # 소숫점
  seq -f "0.5f" 100 0.5 120 # 소숫점 이하 5자리
  seq -f "%g" 100 0.13 120

  # 인수분해
  factor 30
  factor 100
  factor 10 20 30 40 50

  # number format
  numfmt 123455687463 --grouping
  numfmt 2048 --to=iec #-> 2.0K
  du /etc 2>/dev/null | numfmt --to=iec
  du -sh /etc/* 2>/dev/null | sort -n

  du  /etc 2>/dev/null | sort -n | numfmt --to=si | tail -5

  expr 0 \| 9
  expr '' \| 8
  expr 9 \| 8
  expr 0 \& 45
  expr match programming pro #-> 3, 앞에서부터 매칭 되는 것을 찾음
  expr programming : pro

  expr substr programming 3 5 #-> 1부터 인덱스 시작
  expr index programming r #-> 5
  expr length program #-> 7

  rm -f [^rte]*
  rm -i # 권장
  cp -r /etc/b* . 2>/dev/null
  cp -i # 권장


  brew install rename
  -> rename -s .txt .backup *

  mv

  touch

  verbose

  -V : version

  # 정수

  ! : not
  ~ : bit not
  ** : exponentialt

  # let 사용시 $ 기호는 사용하지 않음
  let b=++a && echo $b #-> 11
  let b=2\*3 && echo $b #-> 6
  let b=2\*\*10 && echo $b #-> 1024
  let b=2==2 && echo $b #-> 1
  let b=1\&1 && echo $ #-> 1

  # 3항 연산
  let b=\(3\<5\)\?500\:1000 && echo $b #-> 500


```
