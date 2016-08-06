export DOTFILES_DIR=~/.dotfiles

# add binaries into the path
[[ -d $DOTFILES_DIR/bin ]] && PATH=$PATH:$DOTFILES_DIR/bin
export PATH
