#!/bin/bash


BACKDIR="/backup/"
LOGFILE="/backup/backup.log"
RESOURCEHOME="/home/${USER}/"
RESOURCEDIRS=("main/" "back/")

function copy() {
    file=$1
    if [ -e $file ]; then
        cp --parents $file $BACKDIR 
        echo "  Done... $file"  >> $LOGFILE
    fi
}


echo  "["$(date +%Y-%m-%d%t%H:%M:%S)"]----------[Start]: "  >> $LOGFILE

for path in ${RESOURCEDIRS[@]};
do
    files=(`find ${RESOURCEHOME}${path} -mtime 0`)
    for ((i=`expr ${#files[*]} - 1`;i>=0;i--));
    do
        if [ $i -eq `expr ${#files[*]} - 1` ] || ! [[ ${files[`expr $i + 1`]} =~ ${files[$i]} ]]; then
            copy ${files[$i]}
        fi
    done
done

echo  "["$(date +%Y-%m-%d%t%H:%M:%S)"]----------[End]: "   >> $LOGFILE
