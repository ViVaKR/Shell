# Shell

<<<<<<< HEAD
## MacOS Zsh

## Ubuntu Bash

>- Shell ZSH, BASH

```bash
    # Shutdown
    >- shutdown -r now
    >- shutdown -P now
    >- shutdown -h +5 # 5분 후
    >- shutdown -c # cancel
    >- shutdown -k +5 # 가짜 종료 명령
    >- init 0
    >- halt -p
    >- poweroff

    # Reboot
    >- reboot
    >- init 6

    # 로그아웃
    >- logout
    >- exit

    # Default
    >- ls -al
    >- pwd
    >- rm
    >- rm -rf
    >- cp
    >- touch
    >- mv : 파일 또는 디렉토리 이름 변경 및 위치 변경
    >- mkdir : 새로운 디렉토리 생성
    >- dpkg --list
    >- dpkg --purge [program name]

    # install utilities
    $ sudo apt-get install -y bsdmainutils

    >- Shell (쉘, 명령어 해석기) Types : sh, ksh, csh, tch, bash, zsh, dash
    >- $ echo $SHELL
=======
1. Bourne Shell(sh) : AT & T 벨 연구소의 스티븐 본(Stephen Bourne) 이 개발한 Original Shell
2. C Shell (csh, tcsh) : Bill Joy 가 C 언어문법을 넣어 만든 Shell, (history, aliases, job control, vi editing, completion)
3. Korn Shell(ksh) : David Korn 이 Bourne Shell 에 C Shell 기능을 포함시켜 생성
4. Bourne Again Shell (bash) : GNU  Project 로 만들어 짐, csh, ksh 이 가진 기능을 포함하며 bourne shell 과 호환성을 높인 shell 로서 리눅스, 맥, 윈도우 에서 사용가능

## 기본 명령어

```bash

    # 전체 쉘 목록
    cat /etc/shells

    # 현재 사용중인 쉘
    echo $SHELL

    # 로그인 쉘 변경
    sudo chsh user

    # 현재 사용자가 사용중인 쉘
    sudo grep vivakr /etc/passwd 
    
```

## 일반변수

* 변수명은 문자나 언더바(_)로 반드시 시작, 문자와 숫자 조합으로 구성할 수 있음
* 변수 타입은 불필요함
* 변수명과 값사이의 `=` 양쪽에는 공간없이 붙여씀
* `변수명=값`
* e.g. `Score=20`
* 변수확인 `set`
  * e.g. `set | grep Score`
* 변수제거 `unset`
  * e.g. `unset variableName`

## 환경변수

* 환경변수 선언은 앞에 `export` 키워드를 사용함
* e.g. `export NAME=Viv`
* 환경변수 확인 `env`
* 주요 환경변수 HOME, USER, SHELL

## Shell Script Create `<name></name>.sh` file

```bash
    chmod u+x hello_world.sh
```

## shebang :  `echo $SHELL`

## 쉘 선언문

* insert  `#! /bin/zsh` top of .sh script
* Bourne Shell : `/bin/sh`
* C Shell : `/bin/csh`
* tee-see-Shell (tcsh) : `/bin/tcsh`
* Z Shell (zsh) : 확장형 Burne Shell `/bin/zsh`
* Bourne-again Shell (bash) : `/bin/bash`

## 로그인 파일 순서

1. `/etc/profile`
2. `/etc/profile.d/*.sh`
3. `!/.bash_profile`
4. `~/.bashrc`
5. `/etc/bashrc`

## Define Variable

* 종류
  * 지역변수 : 변수명 앞에 local 을 붙여줌
  * 전역변수 : 쉘에서 선언된 변수는 기본적으로 Global Variable
  * 타입지정
    * 읽기전용 타입 (상수, const) : `-r`
      * `declare -r var1`
      * `readonly var2`
    * 정수 타입 : `-i`
      * `declare -i number`; * number=3; echo "number = $nubmer"
    * 배열 타입 : `-a`
      * `declare -a indices`
    * 연관 배열 (MAP) : `-A`
      * decalre -A map
    * 함수 타입 : `-f`
      * declare : `-f`
  
  * 환경변수 (export) : `-x`
    * `declare -x var`
    * 스크립트 외부 환경에서도 이 변수를 사용할 수 있게 해줌
    * 변수명 앞에 `export` 을 붙여주면 environment variable 로 설정됨
    * 환경변수 사용시 예약 변수 (reserved variable) 와 변수명이 중복되지 않도록 선언하여야 함.
  * 예약변수 : 시스템에서 미리 정의된 변수
     * `HOME` : 사용자 홈 디렉토리
     * `PATH` : 실행파일 경로 모음
     * `LANG` : 프로그램 실행 언어
     * `UID` : 사용자 UID
     * `SHELL` : 사용자가 로그인시 실행되는 쉘
     * `USER` : 사용자의 계정 이름
     * `FUNCNAME` :  함수이름
     * `TERM` : 로그인 터미널
  * 매개변수
     * `./test   a   b   c   d`
     * `    $0   $1  $2  $3  $4
         * `$0` : 실행된 쉘 스크립트 명
         * `$1` : 스크립트에 넘겨진 첫번째 아규먼트
         * `$2` : 스크립트에 넘겨진 두번째 아규먼트
         * `$3, $4 : 세번째 네번째 아규먼트
       * `$#` : 아규먼트 개수
       * `$$` : 쉘 스크립트의 PID
       * `$?` : 반환 값 (백그라운드 실행된 값은 제외)
       * `$!` : 실행을 위해 백그라운드로 보내진 마지막 프로그램 프로세스 번호
       * `$*` : 전달된 모든 인자 표현 IFS 환경변수 사용
       * `$@` : $* 와 동일하나 IFS 환경변수를 사용하지 않음
   * set : 쉘 변수 출력
   * env : 환경변수 출력
   * export : 변수 범위를 환경변수의 영역으로 전송 하여 전역변수로 만듬
   * unset : 선언된 변수를 제거
   * 이스케이프 문자
     * `\f` :  앞으로 이동
     * `\n` : 줄 바꿈
     * `\r` : 캐리지 리턴
     * `\t` : 탭 공간
* 대소문자 구분
* 변수의 모든 값은 문자열로 할당 됨
* 자료형을 기입하지 않음
* 변수의 값은 특수문자 `$`를 변수명 앞에 붙인다.
* 변수에 값을 할당할 때는 특수문자를 사용하지 않음
* 변수를 생성할 때는 `=` 대입문자 앞뒤로 공백이 없어야 함

## echo : 개행 출력

## printf : 개행을 포함하지 않음

## 산술 연산

* `expr` :
  * 역따옴표 로 감싸주어 연산함
  * `$(())` 과 동일
  * 피연산자와 연산자 사이에 공백이 필요함
  * 우선순위를 지정하기 위해 괄호르 사용할 때는 `\` 처리 필요
  * 곱셈문자(*)는 `\*` 처리를 해줌
* `let` :
* `$(())` :

## Arithmetic Expressions

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

* 문자열 비교
  * 문자1 = 문자2
  * 문자1 == 문자2
  * 문자1 != 문자2
  * 문자 == 패턴
  * 문자 != 패턴
  * -z 문자   # null 이면 true
  * -n 문자   # null 이 아니면 true

* 숫자 비교
  * 값1 -eq 값2  # equal
  * 값1 -ne 값2  # not equal
  * 값1 -lt 값2  # less than
  * 값1 -le 값2  # less or equal
  * 값1 -gt 값2  # greater than
  * 값1 -ge 값2  # greater or equal

## 이중 괄호 (( expression ))

* !   : 논리 부정
* ~   : 비트 부정
* **  : 지수화
* <<  : bit shift left
* >>  : bit shift right
* &   : bit and
* |   : bit or
* &&  : 논리 and
* ||  : 논리 or
* num++  : 후위 증가
* num--  : 후위 감소
* ++num  : 전위 증가
* --num  : 전위 감소

## 파일 검사

* [ -b file ] :
* [ -c file ] : file 이 문자 장치이면 true
* [ -d file ] : file 이 디렉토리이면 true
* [ -e file ] : file 이 존재하면 true
* [ -f file ] : file 이 존재하면 true
* [ -g file ] :
* [ -k file ] :
* [ -L file ] : file 이 심볼릭 링크이면 참
* [ -p file ] :
* [ -r file ] : file 이 읽을 수 있는 파일이면 true
* [ -s file ] : file 이 null 이 아니면 true
* [ -S file ] : file 이 socket 장치 이면 true
* [ -t file ] :

## 논리 연산

* 조건1 -a 조건2 : and
* 조건1 -o 조건2 : or
* 조건1 && 조건2 : and
* 조건1 || 조건2 : or
* !조건      : not

## 이중 괄호 : `(( ))`

- 괄호 내부에 기호 수식을 사용하여 계산을 할수 있음
  
## 이중 대괄호 : `[[ ]]`

- 문자열의 비교를 위해 사용됨

## `$ echo`

## `$ cat`

## `PIPING` : Send Command Output To Other Command

> Command one   >> Pipe Symbol    >> Command two  
> `echo Hello`  >> echo Hello `|` >> echo Hello | `grep there`
>> (ex) `$ ls -l /usr/bin | grep zip`
---

## Output Redirection

* Symbol ( `>` ) : Write or OverWrite to a file  
  -`$ echo Hello World! > hello.txt`  
* Symbol ( `>>` ) : Append to a file  
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
>>>>>>> 57c4567 (modified README, notebook)

---

[ 리눅스 명령어 종류 ]

<<<<<<< HEAD
    - whence -wm '*'
=======
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
>>>>>>> 57c4567 (modified README, notebook)

    - alias
        - alias c (cp, rq)

<<<<<<< HEAD
    - keyword (reserved word)
        - if, while, for, fi, select, done, then, case, do, else, elseif, esac, until, time, in, elif
        - compgen -k | column
=======
* addition, subtraction, multiplication, division, modulus
* string substring, length of strings, etc
>>>>>>> 57c4567 (modified README, notebook)

    - function
        - hi() { echo "Hi, Everyone"; }

    - 내부 명령어 (builtin-command)  : 쉘 안에 포함되어야 하는 명령어, 쉘만 있으면 실행 가능한 명령어
        - enable | column

    -----------------------------------------------------------------
    -		        compquote	fg		    pushln		umask
    .		        compset		float		pwd		    unalias
    :		        comptags	functions	r		    unfunction
    [		        comptry		getln		read		unhash
    alias		    compvalues	getopts		readonly	unlimit
    autoload	    continue	hash		rehash		unset
    bg		        declare		history		return		unsetopt
    bindkey		    dirs		integer		sched		vared
    break		    disable		jobs		set		    wait
    builtin		    disown		kill		setopt		whence
    bye		        echo		let		    shift		where
    cd		        echotc		limit		source		which
    chdir		    echoti		local		suspend		zcompile
    command		    emulate		log		    test		zf_ln
    compadd		    enable		logout		times		zformat
    comparguments	eval		noglob		trap		zle
    compcall	    exec		popd		true		zmodload
    compctl		    exit		print		ttyctl		zparseopts
    compdescribe	export		printf		type		zregexparse
    compfiles	    false		private		typeset		zstat
    compgroups	    fc		    pushd		ulimit		zstyle
    - 외부 명령어 (external-command) :별도로 설치해야만 실행할 수 있는 명령어
        - type pwd, type pwd
    -----------------------------------------------------------------

    [ Commands ]

    0. type, file, stat
        - type cp, type mv, type cat : type of file
        - file a1, file dir1
        - stat a1 : file details

    1. cal

    2. tac

    3. tee : >> or > 대신 사용할 수 있음.
        -> cat a1 | tee a2
        -> dpkg --list | tee a3 # 화면출력 + 파일 저장
        -> who | tee -a a4 # append

    4. nl (number line) : == cat -b a1
        -> nl a1
        -> nl -w10 a1
        -> nl -i2 iw2 a1 # 2씩 증가
        -> nl -i10 -v10 a1 # 시작 번호 지정
        -> nl -i2 -v0 a1 # 짝수로 증가

    5. uptime
    6. dpkg --list
    7. apt autoremove

    8. head : 플러스 기호가 생략되어 있고 기본 10개
        -> head -n 10 number # default count 10
        -> head -n 5 number city # number 5, city 5 개
        -> head -n -3 number city -q # 끝에서 부터 3개 잘라내고 출력, 해더 없애고 출력
        -> head -c 30 number

    9. tail : 마이너스 기호가 생략되어 있고 기본 10개, 추적 기능이 있음.
        -> tail -n 5 number
        -> tail -n +5 number # 앞에서 부터 5개 잘라내고 출력, 5부터 끝까지.
        -> tail -c 30 number # byte 단위로 출력
        -> tail -f number # 추적 기능이 있음 tail 고유 기능

    10. seq
            -> seq 100 100 1500 > number

    11. wc -l fileName # line count

    12. split
        -> split --help
        -> split fileName # 1000 라인당 분리
        -> wc -l xa* # 각각의 파일 행 확인하기
        -> cat xa* > fileName2 # 합치기
        -> diff k k2 # 파일 동일성 여부 확인하기
        -> split -d -a 3 fileName # 숫자로 명명, 이름 크기칸수
        -> split -d --additional-suffix=.txt fileName
        -> split -d --additional-suffix=.txt fileName backup_ # 접두사 변경
        -> split -d --additional-suffix=.txt -l 500 n backup_ # 500 라인 단위
        -> split -d --additional-suffix=.txt -C 10240 n backup_ # byte 단위,  10K
        -> split -d --additional-suffix=.txt -n 10 n backup_ # 갯수로 자르기, 같은 크기로 10개로 자름
        -> split -d --additional-suffix=.bak -n 10 --numeric-suffix=50 n backup_ # 시작 번호 지정 50부터
        -> cat backup_* > orgin.bak # 합치기..

    13. csplit : 행으로 자르기
        -> cp /etc/passwd ps
        -> csplit k 10 20 30 40 # each lines split
        -> csplit p /pattern/
        -> csplit p /pattern/
        -> csplit p /pattern/1 # 패턴 단어가 앞쪽에 포함됨, 숫자 만큼 앞쪽/뒤쪽(음수) 에 포함됨
        -> csplit -f x_ p # change prefix
        -> csplit -f aa_ ch.txt "/Chapter/2" "{*}" # multi split

    14. wc
        -> wc -c file # byte
        -> wc -l file # line
        -> wc -w file # word
        -> wc file # line, word, byte 순

    15. diff : file compare
        -> diff a b

    16. du
        -> du -sh ./folder

    17. grep
        -> grep keyWord /etc/passwd | nl # .zshrc -> alias grep="grep --color=always"

    18. echo : built in command, display a line of textq
        -> echo $a $b $c
        -> echo -e "aa \t bb \n cc" # 제어 특수문자 인식
        -> echo -e "\uAC00" # unicode (2byte) -> '가', \u2665, \u2661, \u2664"
        -> man echo
        -> run-help # bultin commands list
        -> run-help echo

    19. env, printenv
        - printenv | grep 'HIST*'

    20. printf
        -> printf "%d\t%f\t%s\n" 100 3.14 'A' # imadate value
        -> printf "%d\t%f\t%s\n" $a $b $c # variable
        -> printf "[%10d]\n" 100
        -> man printf # help,== man 1 printf
        -> man 3 printf # Library Functions Manual

    21. yes : 무한 루프
        -> yes "Hello World" | nl # 인터럽트 - Ctrl + C 중지

    22. ls, dir, vdir, dircolors
        -a  all
        -A  . .. 제외 하고 all
        -l  자세한 정보
        -i  inode
        -h	human-readable
        -F	one of */=>@|
        -R  recursive
        -S  size
        -r reverse
		-t : modification time
		-u : access time
		-c : change time

        |file or dir | 권한 | 하드링크수 | 소유주 | 소유 그릅 | 파일사이즈 | 파일접근날짜 | 파일 |

		- find / -type s -exec ls -alF {} \; 2> /dev/null # hide error messages
		- find / -type s -S ls -alF {} \; 2> /dev/null # hide error messages
        - find . -type f *.sh exec ls -alF {} \;
        - find . -type f -iname "*.Sh" # 대소문자 무시
        - find . -type f -maxdepth 2 -name "*.sh"
        - find . -type f -not -name "*.sh"
        - find . -type f ! -name "*.sh"
        - find . -type f -name 'bb*' ! -name '*.sh' # Combine multiple search
        - find . -name '*.sh' -name '*.txt'
        - find . -type d -maxdepth -name 'd*'
        - find ./BootCamp ./Include -name 'd*' # Search multiple directories
        - find ~ -type f -name '.*'
        - find . -type f -perm 0755
        - find /bin -type f -perm -u=x
        - find . -user $(whoami) -name '*.sh'
        - find . /var/www -group $(id -g -n)
        - find ~ -maxdepth 2 -name '.zs*'
        - find / -mtime 50
        - find / -atime 50
        - find / -mtime +50 -mtime -100
        - find . -cmin -120
        - find ~ -maxdepth 3 -size +10M -size -300M
        - find ~ -maxdepth 3 -size +10M -size -300M -exec eza -l  {} \;
        - find ~ -type f -maxdepth 2 -name '*.txt' -exec ls -s {} \; | sort -n -r | head -5



	22. vdir, dir

    23. remove alias (원본 명령어 실행) : `\command` -> \ls

    24. alias : 별칭

	25. dircolors : view colors
		-> dircolors --help
		-> Hello

    26. histroy
        -> ~/.zsh_history
        -> echo $HISTFILE
        -> `$HISTSIZE` : 최근 명령어 저장할 갯수
        -> file location : `vim /etc/zsh/zshrc` -> `HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history`
        -> clear history
            -> bash : history -c
            -> zsh  : history -p

    27. paste
        -> paste name kor eng
        -> paste name kor eng -s > sc2
        -> paste name kor eng -s -d", " > sc2
        -> paste name -s -d"," > names
        -> paste name -s -d"|" > names
        -> paste name -s -d"\t" > names

    28. join : 공통된 필드를 찾아서 합침
        -> join k1 e1 # 중복된 항목 단일 항목 처리, 학생들의 과목 1, 과목 2 병합 처리
        -> join -e"00" -o 0,1.2,2.2 k2 e2 # 공백 부분 00처리
            >- 이순신 90 95
            >- 황진이 00 25
            >- 한석봉 95 95
            >- 신돌석 50 00
            >- 양주종 50 50

    29. cut
        - cat /etc/passwd | cut -d : -f 1,3

    30. awk : `awk 'pattern {action}' file`
        - 텍스트 파일을 원하는 대로 필터링하거나 가공을 통하여 행과 열로 출력해 주는 프로그램.
        - `$0` : row, $1 $2 $3 ...: columns..

        - ps -ef | awk '{ print $1,$2 }'
        - ps -ef | awk '{ print $0 }'
        - ps -ef | awk '{print $1, "\t", $3}'
        - echo "5 4" | awk -F" " '{print $1 * $2}' # 20
        - echo "5 4" | awk -F" " '{print $1 / $2}' # 1.25
        - cat a.txt | awk '{print $1 * $2}'
        - awk '{print $1"\t"$2}' table1.txt # 특정 필드
        - awk '/A/' table1.txt # 패턴이 포함된 레코드 출력
        - awk '{sum += $3} END {print sum}' table1.txt

    31. sort
        -> b : 선행 공백 무시
        -> f : 대소문자 구분 안함
        -> n : 해시의 키값 기준, 랜덤 정렬
        -> r : 역순 (내림 차순) - sort kor -r | nl
        -> h : --human(2K, 1G)
        -> c : 정렬 되어 있는지 검사
        -> k n : n번째 필드를 기준으로 정렬
        -> m : 이미  정렬된 파일들을 병합
        -> o : 파일 출력
        -> t : 필드 구분자를 지정 (기본은 공백)
        -> u : 정렬 후 중복 제거
        -> sort kor | nl

    32. passwd

    33. ssh
        -> ssh -p 22 viv@192.168.0.8
    34. uniq

    35. shuf

    36. Auto SSH Login

        - (Client)
        -> ssh-keygen -t rsa -b 4096
            -> file ~/.ssh/id_rsa
            -> ~/.zshrc ->
            -> ssh-copy -p 52344 root@server-ip

        - (Git)
        -> ssh-keygen -t ed25519 -C "kimburmjun@gmail.com"
            -> eval "$(ssh-agent -s)"
            -> open ~/.ssh/config

    37. tr

        - 문자 변경  및 삭제, translae or delete characters
        - 삭제 (-d, delete)
            -> echo "abcd" | tr -d 'c'
            -> echo "aaabbbbcccccddddd" | tr -d 'bcd'
            -> echo "1234abcdefg" | tr -d 'a-z' | nl
            -> echo "1234abcdefg" | tr -d '0-9' | nl
            -> echo "1245AbcZKy cde" | tr -d 'A-Z''a-z' | nl
            -> echo "AaBb1234567HelloWorld" | tr -d '[:upper:]''[:lower:]' | nl
            -> echo "AaBb1234567HelloWorld" | tr -d '[:digit:]' | nl # 숫자만 지우기
            -> echo {1..9} | tr -d '1-4'
            -> echo "abcdefg" | tr 'abc' 'ABC' | nl
            -> echo "korea" | tr 'a-z' 'A-Z'
            -> echo "서울 부산 대구 광주" | tr " " "\n"
            -> echo "서울 부산 대구 광주" | tr " " "\v"
            -> cat /etc/passwd | tr ':' ','
            -> echo {a..z} | tr '[a-z]' '[A-Z]'
            -> echo {a..z} | tr '[:lower:]' '[:upper:]'
            -> echo {a..z} | tr '[:lower:]' '[:upper:]' | tr -d ' '
            -> echo {a..z}{1..3} | tr -d ' '

        - 변경
            -> echo 'Abcd' | tr 'A' 'Z'
            -> who | tr -s ' '

        - -s : squeeze, 반복되는 1 문자 삭제
            -> echo "kkkkbbbbssss" | tr -s kbs
        - -t : truncate
        - -c, -- complement : 보수 연산

    38. expand : 탭을 공백으로 변환, Convert tabs in each FILE to spaces
        -> echo -e "aa\tbb\tcc" | expand -t 4

    39. unexpand
        -> cat b30 | unexpand -t 2

    40. touch
        -> touch blankFile
        -> touch -t 05201240 b5

    41. mkdir
        -> mkdir d1
        -> mkdir d1 d2 d3
        -> mkdir dd{1..5}
        -> mkdir -p d1/d2/d3

    42. rmdir
        -> rmdir -p d1/d2/d3

    43. rm : 파일 삭제 (recursive, force)
        -> rm -rf dir

    44. cp : 파일 복사

    45. alias, unalias

    46. let : $ enable
        - 수식 다루기 정수 연산
        - id++, id--, ++id, --id
        - !, ~, *, /, +, -, **
        - <<, >>
        - <=, >=, <, >
        - &, ^, |
        - &&, ||
        - expr ? expr : expr
        - =, *=, /=, %=
        - +=, -=, <<=, >>=
        - &=, ^=, |=
        - a=2
            - let a+=4 && echo $a
            - let a\*\*=8 && echo $a
            - let a/=2 && echo $a
        - echo $((a + 10))
        - echo $((a * 2))
        - b=$((2^10)) && echo $b
        - b=$((100 >> 2)) && echo $b
        - echo $[a - 123] // single square brackets
        - echo $[++a]
        - let b=$[0 | 1] && echo $b
        - let b=$[1 & 1] && echo $b
        - let b=$[3 > 5 ? 500 : 100] && echo $b

    46. history
        - echo $HISTFILE
        - history -5
        - history +5

    47. expr : 정수 연산
        - expr 1 / 2
        - expr 4 \* 3
        - expr 4 / 3

    48. bc (bash calculator) : 공학용 산술과 실수 계산이 가능
        - echo "3.14 * 5 *5" | bc
        - echo "2^8" | bc
        - x=`echo "2^10" | bc` && $x
        - echo "4 / 3" | bc -l # -l 실수로 출력
        - echo "(34.8 + 51.1)^2 | bc
        - echo "scale=16; 4/3" | bc
        - echo "e(1)" | bc -l # euler
        - echo "sqrt(10^2) | bc


    49. USER :
        - 관리자(root), 시스템 (no login), 일반
        - root
            - /etc/profile
            - /etc/profile.d/*.sh
            - /etc/profile.d/*.local
            - /etc/bashrc
        - user
            - ~/.bash_profile
            - ~/.bashrc
            - ~/.bash_history
            - ~/.bash_logout

        - Ubuntu
            - sudo -i
            - su - root
            - passwd
            - useradd -d /home/world -m -b /home/world -s /bin/zsh world
            - userdel world

        - CentOS
            - su - root
            - useradd
            - passwd viv
        - id
            - id -u
            - id -g
        - logname
        - who
        - w : detail view
            - IDLE : 로그인 후 대기 시간.
        - id -g -n : 그룹
        - id -u -n : 이름
        - whoami
        - users
        - groups
        - tty
            - w --> get user TTY number
            - 사용자간 TTY 는 중복되지 않음.
            - (send message by TTY, root) --> echo "Hello, viv" > /dev/pts/1

    50. Permission
        - Owner Group Other
        - NOS - Multi-User Operating System
        - 확장자 개념이 없고 권한으로 관리
        - r, w, x
            - r (4, 2^2, Read)
            - w (2, 2^1, Write), 디렉토리에서의 쓰기 권한은 파일 삭제도 가능하므로 주의 필요.
            - x (1, 2^0, Execute), 디렉토리에서의 실행 권한은 디렉토리에 진입할 수 있는 권한을 나타냄.
        - chown : 소유자
        - chgrp : 소유그룹
        - chmod
            -> chmod u=r, g=x, o=r <fileName>
            -> chmod +x <fileName>
            > Get file Stat
                - $ (Ubuntu) stat -c '%a %h %U %G %s %y %n' <fileName>
                %a     access rights in octal (note '#' and '0' printf flags)
                %h     number of hard links
                %U     user name of owner
                %G     group name of owner
                %s     total size, in bytes
                %y     time of last data modification, human-readable
                %n     file name
                - (macos) $ stat -f '%A %N' <fileName>
                - (macos) stat -f '%A %N' *
        - useradd
        - groupadd
        - newgrp [group-name] # only current session
        - usermod -a -G groupName userName
        - file <fileName>

    51. umask : default mask value
        - umask <value>
        - (root, 022) directory -> 755, file -> 644
            - (dir) 777 - 022(umask) => 755, (file) -111 -> 644
            - 파일은 디렉토리에서의 x 값 1을 각각(user/group/other) 빼줌. (1 1 1)
        - (user, 002) directory -> 775, file -> 664
            - (dir) 777 - 002(umask) => 775, file -> 664

    52. HOME (~)
        - root (`/`)
            - /bin, /root, /etc, /home, /usr, /tmp
            - All your settings, config : /etc
            - binary : /bin
        - home (`~`)
            - each users directories
        - root : 시스템 관리자 (administrator, prompt -> `#`)
        - 일반 사용자 (user, prompt -> `$` or `%`)

        # after login #
        # (모든 사용자 용, root 관할)
        - (1) /etc/profile
            - (2) /etc/profile.d/*.sh *.local

        # (개별 사용자 용)
        - bash
            - (3) ~/.profile or ~/.bash_profile # user master file
            - (4) ~/.bashrc => `/etc/bash.bashrc` or `/etc/bashrc (모든 사용)`
                - ~/.bash_aliases
            - ~/.bash_history
            - ~/.bash_logout

        - zsh
            - (3) /etc/zsh/zprofile # (모든 사용자 용, root 관할)
            - (4) ~/.zshrc (개별 사용자) => `/etc/zsh/zshrc (모든 사용자)`
            - /etc/zsh/zshenv

        - export

    53. du
        - du -sh ~/Temp
        - du -shL /etc # sum, human, symbolic link (링크 파일 사이즈까지)
        - quot지
        - fallocate -l 100M temp

    54. df
        - df -h # -h: , -H: , -i : inodes count
            - /boot : like C drive
            - / : main drive
            -
    55. env : 전역변수(환경변수, 시스템 전체에 영향을 줌)
        - env

    56. set : 지역변수
        - set
        - helloworld() { echo 'Hello, World'; }
        - 해당 세션에서만 적용.
        - $* : $0 $1 $2 $3 ...
            - set 400 200 700
            - $1 - 400, $2 - 200, $* - 400 200 700
        - set $(date)
            - `2024. 03. 07. (목) 11:25:05 KST`
                - $1 - 2024., $2 - 03., $3 - 07., $* - all
        - set -o or +o
            - set -o, set -C : turn on
            - set +o, set +C : turn off
                - `$ set -o noclobber` : can not overwrite ` > `
            - set -o ignoreeof : prevent -> `ctrl + d, logout`

    57. printenv

    58. source
        - `$ source ~/.zshrc` == `$ . ~/.zshrc`

    59. export : apply global
        - export B=500    # variable
        - export -f aha   # function export `-f` option

    60. pstree : process tree view
        - pstree | grep zsh

    63. jobs : 현재 진행중인 프로세스 확인
        (test)
        - (1) sleep 600
        - (2) ctrl + z
        - (3) jobs
        - (4) sleep 500
        - (5) ctrl + z
        - (6) jobs
        - (7) kill -9 %1
        - (8) kill -9 %2

        - background (bg) : [command]&
            -> bg
        - forground  (fg) :
            -> fg

    64. kill :
        - 시그널
            * kill -l
        - kill -9 <pid>, kill -9 59600
        - kill -9 %1  # kill by job number
        - `man 7 signal` : OS <-signal-> Process
        - Package Commands : `info coreutils`

    65. sleep :
        - sleep 30 : 30초 동안 대기상태, forground job
        - CTRL + Z : suspended, to backgound, 백그라운드로 전환

    66. ps
        - ps -ef | grep sleep

    67. date
        - python -c 'from time import time; print(int(round(time() * 1000)))'
        - date "+%Y-%m-%d %H:%M:%S"
        - date +%F
        - echo $(date +%FT%T)
        - touch "$(date '+%Y%m%d').txt"



---

    # 표준 입출력 및 에러
    # 숫자(0,1,2) = 파일 디스크립터 파일, 포인터, fopen fclose

    - 리다이렉션 (redirection), 입출력 재 지정
        - `>` : 표준 출력, '명령 > 파일' : 명령의 결과를 파일로 저장
        - `>>` : 표준 출력 (추가) '명령 >> 파일' : 명령의 결과를 기존 파일 데이터에 추가
        - `<` : 표준 입력 '명령 < 파일' : 파일의 데이터를 명령에 입력
        - `2>&1` : 표준에러를 표준 출력으로 재지정, redirection
        - `> /dev/null 2>&1` : 출력 결과도 에러내용도 버려 버린다는 의미
        - `date > d1` <==>  'data 1> d1' (즉, 1이 생략되어 있음)


    - stdin ( 0 ) : 표준 입력 standard input (키보드)
        -> nl 0< file
        -> cat < s

    - stdout ( 1 ) : 표준 출력 standard output (모니터)
        -> date > d
        -> who 1> w

    - stderr ( 2 ) : 표준 에러 standard  error (모니터)
        -> badcommand 2> saveToFile (에러 발생, 오류내용이 파일에 저장됨)
        -> rmdir ./ds 2>/dev/null (에러 발생시 메시지 숨기기)
        -> /dev/null : 블랙홀, 휴지통 개념

    - Append ( >> ) : 파일내용 끝에 추가

    - Here Document ( << ) :

    - 입력 재 지향 : ( 0< )
        -> nl < file
        -> cat < file <==> cat 0< file (즉, 0 이 생략되어 있음)

    - ^D : End Of File, 파일의 끝 (반듯이 빈칸에서)
        -> cat << END > t3
            >- haha
            >- hoho
            >- END

## Run Level

- 초기화 명령어 -> init 뒤의 숫자
    - 0 : Power Off
    - 6 : Reboot
    - 1 : Rescue
    - 2, 3, 4 : 3번이 보편적 (Server)
    - 5 : Grapical, 그래픽 모드의 다중 사용자 모드

```bash

    # Modes
    >- ls -alF /lib/systemd/system/runlevel?.target

    # Get Current Mode
    >- ls -l /lib/systemd/system/default.target

    # Mode Change
    >- ln -sf /lib/systemd/system/graphical.target /lib/systemd/system/default.target

    >- startx

```

## Edit

```bash

    #!/usr/bin/env bash

```

1. gedit -> `$ apt-get update && apt-get install gedit && apt -y install gnome`
2. nano
3. vi

## 127.0.0.53 DNS 비활성하기

```bash

    $ sudo vim /etc/systemd/resolved.conf
        #-> find         (DNSStubListener=yes)
        #-> change to   (DNSStubListener=no)

    # check
    $ resolvectl status | grep -i "DNS Serve"

    $ named-checkconf /etc/bind/named.conf.options
```

## Commands

```bash

    # named
    $ sudo systemctl status systemd-resolved
    $ systemctl stop systemd-resolved
    $ systemctl disable systemd-resolved

    $ cd /run/systemd/resolve
    $ stub-resolv.conf

    # bind9 재시작
    $ sudo systemctl restart bind9

    $ ip a
    $ ufw status
    $ ufw allow 53/udp
    $ tcpdump -vv -n -i ens33 port 53
    $ dig @192.168.0.11 linux.org
    $ dig -x 192.168.0.11
    $ ss -ltn
    $ mtr kernel.org
    $ traceroute kernel

    # ssh
    $ ssh-keygen -t ed25519 -b 4096

    # 우분투 버전 업그레이드
    $ sudo vim /etc/update-manager/release-upgrades
        (edit) -> `kernel upgrade : -> Prompt=normal`

    $ sudo iptables -I INPUT -p tcp --dport 1022 -j ACCEPT
    $ sudo do-release-upgrade
```

## SysCall (x86_64, 64bit)

- sys_write
- NR = 1
- unsigned int fd (File Descriptor), const char *buf (Location of string to write), size_t count (Length of string)
    - 0 : Standard Input
    - 1 : Standard Output
    - 2 : Standard Error
