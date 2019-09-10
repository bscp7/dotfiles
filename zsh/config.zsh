export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# http://manpages.ubuntu.com/manpages/bionic/en/man1/zshoptions.1.html
setopt SHARE_HISTORY # share history between sessions
setopt EXTENDED_HISTORY # add timestamps to history
setopt APPEND_HISTORY # adds history
setopt HIST_VERIFY # Reload the line into the editing buffer
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks from each command before adding to history

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases
