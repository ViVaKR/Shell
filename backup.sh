#! /usr/bin/env zsh

. $(dirname "$0")/Include/unicode.sh

# null check
if [ -z "$1" ] || [ -z "$2" ]; then
    printf "$cred $u02 usage: $0 source destination\n$cclear"
    exit 1
else
    source=$1
    destination=$2
    root=$(basename $(pwd))

    backupFile=${root}_$(basename $source)_$(date +%Y%m%d%H%M%S).tar.gz
    echo "Source: $source"
    echo "Destination: $destination"
    # rsync -av --delete $source $destination

    if [ -d $destination ]; then
        tar -cvzf $destination/$backupFile $source
    else
        mkdir -p $destination
        tar -cvzf $destination/$backupFile $source
    fi
fi

# run :$ `./backup.sh ./Include ./Backup`
