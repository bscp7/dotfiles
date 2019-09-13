#!/bin/sh

# activate python virtualenv
py37() {
    source $HOME/pyvenv/bin/activate
}

pyvenv() {
    echo creating a python3 virtual environment
    python3 -m venv env
}