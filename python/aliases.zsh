#!/bin/sh

# activate python virtualenv
py() {
    source $HOME/py/bin/activate
}

pyvenv() {
    echo creating a python3 virtual environment
    /usr/local/opt/python@3.8/bin/python3 -m venv py
}