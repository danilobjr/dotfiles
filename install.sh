wget -P ~/ZZZ https://github.com/danilobjr/dotfiles/archive/master.zip
mv ~/ZZZ/master.zip ~/ZZZ/dotfiles.zip
unzip ~/ZZZ/dotfiles.zip
rm ~/ZZZ/dotfiles.zip

echo "Updating apt packages"

sudo apt update
