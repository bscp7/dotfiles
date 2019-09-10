# initializes proxy settings
# load sandboxd config from ~/.sandboxrc
source $HOME/sandboxd

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/*/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}; do
  source "$file"
done

# load antibody plugins
source ~/.zsh_plugins.sh

# load everything but the path and completion files
# mostly config.zsh and aliases.zsh left
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
  source "$file"
done

# setup pure prompt
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure

# change color of the prompt
zstyle ':prompt:pure:prompt:success' color green
zstyle ':prompt:pure:prompt:error' color red

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}; do
  source "$file"
done

# Advanced tab-completion
autoload -Uz compinit && compinit -i

unset config_files

# search history with fzf if installed, default otherwise
if test -d /usr/local/opt/fzf/shell; then
	# shellcheck disable=SC1091
	. /usr/local/opt/fzf/shell/key-bindings.zsh
else
	bindkey '^R' history-incremental-search-backward
fi
