#!/bin/bash

# colors
light_green="\033[1;32m"
blue="\033[0;34m"
light_blue="\033[1;34m"
purple="\033[0;35m"
light_purple="\033[1;35m"
no_color="\033[0m"

# locations

dotfiles="$HOME/.dotfiles"
# tmp="/tmp/.dotfiles"
config="$HOME/.config"
vscode_user="$config/Code/User"
vscode_tmp="$tmp/vscode.deb"
# fonts="$HOME/.fonts"
# fontFile=${tmp}/Font-Awesome-4.4.0/fonts/fontawesome-webfont.ttf

# functions
function echoSectionTitle() {
  echo "=============================================================="
  echo -e "= ${light_blue}$1${no_color}";
  echo "=============================================================="
}

function echoHightlight() {
  echo -e "${light_blue}$1${no_color}";
}

function install() {
  apt install -y $1;
}

function echoBlueEmptyLine() {
  echo -e "${light_blue}\n";
}

function echoNoColorEmptyLine() {
  echo -e "${no_color}\n";
}

echoBlueEmptyLine;
echo "Hello, fellow programmer! Welcome to Danilo's";
echo

echo "██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗";
echo "██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝";
echo "██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗";
echo "██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║";
echo "██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║";
echo "╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝";

echo -e "                                              install script.";
echo
echo "This script will automatically install an i3 desktop and";
echo "some dev and utilities stuff, which I use in my main machine.";
echo
echo "It may ask you something in the middle of the proccess.";
echo
echo "Now sit back and relax. It'll take some time, but when done,";
echo "you'll have a much more simpler, focused and performant system.";
echo
echo "-Danilo";
echoNoColorEmptyLine;

read -p "Press any key to continue...";

echoSectionTitle "Updating apt repos";
apt update;

echoBlueEmptyLine;
echo "██████╗ ███████╗██████╗ ███████╗███╗   ██╗██████╗ ███████╗███╗   ██╗ ██████╗██╗███████╗███████╗";
echo "██╔══██╗██╔════╝██╔══██╗██╔════╝████╗  ██║██╔══██╗██╔════╝████╗  ██║██╔════╝██║██╔════╝██╔════╝";
echo "██║  ██║█████╗  ██████╔╝█████╗  ██╔██╗ ██║██║  ██║█████╗  ██╔██╗ ██║██║     ██║█████╗  ███████╗";
echo "██║  ██║██╔══╝  ██╔═══╝ ██╔══╝  ██║╚██╗██║██║  ██║██╔══╝  ██║╚██╗██║██║     ██║██╔══╝  ╚════██║";
echo "██████╔╝███████╗██║     ███████╗██║ ╚████║██████╔╝███████╗██║ ╚████║╚██████╗██║███████╗███████║";
echo "╚═════╝ ╚══════╝╚═╝     ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═╝╚══════╝╚══════╝";
echoNoColorEmptyLine;

echoSectionTitle "Installing i3-gaps dependencies";
install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev\
libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake;

echoSectionTitle "Installing apt-get dependencies";
install software-properties-common;

echoSectionTitle "Installing Visual Studio Code dependencies";
install libgtk2.0-0;

echoSectionTitle "Installing PyWal dependencies";
install python3-pip imagemagick;

echoSectionTitle "Installing Polybar dependencies";
install clang cmake libcairo2-dev libxcb-xkb-dev xcb-proto \
libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libasound2-dev \
libpulse-dev libiw-dev libmpdclient-dev libcurl4-openssl-dev python-xcbgen;

echoSectionTitle "Installing snapd";
install snapd;

echoSectionTitle "Installing audio dependencies";
snap install alsa-utils;

echoSectionTitle "Installing betterlockscreen dependencies";
install imagemagick bc feh libxrandr-dev libev-dev libxcb-composite0 \
libxcb-composite0-dev libxcb-xinerama0 libxcb-randr0 libxcb-xinerama0-dev \
libxcb-xkb-dev libxcb-image0-dev libxcb-util-dev libxkbcommon-x11-dev \
libjpeg-turbo8-dev libpam0g-dev;

echoSectionTitle "Installing curl";
install curl;

echoBlueEmptyLine;
echo "████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     ";
echo "╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     ";
echo "   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     ";
echo "   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     ";
echo "   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗";
echo "   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝";
echoNoColorEmptyLine;

echoSectionTitle "Installing Zsh";
install zsh;

echoSectionTitle "Installing Git";
install git;

echoSectionTitle "Installing Oh-My-Zsh";
(wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh);

echoSectionTitle "Installing Z.sh in ~/.z directory";
mkdir .z;
(wget -qO ${HOME}/.z/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh);

echoSectionTitle "Installing URxvt";
install rxvt-unicode;

echoBlueEmptyLine;
echo "██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗ ";
echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗";
echo "██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝";
echo "██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝ ";
echo "██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║     ";
echo "╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     ";
echoNoColorEmptyLine;

echoSectionTitle "Creating common folders at home directory";
if [ ! -d "$HOME/Downloads" ]; then
  mkdir $HOME/Downloads;
  echoHighlight "$HOME/Downloads folder created";
fi
if [ ! -d "$HOME/Pictures" ]; then
  mkdir $HOME/Pictures;
  echoHighlight "$HOME/Pictures folder created";
fi
if [ ! -d "$HOME/Videos" ]; then
  mkdir $HOME/Videos;
  echoHighlight "$HOME/Videos folder created";
fi

echoSectionTitle "Installing Xorg";
install xorg;

echoSectionTitle "Installing LightDM";
install lightdm;

echoSectionTitle "Installing i3-gaps at ~/.i3-gaps directory";
# clone repo
git clone https://www.github.com/Airblader/i3 $HOME/.i3-gaps;
# compile and install
cd .i3-gaps;
autoreconf --force --install;
rm -rf build/;
mkdir -p build;
cd build/;
# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers;
make -j8;
make install;
cd $HOME;

echoSectionTitle "Cloning dotfiles repo in $dotfiles directory";
git clone https://github.com/danilobjr/dotfiles.git $dotfiles;

echoSectionTitle "Installing Polybar in ~/.polybar directory";
# clone repo
git clone --branch 3.2 --recursive https://github.com/jaagr/polybar $HOME/.polybar;
cd .polybar;
rm build.sh;
cp $dotfiles/polybar/build.sh build.sh;
./build.sh;
cd $HOME;

echoSectionTitle "Installing i3lock-color in ~/.i3lock-color";
git clone https://github.com/PandorasFox/i3lock-color.git $HOME/.i3lock-color;
cd .i3lock-color;
autoreconf -i;
bash configure;
cd x86_64-pc-linux-gnu;
make -j8;
cd $HOME;

echoSectionTitle "Installing betterlockscreen script";
wget https://raw.githubusercontent.com/pavanjadhaw/betterlockscreen/master/betterlockscreen;
chmod 755 betterlockscreen;
cp $HOME/betterlockscreen /usr/local/bin/betterlockscreen;
rm betterlockscreen;

echoSectionTitle "Installing pywal";
pip3 install pywal;

echoSectionTitle "Installing dmenu";
install dmenu;

echoSectionTitle "Installing ranger";
install ranger;

echoSectionTitle "Installing Chromium";
snap install chromium;

echoSectionTitle "Installing compton";
install compton;

echoSectionTitle "Installing feh";
install feh;

echoSectionTitle "Installing scrot";
install scrot;

echoSectionTitle "Installing neofetch";
install neofetch;

echoSectionTitle "Installing Brightness Controller";
add-apt-repository -y ppa:apandada1/brightness-controller;
install brightness-controller;

echoSectionTitle "Installing zip";
install zip;

echoSectionTitle "Installing unzip";
install unzip;

echoBlueEmptyLine;
echo "██████╗ ███████╗██╗   ██╗    ███████╗████████╗██╗   ██╗███████╗███████╗";
echo "██╔══██╗██╔════╝██║   ██║    ██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝";
echo "██║  ██║█████╗  ██║   ██║    ███████╗   ██║   ██║   ██║█████╗  █████╗  ";
echo "██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  ";
echo "██████╔╝███████╗ ╚████╔╝     ███████║   ██║   ╚██████╔╝██║     ██║     ";
echo "╚═════╝ ╚══════╝  ╚═══╝      ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     ";
echoNoColorEmptyLine;

echoSectionTitle "Installing Vim";
install vim;

echoSectionTitle "Installing Vundle";
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim;

echoSectionTitle "Installing nvm";
(wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash);
chmod 755 $HOME/.nvm/nvm.sh;
bash $HOME/.nvm/nvm.sh;

echoSectionTitle "Installing node";
nvm install node;

echoSectionTitle "Installing now";
npm install -g now;

# dialogDev ".................................terminal-alarm";
# echoSectionTitle "Installing terminal-alarm";
# npm install -g terminal-alarm;

echoSectionTitle "Installing Visual Studio Code";
snap install vscode --classic;

# dialogDev "...................................Font Awesome";
# echoSectionTitle "Installing Font Awesome";
# if [ ! -d "$tmp" ]; then
#   mkdir ${tmp};
# fi
# wget -qO ${tmp}/font-awesome.zip https://github.com/FortAwesome/Font-Awesome/archive/v4.4.0.zip;
# unzip -o ${tmp}/font-awesome.zip -d ${tmp};
# if [ ! -d "$fonts" ]; then
#   mkdir ${fonts};
# fi
# echoSectionTitle "Moving $fontFile to $fonts";
# mv ${fontFile} ${fonts};

echoBlueEmptyLine;
echo "███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗";
echo "██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝";
echo "███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗";
echo "╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║";
echo "███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║";
echo "╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝";
echoNoColorEmptyLine;

# .profile
echoSectionTitle "Creating symlink for .profile at $HOME/.profile";
if [ -f "$HOME/.profile" ]; then
  rm $HOME/.profile;
fi
ln -s $dotfiles/.profile $HOME/.profile;

# .Xdefaults
echoSectionTitle "Creating symlink for .Xdefaults at $HOME/.Xdefaults";
ln -s $dotfiles/.Xdefaults $HOME/.Xdefaults

# i3
echoSectionTitle "Creating symlink for i3 at $config/i3";
rm -rf $config/i3;
ln -sf $dotfiles/i3 $config/i3;

# Polybar
echoSectionTitle "Creating symlink for Polybar at $config/polybar/config";
rm $config/polybar/config;
ln -s $dotfiles/polybar/config $config/polybar/config;

# i3blocks
# echoSectionTitle "Creating symlink for i3blocks at $config/i3blocks";
# ln -sf ${dotfiles}/i3blocks ${config}/i3blocks;
# rm /usr/share/i3blocks/volume;
# ln -s ${dotfiles}/i3blocks/volume /usr/share/i3blocks/volume;

# ranger
echoSectionTitle "Moving ranger settings to $config/ranger";
# ranger --copy-config=all;
ln -sf $dotfiles/ranger $config/ranger;

# zsh
echoSectionTitle "Creating symlink for Zsh at ~/.zshrc";
rm $HOME/.zshrc;
ln -s $dotfiles/zsh/.zshrc $HOME/.zshrc;
chsh -s `which zsh`;

# .gitconfig
echoSectionTitle "Creating symlink for .gitconfig at ~/.gitconfig";
ln -s $dotfiles/git/.gitconfig $HOME/.gitconfig;

# tmux
# dialogSettings "............................................tmux";
# echoSectionTitle "Creating symlink for tmux at ~/.tmux.conf";
# ln -s ${dotfiles}/tmux/.tmux.conf ${HOME}/.tmux.conf;

# vscode
echoSectionTitle "Installing Visual Studio Code extensions";
readarray vscode_extensions < ${dotfiles}/vscode/extensions;

for i in ${vscode_extensions[@]}
do
  code --install-extension $i;
done

ln -s ${dotfiles}/vscode/keybindings.json ${vscode_user}/keybindings.json;
ln -s ${dotfiles}/vscode/settings.json ${vscode_user}/settings.json;
rm -rf $vscode_user/snippets;
ln -sf ${dotfiles}/vscode/snippets ${vscode_user}/snippets;

# vim
echoSectionTitle "Creating symlink for Vim at ~/.vimrc";
ln -s ${dotfiles}/vim/.vimrc ${HOME}/.vimrc;

echoSectionTitle "Installing Vim plugins";

vim +PluginInstall +qall;

# echoHighlight "Removing $tmp folder"
# rm -rf ${tmp};

echoBlueEmptyLine;
echo "Congratulations!"
echo
echo "Now you have all the environment set in just minutes."
echo "Read the docs in https://github.com/danilobjr/dotfiles to know the features and keymappings."
echo "Also you can see .dotfiles.log file in you home directory with all outputs from this operation."
echo "You have to reboot your system to see the changes. Would you like to do it now?"
echo

read -p "Press any key to quit..."
