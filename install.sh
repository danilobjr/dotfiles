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
tmp="/tmp/.dotfiles"
log="$HOME/.dotfiles.log"
config="$HOME/.config"
vscode_user="$config/Code/User"
vscode_tmp="$tmp/vscode.deb"
fonts="$HOME/.fonts"
fontFile=${tmp}/Font-Awesome-4.4.0/fonts/fontawesome-webfont.ttf

# functions
function echoSectionTitle() {
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

function dialogTerminal() {
  dialog --title "Installation Process" --infobox "Terminal stuff$1
  \nDesktop Environment
  \nDev stuff
  \nSettings
  \n\nPlease wait..." 8 60;
}

function dialogDesktop() {
  dialog --title "Installation Process" --infobox "Terminal stuff........................................OK
  \nDesktop Environment$1
  \nDev stuff
  \nSettings
  \n\nPlease wait..." 8 60;
}

function dialogDev() {
  dialog --title "Installation Process" --infobox "Terminal stuff........................................OK
  \nDesktop Environment...................................OK
  \nDev stuff$1
  \nSettings
  \n\nPlease wait..." 8 60;
}

function dialogSettings() {
  dialog --title "Installation Process" --infobox "Terminal stuff........................................OK
  \nDesktop Environment...................................OK
  \nDev stuff.............................................OK
  \nSettings$1
  \n\nPlease wait..." 8 60;
}

function dialogInstallationDone() {
  dialog --title "Installation Process" --infobox "Terminal stuff........................................OK
  \nDesktop Environment...................................OK
  \nDev stuff.............................................OK
  \nSettings..............................................OK
  \n\nAlmost finishing..." 8 60;
}

# create folders
if [ -f "$log" ]; then
  echoSectionTitle "Removing $log folder";
  rm $log;
fi

# TODO: fix some symlink
echo
echo -e "${light_blue}Hello, fellow dev! Welcome to Danilo's";
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

echoSectionTitle "Updating apt repos";
echo $password | sudo -S apt update 2>>$log 1>>$log;

echoSectionTitle "Installing dialog";
install dialog;

dialog --title "Welcome" --ok-label "Next" --msgbox "Welcome to Danilo's dotfiles install script.\n\n
This script will automatically install an i3wm desktop and some dev and utilities stuff, which I use in my main machine.\n\n
So sit back and relax. It'll take some time, but when done, you'll have a much more simpler, focused and performant system.\n\n
-Danilo" 15 60;

echoBlueEmptyLine;
echo "████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     " >> $log;
echo "╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     " >> $log;
echo "   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     " >> $log;
echo "   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     " >> $log;
echo "   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗" >> $log;
echo "   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝" >> $log;
echoNoColorEmptyLine;

dialogTerminal ".......................................Zsh";
echoSectionTitle "Installing Zsh";
install zsh;

dialogTerminal ".......................................Git";
echoSectionTitle "Installing Git";
install git;

dialogTerminal ".................................Oh-My-Zsh";
echoSectionTitle "Installing Oh-My-Zsh";
(wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh) 2>>$log 1>>$log;

dialogTerminal ".........................................Z";
echoSectionTitle "Installing Z.sh";
(wget -qO ${HOME}/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh) 2>>$log 1>>$log;

echoBlueEmptyLine;
echo "██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗ " >> $log;
echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗" >> $log;
echo "██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝" >> $log;
echo "██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝ " >> $log;
echo "██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║     " >> $log;
echo "╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     " >> $log;
echoNoColorEmptyLine;

dialogDesktop ".................................i3wm";
echoSectionTitle "Installing i3wm";
install i3;

dialogDesktop ".............................i3blocks";
echoSectionTitle "Installing i3blocks";
install i3blocks;

dialogDesktop "..............................compton";
echoSectionTitle "Installing compton";
install compton;

dialogDesktop "..................................feh";
echoSectionTitle "Installing feh";
install feh;

dialogDesktop "...............................ranger";
echoSectionTitle "Installing ranger";
install ranger;

dialogDesktop "................Brightness Controller";
echoSectionTitle "Installing Brightness Controller";
sudo add-apt-repository -y ppa:apandada1/brightness-controller 2>>$log 1>>$log;
install brightness-controller;

echoBlueEmptyLine;
echo "██████╗ ███████╗██╗   ██╗    ███████╗████████╗██╗   ██╗███████╗███████╗" >> $log;
echo "██╔══██╗██╔════╝██║   ██║    ██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝" >> $log;
echo "██║  ██║█████╗  ██║   ██║    ███████╗   ██║   ██║   ██║█████╗  █████╗  " >> $log;
echo "██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  " >> $log;
echo "██████╔╝███████╗ ╚████╔╝     ███████║   ██║   ╚██████╔╝██║     ██║     " >> $log;
echo "╚═════╝ ╚══════╝  ╚═══╝      ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     " >> $log;
echoNoColorEmptyLine;

dialogDev "............................................Vim";
echoSectionTitle "Installing Vim";
install vim;

dialogDev "...........................................curl";
echoSectionTitle "Installing curl";
install curl;

dialogDev ".........................................Vundle";
echoSectionTitle "Installing Vundle";
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 2>>$log 1>>$log;

dialogDev "............................................nvm";
echoSectionTitle "Installing nvm";
(wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash) 2>>$log 1>>$log;

dialogDev "........................................Node.js";
echoSectionTitle "Installing node";
. ~/.nvm/nvm.sh install node 2>>$log 1>>$log;

dialogDev "............................................now";
echoSectionTitle "Installing now";
npm install -g now 2>>$log 1>>$log;

dialogDev ".................................terminal-alarm";
echoSectionTitle "Installing terminal-alarm";
npm install -g terminal-alarm 2>>$log 1>>$log;

dialogDev "..........................................snapd";
echoSectionTitle "Installing snapd";
install snapd;

dialogDev ".............................Visual Studio Code";
echoSectionTitle "Installing Visual Studio Code";
wget -qO ${vscode_tmp} https://go.microsoft.com/fwlink/?LinkID=760868 2>>$log 1>>$log;
sudo dpkg -i ${vscode_tmp} 2>>$log 1>>$log;
sudo apt -f -y install 2>>$log 1>>$log;

dialogDev ".......................................Chromium";
echoSectionTitle "Installing Chromium";
install chromium;

dialogDev "...................................Font Awesome";
echoSectionTitle "Installing Font Awesome";
if [ ! -d "$tmp" ]; then
  mkdir ${tmp};
fi
wget -qO ${tmp}/font-awesome.zip https://github.com/FortAwesome/Font-Awesome/archive/v4.4.0.zip 2>>$log 1>>$log;
unzip -o ${tmp}/font-awesome.zip -d ${tmp} 2>>$log 1>>$log;
if [ ! -d "$fonts" ]; then
  mkdir ${fonts};
fi
echoSectionTitle "Moving $fontFile to $fonts";
mv ${fontFile} ${fonts};

echoBlueEmptyLine;
echo "███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗" >> $log;
echo "██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝" >> $log;
echo "███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗" >> $log;
echo "╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║" >> $log;
echo "███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║" >> $log;
echo "╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝" >> $log;
echoNoColorEmptyLine;

# TODO: remove this because st will be added
# gnome-terminal
dialogSettings "..................................gnome-terminal";
# hide menubar
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false
# TODO: not working
profileId=$(gsettings get org.gnome.Terminal.ProfilesList default)
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profileId}/ scrollbar-policy 'never'

# cloning dotfiles repo
dialogSettings "................................Cloning dotfiles";
echoSectionTitle "Cloning dotfiles repo in $dotfiles directory";
git clone https://github.com/danilobjr/dotfiles.git ${dotfiles} 2>>$log 1>>$log;

if [ -f "$HOME/.profile" ]; then
  rm ~/.profile;
fi

ln -s ${dotfiles}/.profile ~/.profile;

# i3
dialogSettings "..............................................i3";
echoSectionTitle "Creating symlink for i3 at $config/i3";
rm -rf ${config}/i3;
ln -sf ${dotfiles}/i3 ${config}/i3;

# i3blocks
dialogSettings "........................................i3blocks";
echoSectionTitle "Creating symlink for i3blocks at $config/i3blocks";
ln -sf ${dotfiles}/i3blocks ${config}/i3blocks;
sudo rm /usr/share/i3blocks/volume;
sudo ln -s ${dotfiles}/i3blocks/volume /usr/share/i3blocks/volume;

# ranger
dialogSettings "..........................................ranger";
echoSectionTitle "Moving ranger settings to $config/ranger";
# ranger --copy-config=all 2>>$log 1>>$log;
ln -sf ${dotfiles}/ranger ${config}/ranger;

# zsh
dialogSettings ".............................................Zsh";
echoSectionTitle "Creating symlink for Zsh at ~/.zshrc";
rm ${HOME}/.zshrc;
ln -s ${dotfiles}/zsh/.zshrc ~/.zshrc;
echo $password | sudo -S chsh -s `which zsh` 2>>$log 1>>$log;

# git
dialogSettings ".......................................Gitconfig";
echoSectionTitle "Creating symlink for .gitconfig at ~/.gitconfig";
ln -s ${dotfiles}/git/.gitconfig ${HOME}/.gitconfig;

# tmux
dialogSettings "............................................tmux";
echoSectionTitle "Creating symlink for tmux at ~/.tmux.conf";
ln -s ${dotfiles}/tmux/.tmux.conf ${HOME}/.tmux.conf;

# vim
dialogSettings ".............................................Vim";
echoSectionTitle "Creating symlink for Vim at ~/.vimrc";
ln -s ${dotfiles}/vim/.vimrc ${HOME}/.vimrc;

dialogSettings ".....................................Vim Plugins";
echoSectionTitle "Installing Vim plugins";

vim +PluginInstall +qall 2>>$log 1>>$log;

# vscode
dialogSettings "...................Visual Studio Code Estensions";
echoSectionTitle "Installing Visual Studio Code extensions";
readarray vscode_extensions < ${dotfiles}/vscode/extensions;

for i in ${vscode_extensions[@]}
do
  code --install-extension $i 2>>$log 1>>$log;
done

ln -s ${dotfiles}/vscode/keybindings.json ${vscode_user}/keybindings.json;
ln -s ${dotfiles}/vscode/settings.json ${vscode_user}/settings.json;
ln -sf ${dotfiles}/vscode/snippets ${vscode_user}/snippets;

dialogInstallationDone;
sleep 2;

echoSectionTitle "Removing $tmp folder"
rm -rf ${tmp};

echoSectionTitle "Done."
should_reboot=$(dialog --title "Process Completed" --yes-label "Reboot now" --default-button no --yesno "Congratulations!
Now you have all the environment set in just minutes.
\n\nRead the docs in https://github.com/danilobjr/dotfiles to know the features and keymappings.
\n\nAlso you can see .dotfiles.log file in you home directory with all outputs from this operation.
\n\nYou have to reboot your system to see the changes. Would you like to do it now?" 17 50 3>&1 1>&2 2>&3 3>&1);

clear;

if [ "$should_reboot" = 0 ]; then
  reboot;
fi
