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
