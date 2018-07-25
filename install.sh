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
dotfiles="$HOME/zzz"
tmp="/tmp/dotfiles"
config="$HOME/.config"
vscode_user="$config/Code/User"
vscode_tmp="$tmp/vscode.deb"
fonts="$HOME/.fonts"

# create tmp folder
mkdir ${tmp};

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

echo
echoSectionTitle "############"
echoSectionTitle "# TERMINAL #"
echoSectionTitle "############"

echoSubSectionTitle "Installing Zsh"

sudo apt install zsh;

echoSubSectionTitle "Installing Git"

sudo apt install git;

echoSubSectionTitle "Installing Oh-My-Zsh"

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh;

echoSubSectionTitle "Installing Z.sh"

wget -q -O ${HOME}/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh;

echo "z.sh installed in $HOME/z.sh"

echo
echoSectionTitle "#######################"
echoSectionTitle "# DESKTOP ENVIRONMENT #"
echoSectionTitle "#######################"

echoSubSectionTitle "Installing i3wm"

sudo apt install i3;

echoSubSectionTitle "Installing i3blocks"

sudo apt install i3blocks;

echoSubSectionTitle "Installing compton"

sudo apt install compton;

echoSubSectionTitle "Installing feh"

sudo apt install feh;

echoSubSectionTitle "Installing ranger"

sudo apt install ranger;

echo
echoSectionTitle "#############"
echoSectionTitle "# DEV STUFF #"
echoSectionTitle "#############"

echoSubSectionTitle "Installing nvm"

wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash;

echoSubSectionTitle "Installing node"

nvm install node;

echoSubSectionTitle "Installing snapd"

sudo apt install snapd;

echoSubSectionTitle "Installing Visual Studio Code"

wget -q --show-progress -O ${vscode_tmp} https://go.microsoft.com/fwlink/?LinkID=760868;
sudo dpkg -i ${vscode_tmp};

echoSubSectionTitle "Installing Chromium"

sudo snap install chromium;

echoSubSectionTitle "Installing icon font (Font Awesome)"

wget -q --show-progress -O ${tmp}/font-awesome.zip https://github.com/FortAwesome/Font-Awesome/archive/v4.4.0.zip;
unzip ${tmp}/font-awesome.zip -d ${tmp};
mkdir ${fonts};
mv ${tmp}/Font-Awesome-4.4.0/fonts/fontawesome-webfont.ttf ${fonts};

echo
echoSectionTitle "############"
echoSectionTitle "# SETTINGS #"
echoSectionTitle "############"

echoSubSectionTitle "Cloning dotfiles repo in $dotfiles directory"

git clone https://github.com/danilobjr/dotfiles.git ${dotfiles};

echoSubSectionTitle "Creating symbolic links"

# i3
ln -sf ${dotfiles}/i3 ${config}/i3

# i3blocks
ln -sf ${dotfiles}/i3blocks ${config}/i3blocks
sudo rm /usr/share/i3blocks/volume
sudo ln -s ${dotfiles}/.config/i3blocks/volume /usr/share/i3blocks/volume

# ranger
ranger --copy-config=all

# zsh
rm ${HOME}/.zshrc
ln -s ${dotfiles}/zsh/.zshrc
chsh -s `which zsh`

# vscode
rm ${vscode_user}/keybindings.json
rm ${vscode_user}/settings.json
rm -rf ${vscode_user}/snippets/
ln -s ${dotfiles}/vscode/keybindings.json ${vscode_user}/keybindings.json
ln -s ${dotfiles}/vscode/settings.json ${vscode_user}/settings.json
ln -sf ${dotfiles}/vscode/snippets ${vscode_user}/snippets

echoSubSectionTitle "Installing Visual Studio Code extensions"

readarray vscode_extensions < ${dotfiles}/vscode/extensions

for i in ${vscode_extensions[@]}
do
  code --install-extension $i
done

# remove tmp folder
rm -rf ${tmp};

echoSubSectionTitle "Done. You should now reboot the system."
