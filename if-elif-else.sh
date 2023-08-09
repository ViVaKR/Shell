<<<<<<< HEAD
#! /bin/zsh

if [ $1 = kim ]; then
    echo "Oh, you're the boss here. Welcom!"
elif [ $1 = help ]; then
    echo "Just enter your Name, duh!"
else
    echo "I don't know who you are. But you're not the boss of me!"
fi
=======
#!/usr/local/bin/bash

echo

if [ $# -ne 1 ]; then
    echo "Error: Invalid number of arguments"
    exit 1
fi
# ./if-elif-else.sh kim

arg=$1
if [ $arg == "kim" ]; then
    echo "Oh, you're the boss here. Welcom!"
    elif [ $arg = "help" ]; then
    echo "Just enter your Name, duh!"
else
    echo "I don't know who you are. But you're not the boss of me!"
fi

if [ $arg -lt 13 ]; then
    echo "You are a kid"
    elif [ $arg -lt 20 ]; then
    echo "You are a teenager"
    elif [ $arg -lt 65 ]; then
    echo "You are an adult"
else
    echo "You are an elder"
fi

# nested
temp=$1
if [ $temp -gt 5 ]; then
    if [ $temp -lt 15 ]; then
        echo "The weather is cold"
        elif [ $temp -lt 25 ]; then
        echo "The weather is nice"
    else
        echo "The weather is hot."
    fi
else
    echo "It's freezing outside ..."
fi

>>>>>>> 00cd0b4468bbed4716887eb2d4816fa4512dddcb
