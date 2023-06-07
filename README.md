# SHELL

## Create `bootcamp.sh` file

```bash
    chmod u+x hello_world.sh
```

## shebang : `echo $SHELL`

- insert  `#! /bin/zsh` top of .sh script

---

## Define Variable

```bash
    greeting=Hello
    name=Tux
    echo $greeting $name
```

## Arithmetic Expressions

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

    var=$((3 ** 4))
    echo $var
    
    echo "scale=2;22/7" | bc # 3.14
```

## `$ echo`

## `$ cat`

## `PIPING` : Send Command Output To Other Command

> Command one   >> Pipe Symbol    >> Command two  
> `echo Hello`  >> echo Hello `|` >> echo Hello | `grep there`
>> (ex) `$ ls -l /usr/bin | grep zip`
---

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

## Numeric Comparison logical operators

## Common Environment Variables

* `PWD` : Current working directory.
* `HOME` : The user's home directory location.
* `SHELL` : Current shell (bash, zsh, etc).
* `LOGNAME` : 
* `USER`
* `UID` – User’s unique identifier.
* `HOSTNAME` – Device’s hostname on the network.
* `MAIL` – User’s mail directory.
* `EDITOR` – The Linux system default text editor.
* `TEMP` – Directory location for temporary files.

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

|   조건    | 설명  |
| :-------: | :---- |
| $a -lt $b | a < b |
| $a -gt $b | a > b |


