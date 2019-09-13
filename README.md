# Install .dotfiles

```bash
# Checkout files
git clone git@bitbucket.org:bhaveshscp/dotfiles.git $HOME/.dotfiles

# Backup existing configuration files
$HOME/.dotfiles/scripts/backup

# Setup dotfiles and Install dependencies
$HOME/.dotfiles/scripts/install

# Reload the terminal
reload
```

# [Optional Step] Additional touchup

Setup [vim-plug](https://github.com/junegunn/vim-plug)

```bash
# Checkout vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy .vimrc file from .dotfiles
cp $HOME/.dotfiles/.vimrc $HOME/.vimrc

# Install all the plugins listed in .vimrc file
vi -c "PlugInstall"

# .vimrc also has config for fuzzy finder so now you can open vi, press "ESC" then type ":Files" and press enter and you will be able to see all the files in the current directory.
```

# References

- https://github.com/caarlos0/dotfiles
- https://github.com/sindresorhus/pure
- https://github.com/gpakosz/.tmux
- https://blog.jonlu.ca/posts/speeding-up-zsh
