#!/bin/zsh

check_url(){
    timeout=5
    fails=0
    success=0
    while true; do
        curl --max-time ${timeout} --retry 1 --silent --output /dev/null https://www.baidu.com/
        if [ $? -ne 0 ]; then
            let fails+=1
        else
            let success+=1
        fi
        if [ $success -ge 1 ]; then
            echo "THIS SITE IS HEALTH"
            exit 0
        fi
        if [ $fails -ge 2 ]; then
            echo "THIS SITE IS DEAD, PLEASE CHECK IT RIGHT NOW"
            exit 2
        fi
    done
}

check_url