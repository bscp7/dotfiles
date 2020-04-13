#!/bin/sh

# Setup gopath
export GOPATH=$HOME/go

# Update path
export PATH=$PATH:$GOPATH/bin

# To ensure that go built packages and binary files are installed
# in your local repo and not in the system wide go repository
LOCALREPO=$HOME/Documents/repo/code/go
export GOPATH=$LOCALREPO:$GOPATH

# Update path
export PATH=$PATH:$LOCALREPO/bin
