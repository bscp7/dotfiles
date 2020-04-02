#!/bin/sh

# activate python virtualenv
py37() {
    source $HOME/py37/bin/activate
}

pyvenv() {
    echo creating a python3 virtual environment
    python3 -m venv env
}