#!/bin/bash

# variables

# colors
# black='\033[0;30m'
# dark_gray='\033[1;30m'
# red='\033[0;31m'
# light_red='\033[1;31m'
# green='\033[0;32m'
light_green="\033[1;32m"
# brown='\033[orange 0;33m'
# yellow='\033[1;33m'
# blue='\033[0;34m'
# light_blue='\033[1;34m'
# purple='\033[0;35m'
# light_purple='\033[1;35m'
# cyan='\033[0;36m'
# light_cyan='\033[1;36m'
# light_gray='\033[0;37m'
# white='\033[1;37m'
no_color="\033[0m"

# locations
dotfiles="$HOME/zzz/"

# functions
function echoSectionTitle {
  echo -e "${light_green}$1${no_color}"
}

function echoSubSectionTitle {
  echo
  echo -e "${light_green}$1${no_color}"
  echo
}

echoSubSectionTitle "Updating packages information"

sudo apt update;

echoSectionTitle "############"
echoSectionTitle "# TERMINAL #"
echoSectionTitle "############"

echoSubSectionTitle "Installing Zsh"

sudo apt install zsh

echoSubSectionTitle "Installing Git"

sudo apt install git;

echoSubSectionTitle "Installing Oh-My-Zsh"

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

echoSubSectionTitle "Cloning dotfiles repo in $dotfiles directory"

git clone https://github.com/danilobjr/dotfiles.git ${dotfiles};

echoSubSectionTitle "Installing Z.sh"

wget -q -O ${dotfiles}z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh;

# readarray vscode_extensions < ~/dev/dotfiles/vscode/extensions

# for i in ${vscode_extensions[@]}
# do
#   code --install-extension $i
# done

# ln -sf file_path symlink_path
