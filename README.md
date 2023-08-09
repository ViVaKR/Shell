# SHELL

## shebang : `echo #SHELL`

> insert  `#! /bin/zsh` top of .sh script

---

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

### Numeric Comparison logical operators
