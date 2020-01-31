#!/bin/sh

# git ignore file
gi() {
	curl -s "https://www.gitignore.io/api/$*"
}


# Don't ask ssh password all the time
grc() {
    if [ "$(uname -s)" = "Darwin" ]; then
        git config --global credential.helper osxkeychain
    else
        git config --global credential.helper cache
    fi
}

git-init-personal() {
    git init
    git config user.email "bhavesh.scp@hotmail.com"
    git config user.name "Bhavesh Patel"
    cat .git/config
}