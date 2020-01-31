#!/bin/zsh
# source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

echo 'source <(kubectl completion bash)' >>~/.bashrc

kubectl completion bash >/usr/local/etc/bash_completion.d/kubectl