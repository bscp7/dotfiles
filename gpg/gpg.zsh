#!/usr/bin/env bash

g-keys() {
    gpg2 --list-secret-keys --keyid-format LONG
}

g-delete-key() {
    gpg2 --delete-secret-key "$1"
    gpg2 --delete-key "$1"
}

g-finger() {
    gpg2 --fingerprint
}

g-enc() {
    if [[ ! "$1" && ! "$2" && ! "$3" ]]; then
        echo "Require user, receiver and filename as an argument"
        return
    fi
    gpg2 -e -u "$1" -r "$2" $3
}

g-dec() {
    if [[ ! "$1" && ! "$2" ]]; then
        echo "Require output file and input file as an argument"
        return
    fi
    gpg2 -o testfile -d testfile.gpg
}

g-fix-this() {
    echo "gpg2 --detach-sign testfile
    gpg2 --verify testfile.sig
    gpg2 --armor --export --export bhavesh.scp@live.ca > bhaveshp.asc"
}