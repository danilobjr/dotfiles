export DOTFILES=~/.dotfiles

# todo copy bin folder from repo folder to $DOTFILES

# add binaries into the path
[[ -d $DOTFILES/bin ]] && PATH=$PATH:$DOTFILES/bin
export PATH
