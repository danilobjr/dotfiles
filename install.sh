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
log="$HOME/.dotfiles.log"
config="$HOME/.config"
vscode_user="$config/Code/User"
vscode_tmp="$tmp/vscode.deb"
# fonts="$HOME/.fonts"
# fontFile=${tmp}/Font-Awesome-4.4.0/fonts/fontawesome-webfont.ttf

# functions
function echoHighlight() {
  echo -e "${light_blue}$1${no_color}" >> $log;
}

function install() {
  sudo apt install -y $1 2>>$log 1>>$log;
}

function echoBlueEmptyLine() {
  echo -e "${light_blue}\n" >> $log;
}

function echoNoColorEmptyLine() {
  echo -e "${no_color}\n" >> $log;
}

function dialogDependencies() {
  dialog --title "Installation Process" --infobox "Dependencies$1
  \nTerminal stuff
  \nDesktop Environment
  \nDev stuff
  \nSettings
  \n\nPlease wait..." 8 60;
}

function dialogTerminal() {
  dialog --title "Installation Process" --infobox "Dependencies..........................................OK
  \nTerminal stuff$1
  \nDesktop Environment
  \nDev stuff
  \nSettings
  \n\nPlease wait..." 8 60;
}

function dialogDesktop() {
  dialog --title "Installation Process" --infobox "Dependencies..........................................OK
  \nTerminal stuff........................................OK
  \nDesktop Environment$1
  \nDev stuff
  \nSettings
  \n\nPlease wait..." 8 60;
}

function dialogDev() {
  dialog --title "Installation Process" --infobox "Dependencies..........................................OK
  \nTerminal stuff........................................OK
  \nDesktop Environment...................................OK
  \nDev stuff$1
  \nSettings
  \n\nPlease wait..." 8 60;
}

function dialogSettings() {
  dialog --title "Installation Process" --infobox "Dependencies..........................................OK
  \nTerminal stuff........................................OK
  \nDesktop Environment...................................OK
  \nDev stuff.............................................OK
  \nSettings$1
  \n\nPlease wait..." 8 60;
}

function dialogInstallationAlmostDone() {
  dialog --title "Installation Process" --infobox "Dependencies..........................................OK
  \nTerminal stuff........................................OK
  \nDesktop Environment...................................OK
  \nDev stuff.............................................OK
  \nSettings..............................................OK
  \n\nAlmost finishing..." 8 60;
}

# create folders
if [ -f "$log" ]; then
  echoHighlight "Removing $log folder";
  rm $log;
fi

echo
echo -e "${light_blue}Hello, fellow programmer! Welcome to Danilo's";
echo

echo "██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗";
echo "██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝";
echo "██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗";
echo "██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║";
echo "██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║";
echo "╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝";

echo -e "                                              install script.";
echo -e "${no_color}";

wrong=false;
while : ; do
if [ "$wrong" = true ]; then
  IFS= read -sp $'\e[1;31mIncorrect password. \e[0mTry again: ' password
else
  IFS= read -sp "Enter you password: " password
fi

sudo -k
if sudo -lS &> /dev/null << EOF
$password
EOF
then
  break;
else
  echo -en "\r\033[K";
  wrong=true;
fi
done

echo -e "${light_blue}Please wait...${no_color}"

echoHighlight "Updating apt repos";
echo $password | sudo -S apt update 2>>$log 1>>$log;

echoHighlight "Installing dialog";
install dialog;

dialog --title "Welcome" --ok-label "Next" --msgbox "Welcome to Danilo's dotfiles install script.\n\n
This script will automatically install an i3wm desktop and some dev and utilities stuff, which I use in my main machine.\n\n
So sit back and relax. It'll take some time, but when done, you'll have a much more simpler, focused and performant system.\n\n
-Danilo" 15 60;

echoBlueEmptyLine;
echo "██████╗ ███████╗██████╗ ███████╗███╗   ██╗██████╗ ███████╗███╗   ██╗ ██████╗██╗███████╗███████╗" >> $log;
echo "██╔══██╗██╔════╝██╔══██╗██╔════╝████╗  ██║██╔══██╗██╔════╝████╗  ██║██╔════╝██║██╔════╝██╔════╝" >> $log;
echo "██║  ██║█████╗  ██████╔╝█████╗  ██╔██╗ ██║██║  ██║█████╗  ██╔██╗ ██║██║     ██║█████╗  ███████╗" >> $log;
echo "██║  ██║██╔══╝  ██╔═══╝ ██╔══╝  ██║╚██╗██║██║  ██║██╔══╝  ██║╚██╗██║██║     ██║██╔══╝  ╚════██║" >> $log;
echo "██████╔╝███████╗██║     ███████╗██║ ╚████║██████╔╝███████╗██║ ╚████║╚██████╗██║███████╗███████║" >> $log;
echo "╚═════╝ ╚══════╝╚═╝     ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═╝╚══════╝╚══════╝" >> $log;
echoNoColorEmptyLine;

dialogDependencies ".....................................i3-gaps";
echoHighlight "Installing i3-gaps dependencies";
install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev\
libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake;

dialogDependencies ".....................................apt-get";
echoHighlight "Installing apt-get dependencies";
install software-properties-common;

dialogDependencies ".....................Visual Studio Code";
echoHighlight "Installing Visual Studio Code dependencies";
install libgtk2.0-0;

dialogDependencies ".......................................PyWal";
echoHighlight "Installing PyWal dependencies";
install python3-pip imagemagick;

dialogDependencies ".....................................Polybar";
echoHighlight "Installing Polybar dependencies";
install clang cmake libcairo2-dev libxcb-xkb-dev xcb-proto \
libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libasound2-dev \
libpulse-dev libiw-dev libmpdclient-dev libcurl4-openssl-dev python-xcbgen;

dialogDependencies ".......................................snapd";
echoHighlight "Installing snapd";
install snapd;

dialogDependencies ".......................................Audio";
echoHighlight "Installing audio dependencies";
sudo snap install alsa-utils 1>>$log 2>>$log;

dialogDependencies "............................betterlockscreen";
echoHighlight "Installing betterlockscreen dependencies";
install imagemagick bc feh libxrandr-dev libev-dev libxcb-composite0 \
libxcb-composite0-dev libxcb-xinerama0 libxcb-randr0 libxcb-xinerama0-dev \
libxcb-xkb-dev libxcb-image0-dev libxcb-util-dev libxkbcommon-x11-dev \
libjpeg-turbo8-dev libpam0g-dev;

dialogDependencies "........................................curl";
echoHighlight "Installing curl";
install curl;

echoBlueEmptyLine;
echo "████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     " >> $log;
echo "╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     " >> $log;
echo "   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     " >> $log;
echo "   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     " >> $log;
echo "   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗" >> $log;
echo "   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝" >> $log;
echoNoColorEmptyLine;

dialogTerminal ".......................................Zsh";
echoHighlight "Installing Zsh";
install zsh;

dialogTerminal ".......................................Git";
echoHighlight "Installing Git";
install git;

dialogTerminal ".................................Oh-My-Zsh";
echoHighlight "Installing Oh-My-Zsh";
(wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh) 2>>$log 1>>$log;

dialogTerminal ".........................................Z";
echoHighlight "Installing Z.sh";
mkdir .z;
(wget -qO ${HOME}/.z/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh) 2>>$log 1>>$log;

dialogTerminal ".....................................URxvt";
echoHighlight "Installing URxvt";
install rxvt-unicode;

echoBlueEmptyLine;
echo "██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗ " >> $log;
echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗" >> $log;
echo "██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝" >> $log;
echo "██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝ " >> $log;
echo "██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║     " >> $log;
echo "╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     " >> $log;
echoNoColorEmptyLine;

dialogDesktop "..............Common home directories";
echoHighlight "Creating common folders at home directory";
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

dialogDesktop ".................................Xorg";
echoHighlight "Installing Xorg";
install xorg;

dialogDesktop "..............................LightDM";
echoHighlight "Installing LightDM";
install lightdm;

dialogDesktop "..............................i3-gaps";
echoHighlight "Installing i3-gaps";
# clone repo
git clone https://www.github.com/Airblader/i3 .i3-gaps 1>>$log 2>>$log;
# compile and install
cd .i3-gaps;
autoreconf --force --install 1>>$log 2>>$log;
rm -rf build/;
mkdir -p build;
cd build/;
# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers 1>>$log 2>>$log;
make -j8 1>>$log 2>>$log;
sudo make install 1>>$log 2>>$log;
cd $HOME;

dialogDesktop "..............................Polybar";
echoHighlight "Installing Polybar";
# clone repo
git clone --branch 3.2 --recursive https://github.com/jaagr/polybar ~/.polybar 1>>$log 2>>$log;
# before running build, replace build.sh file for my own ~/.dotfiles/polybar/build.sh
cd .polybar;
./build.sh 1>>$log 2>>$log;
cd $HOME;

dialogDesktop ".....................betterlockscreen";
echoHighlight "Installing betterlockscreen";
git clone https://github.com/PandorasFox/i3lock-color.git $HOME/.i3lock-color;
cd .i3lock-color;
autoreconf -i;
bash configure;
cd x86_64-pc-linux-gnu;
make -j8;
cd $HOME;
wget https://raw.githubusercontent.com/pavanjadhaw/betterlockscreen/master/betterlockscreen;
chmod 755 betterlockscreen;
sudo cp $HOME/betterlockscreen /usr/local/bin/betterlockscreen;
rm betterlockscreen;

dialogDesktop "................................pywal";
echoHighlight "Installing pywal";
pip3 install pywal;

dialogDesktop "................................dmenu";
echoHighlight "Installing dmenu";
install dmenu;

dialogDesktop "...............................ranger";
echoHighlight "Installing ranger";
install ranger;

dialogDev ".......................................Chromium";
echoHighlight "Installing Chromium";
sudo snap install chromium 1>>$log 2>>$log;

dialogDesktop "..............................compton";
echoHighlight "Installing compton";
install compton;

dialogDesktop "..................................feh";
echoHighlight "Installing feh";
install feh;

dialogDesktop "................................scrot";
echoHighlight "Installing scrot";
install scrot;

dialogDesktop "...................neofetch";
echoHighlight "Installing neofetch";
install neofetch;

dialogDesktop "................Brightness Controller";
echoHighlight "Installing Brightness Controller";
sudo add-apt-repository -y ppa:apandada1/brightness-controller 2>>$log 1>>$log;
install brightness-controller;

dialogDesktop "........................zip";
echoHighlight "Installing zip";
install zip;

dialogDesktop "......................unzip";
echoHighlight "Installing unzip";
install unzip;

echoBlueEmptyLine;
echo "██████╗ ███████╗██╗   ██╗    ███████╗████████╗██╗   ██╗███████╗███████╗" >> $log;
echo "██╔══██╗██╔════╝██║   ██║    ██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝" >> $log;
echo "██║  ██║█████╗  ██║   ██║    ███████╗   ██║   ██║   ██║█████╗  █████╗  " >> $log;
echo "██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  " >> $log;
echo "██████╔╝███████╗ ╚████╔╝     ███████║   ██║   ╚██████╔╝██║     ██║     " >> $log;
echo "╚═════╝ ╚══════╝  ╚═══╝      ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     " >> $log;
echoNoColorEmptyLine;

dialogDev "............................................Vim";
echoHighlight "Installing Vim";
install vim;

dialogDev ".........................................Vundle";
echoHighlight "Installing Vundle";
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 2>>$log 1>>$log;

dialogDev "............................................nvm";
echoHighlight "Installing nvm";
(wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash) 2>>$log 1>>$log;
chmod 755 ~/.nvm/nvm.sh;
bash $HOME/.nvm/nvm.sh;

dialogDev "........................................Node.js";
echoHighlight "Installing node";
nvm install node 1>>$log 2>>$log;

dialogDev "............................................now";
echoHighlight "Installing now";
npm install -g now 2>>$log 1>>$log;

# dialogDev ".................................terminal-alarm";
# echoHighlight "Installing terminal-alarm";
# npm install -g terminal-alarm 2>>$log 1>>$log;

dialogDev ".............................Visual Studio Code";
echoHighlight "Installing Visual Studio Code";
sudo snap install vscode --classic 1>>$log 2>>$log;

# dialogDev "...................................Font Awesome";
# echoHighlight "Installing Font Awesome";
# if [ ! -d "$tmp" ]; then
#   mkdir ${tmp};
# fi
# wget -qO ${tmp}/font-awesome.zip https://github.com/FortAwesome/Font-Awesome/archive/v4.4.0.zip 2>>$log 1>>$log;
# unzip -o ${tmp}/font-awesome.zip -d ${tmp} 2>>$log 1>>$log;
# if [ ! -d "$fonts" ]; then
#   mkdir ${fonts};
# fi
# echoHighlight "Moving $fontFile to $fonts";
# mv ${fontFile} ${fonts};

echoBlueEmptyLine;
echo "███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗" >> $log;
echo "██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝" >> $log;
echo "███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗" >> $log;
echo "╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║" >> $log;
echo "███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║" >> $log;
echo "╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝" >> $log;
echoNoColorEmptyLine;

# cloning dotfiles repo
dialogSettings "................................Cloning dotfiles";
echoHighlight "Cloning dotfiles repo in $dotfiles directory";
git clone https://github.com/danilobjr/dotfiles.git $dotfiles 2>>$log 1>>$log;

# .profile
dialogSettings ".........................................profile";
echoHighlight "Creating symlink for .profile at $HOME/.profile";
if [ -f "$HOME/.profile" ]; then
  rm ~/.profile;
fi
ln -s $dotfiles/.profile ~/.profile;

# .Xdefaults
dialogSettings ".......................................Xdefaults";
echoHighlight "Creating symlink for .Xdefaults at $HOME/.Xdefaults";
ln -s $dotfiles/.Xdefaults $HOME/.Xdefaults

# i3
dialogSettings "..............................................i3";
echoHighlight "Creating symlink for i3 at $config/i3";
rm -rf $config/i3;
ln -sf $dotfiles/i3 $config/i3;

# Polybar
dialogSettings ".........................................Polybar";
echoHighlight "Creating symlink for Polybar at $config/polybar/config";
rm $config/polybar/config;
ln -s $dotfiles/polybar/config $config/polybar/config 1>>$log 2>>$log;

# i3blocks
# dialogSettings "........................................i3blocks";
# echoHighlight "Creating symlink for i3blocks at $config/i3blocks";
# ln -sf ${dotfiles}/i3blocks ${config}/i3blocks;
# sudo rm /usr/share/i3blocks/volume;
# sudo ln -s ${dotfiles}/i3blocks/volume /usr/share/i3blocks/volume;

# ranger
dialogSettings "..........................................ranger";
echoHighlight "Moving ranger settings to $config/ranger";
# ranger --copy-config=all 2>>$log 1>>$log;
ln -sf $dotfiles/ranger $config/ranger;

# zsh
dialogSettings ".............................................Zsh";
echoHighlight "Creating symlink for Zsh at ~/.zshrc";
rm $HOME/.zshrc;
ln -s $dotfiles/zsh/.zshrc ~/.zshrc;
echo $password | sudo -S chsh -s `which zsh` 2>>$log 1>>$log;

# .gitconfig
dialogSettings ".......................................Gitconfig";
echoHighlight "Creating symlink for .gitconfig at ~/.gitconfig";
ln -s $dotfiles/git/.gitconfig $HOME/.gitconfig;

# tmux
# dialogSettings "............................................tmux";
# echoHighlight "Creating symlink for tmux at ~/.tmux.conf";
# ln -s ${dotfiles}/tmux/.tmux.conf ${HOME}/.tmux.conf;

# vscode
dialogSettings "...................Visual Studio Code Estensions";
echoHighlight "Installing Visual Studio Code extensions";
readarray vscode_extensions < ${dotfiles}/vscode/extensions;

for i in ${vscode_extensions[@]}
do
  code --install-extension $i 2>>$log 1>>$log;
done

ln -s ${dotfiles}/vscode/keybindings.json ${vscode_user}/keybindings.json;
ln -s ${dotfiles}/vscode/settings.json ${vscode_user}/settings.json;
rm -rf $vscode_user/snippets;
ln -sf ${dotfiles}/vscode/snippets ${vscode_user}/snippets;

# vim
dialogSettings ".............................................Vim";
echoHighlight "Creating symlink for Vim at ~/.vimrc";
ln -s ${dotfiles}/vim/.vimrc ${HOME}/.vimrc;

dialogSettings ".....................................Vim Plugins";
echoHighlight "Installing Vim plugins";

vim +PluginInstall +qall 2>>$log 1>>$log;

dialogInstallationAlmostDone;
sleep 2;

echoHighlight "Removing $tmp folder"
rm -rf ${tmp};

echoHighlight "Done."
should_reboot=$(dialog --title "Process Completed" --yes-label "Reboot now" --default-button no --yesno "Congratulations!
Now you have all the environment set in just minutes.
\n\nRead the docs in https://github.com/danilobjr/dotfiles to know the features and keymappings.
\n\nAlso you can see .dotfiles.log file in you home directory with all outputs from this operation.
\n\nYou have to reboot your system to see the changes. Would you like to do it now?" 17 50 3>&1 1>&2 2>&3 3>&1);

clear;

if [ "$should_reboot" = 0 ]; then
  reboot;
fi
