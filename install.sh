#!/bin/bash

# colors
light_green="\033[1;32m"
no_color="\033[0m"

# locations
dotfiles="$HOME/.dotfiles"
dev="$HOME/dev"
tmp="/tmp/.dotfiles"
log="$HOME/.dotfiles.log"
config="$HOME/.config"
vscode_user="$config/Code/User"
vscode_tmp="$tmp/vscode.deb"
fonts="$HOME/.fonts"
fontFile=${tmp}/Font-Awesome-4.4.0/fonts/fontawesome-webfont.ttf

# functions
function logGreen() {
  echo -e "${light_green}$1${no_color}" >> $log;
}

function install() {
  sudo apt install -y $1 2>>$log 1>>$log;
}

# create folders
if [ -f "$log" ]; then
  logGreen "Removing $log folder";
  rm $log;
fi

if [ -f "$dev" ]; then
  logGreen "Creating $HOME/dev/ folder";
  mkdir $HOME/dev/;
fi

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

echo
read -s -p "Enter your password: " password;
echo -e "${light_green}Pease wait...${no_color}"

logGreen "Updating apt repos";
echo $password | sudo -S apt update 2>>$log 1>>$log;

logGreen "Installing dialog";
install dialog;

dialog --title "Welcome" --ok-label "Next" --msgbox "Welcome to Danilo's dotfiles install script.\n\n
This script will automatically install an i3wm desktop and some dev and utilities stuff, which I use in my main machine.\n\n
So sit back and relax. It'll take some time, but when done, you'll have a much more simpler, focused and performant system.\n\n
-Danilo" 15 60;

echo "████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     " >> $log;
echo "╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     " >> $log;
echo "   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     " >> $log;
echo "   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     " >> $log;
echo "   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗" >> $log;
echo "   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝" >> $log;

dialogTerminal ".......................................Zsh";
logGreen "Installing Zsh";
# sudo apt install -y zsh 2>>$log 1>>$log;
install zsh;

dialogTerminal ".......................................Git";
logGreen "Installing Git";
# sudo apt install -y git 2>>$log 1>>$log;
install git;

dialogTerminal ".................................Oh-My-Zsh";
logGreen "Installing Oh-My-Zsh";
(wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh) 2>>$log 1>>$log;

dialogTerminal ".........................................Z";
logGreen "Installing Z.sh";
(wget -qO ${HOME}/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh) 2>>$log 1>>$log;

echo "██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗ " >> $log;
echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗" >> $log;
echo "██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝" >> $log;
echo "██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝ " >> $log;
echo "██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║     " >> $log;
echo "╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     " >> $log;

dialogDesktop ".................................i3wm";
logGreen "Installing i3wm";
# sudo apt install -y i3;
install i3;

dialogDesktop ".............................i3blocks";
logGreen "Installing i3blocks";
# sudo apt install -y i3blocks;
install i3blocks;

dialogDesktop "..............................compton";
logGreen "Installing compton";
# sudo apt install -y compton;
install compton;

dialogDesktop "..................................feh";
logGreen "Installing feh";
# sudo apt install -y feh;
install feh;

dialogDesktop "...............................ranger";
logGreen "Installing ranger";
# sudo apt install -y ranger;
install ranger;

dialogDesktop "................Brightness Controller";
logGreen "Installing Brightness Controller";
sudo add-apt-repository -y ppa:apandada1/brightness-controller 2>>$log 1>>$log;
# sudo apt install -y brightness-controller;
install brightness-controller;

echo "██████╗ ███████╗██╗   ██╗    ███████╗████████╗██╗   ██╗███████╗███████╗" >> $log;
echo "██╔══██╗██╔════╝██║   ██║    ██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝" >> $log;
echo "██║  ██║█████╗  ██║   ██║    ███████╗   ██║   ██║   ██║█████╗  █████╗  " >> $log;
echo "██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  " >> $log;
echo "██████╔╝███████╗ ╚████╔╝     ███████║   ██║   ╚██████╔╝██║     ██║     " >> $log;
echo "╚═════╝ ╚══════╝  ╚═══╝      ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     " >> $log;

dialogDev "............................................Vim";
logGreen "Installing Vim";
# sudo apt install -y vim;
install vim;

dialogDev "...........................................curl";
logGreen "Installing curl";
# sudo apt install -y curl;
install curl;

dialogDev ".........................................Vundle";
logGreen "Installing Vundle";
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 2>>$log 1>>$log;

dialogDev "............................................nvm";
logGreen "Installing nvm";
(wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash) 2>>$log 1>>$log;

# logGreen "Installing node";
# nvm install node;

dialogDev "..........................................snapd";
logGreen "Installing snapd";
# sudo apt install -y snapd;
install snapd;

dialogDev ".............................Visual Studio Code";
logGreen "Installing Visual Studio Code";
wget -qO ${vscode_tmp} https://go.microsoft.com/fwlink/?LinkID=760868 2>>$log 1>>$log;
sudo dpkg -i ${vscode_tmp} 2>>$log 1>>$log;
sudo apt -f -y install 2>>$log 1>>$log;

dialogDev ".......................................Chromium";
logGreen "Installing Chromium";
# sudo snap install chromium;
install chromium;

dialogDev "...................................Font Awesome";
logGreen "Installing Font Awesome";
if [ ! -d "$tmp" ]; then
  mkdir ${tmp};
fi
wget -qO ${tmp}/font-awesome.zip https://github.com/FortAwesome/Font-Awesome/archive/v4.4.0.zip 2>>$log 1>>$log;
unzip -o ${tmp}/font-awesome.zip -d ${tmp} 2>>$log 1>>$log;
if [ ! -d "$fonts" ]; then
  mkdir ${fonts};
fi
logGreen "Moving $fontFile to $fonts";
mv ${fontFile} ${fonts};

echo "███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗" >> $log;
echo "██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝" >> $log;
echo "███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗" >> $log;
echo "╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║" >> $log;
echo "███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║" >> $log;
echo "╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝" >> $log;

dialogSettings ".......................................Wallpaper";
logGreen "Setting wallpaper";
cp ${dotfiles}/wallpapers/* ${HOME}/Pictures

dialogSettings "................................Cloning dotfiles";
logGreen "Cloning dotfiles repo in $dotfiles directory";
git clone https://github.com/danilobjr/dotfiles.git ${dotfiles} 2>>$log 1>>$log;

# i3
dialogSettings "..............................................i3";
logGreen "Creating symlink for i3 at $config/i3";
rm -rf ${config}/i3;
ln -sf ${dotfiles}/i3 ${config}/i3;

# i3blocks
dialogSettings "........................................i3blocks";
logGreen "Creating symlink for i3blocks at $config/i3blocks";
ln -sf ${dotfiles}/i3blocks ${config}/i3blocks;
sudo rm /usr/share/i3blocks/volume;
sudo ln -s ${dotfiles}/i3blocks/volume /usr/share/i3blocks/volume;

# ranger
dialogSettings "..........................................ranger";
logGreen "Moving ranger settings to $config/ranger";
ranger --copy-config=all 2>>$log 1>>$log;

# zsh
dialogSettings ".............................................Zsh";
logGreen "Creating symlink for Zsh at ~/.zshrc";
rm ${HOME}/.zshrc;
ln -s ${dotfiles}/zsh/.zshrc ~/.zshrc;
echo $password | sudo -S chsh -s `which zsh` 2>>$log 1>>$log;

# git
dialogSettings ".......................................Gitconfig";
logGreen "Creating symlink for .gitconfig at ~/.gitconfig";
ln -s ${dotfiles}/git/.gitconfig ${HOME}/.gitconfig;

# tmux
dialogSettings "............................................tmux";
logGreen "Creating symlink for tmux at ~/.tmux.conf";
ln -s ${dotfiles}/tmux/.tmux.conf ${HOME}/.tmux.conf;

# vim
dialogSettings ".............................................Vim";
logGreen "Creating symlink for Vim at ~/.vimrc";
ln -s ${dotfiles}/vim/.vimrc ${HOME}/.vimrc;

dialogSettings ".....................................Vim Plugins";
logGreen "Installing Vim plugins";

vim +PluginInstall +qall 2>>$log 1>>$log;

# vscode
dialogSettings "...................Visual Studio Code Estensions";
logGreen "Installing Visual Studio Code extensions";
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

logGreen "Removing $tmp folder"
rm -rf ${tmp};

logGreen "Done."
should_reboot=$(dialog --title "Process Completed" --yes-label "Reboot now" --default-button no --yesno "Congratulations!
Now you have all the environment set in just minutes.
\n\nRead the docs in https://github.com/danilobjr/dotfiles to know the features and keymappings.
\n\nYou should now reboot your system. Would you like to do it now?" 13 50 3>&1 1>&2 2>&3 3>&1);

clear;

if [ "$should_reboot" = 0 ]; then
  reboot;
fi
