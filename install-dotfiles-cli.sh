export DOTFILES=$PWD/bin

ln -s $DOTFILES/dotfiles.sh ~/dotfiles

# add binaries into the path
[ -n "$DOTFILES" ] && PATH=$PATH:$DOTFILES
export PATH

echo "dotfiles CLI installed. Now you can run 'dotfiles --help'"
