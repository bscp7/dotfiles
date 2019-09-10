#!/bin/sh

encode64() {
    echo -ne "$1" | base64
}

decode64() {
    echo -ne "$1" | base64 --decode
}

zprof() {
    for i in $(seq 1 10);
    do
        /usr/bin/time /bin/zsh -i -c exit; 
    done;
}