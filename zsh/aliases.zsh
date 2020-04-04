alias reload='echo "exec \$SHELL" && exec $SHELL'  # reload shell

alias g2w="cd $HOME/Documents/repo" # go to repos dir

alias g2g="cd $HOME/Documents/repo/code/go" # go to Go dir

alias edot="code $HOME/.dotfiles" # Edit dotfiles

dotenv-export-to-env() {
    #https://gist.github.com/mihow/9c7f559807069a03e302605691f85572
    set -o allexport
    [ -f $1 ] source $1
    set +o allexport
}