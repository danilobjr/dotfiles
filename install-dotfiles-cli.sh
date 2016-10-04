export DOTFILES=~/.dotfiles

# add binaries into the path
[[ -d $DOTFILES/bin ]] && PATH=$PATH:$DOTFILES/bin
export PATH
