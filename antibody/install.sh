#!/bin/sh
if command -v brew >/dev/null 2>&1; then
	brew tap | grep -q 'getantibody/tap' || brew tap getantibody/tap
	brew upgrade antibody
else
	curl -sL https://git.io/antibody | sh -s
fi
antibody bundle < "$DOTFILES/antibody/bundles.txt" > "$HOME/.zsh_plugins.sh"
antibody update
