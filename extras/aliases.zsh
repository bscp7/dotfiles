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

pcat() {
    pygmentize -f terminal256 -O style=native -g
}

wimi() {
  ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
  echo ${ip} | pbcopy | echo '=> Public IP copied to pasteboard.'
}
