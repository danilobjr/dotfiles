#!/bin/bash

# colors
green="\033[0;32m"
no_color="\033[0m"

# locations

dotfiles="$HOME/.dotfiles"
tmp="/tmp/.dotfiles"
config="$HOME/.config"
vscodium_user="$config/VSCodium/User"
# replace this with $fontsFolder?
fonts="$HOME/.local/share/fonts"
fontFiles=${tmp}/Font-Awesome-5.2.0/web-fonts-with-css/webfonts/*.ttf
fontConfigFolder="$HOME/.config/fontconfig"
fontConfFile="fonts.conf"
fontsFolder="$HOME/.fonts"
emojiFontUrl="https://noto-website-2.storage.googleapis.com/pkgs/NotoColorEmoji-unhinted.zip"
githubCliVersion="0.8.0"
githubCliDebFile="gh_${githubCliVersion}_linux_386.deb"
githubCliDebFileUrl="https://github.com/cli/cli/releases/download/v${githubCliVersion}/gh_${githubCliVersion}_linux_386.deb"
analogOutputHeadphones=/usr/share/pulseaudio/alsa-mixer/paths/analog-output-headphones.conf
log=$HOME/.dotfiles_installation_log

# functions
function echoSectionTitle() {
  echo -e "${green}";
  echo >> $log;
  echo "==============================================================" | tee -a $log;
  echo "= $1" | tee -a $log;
  echo "==============================================================" | tee -a $log;
  echo -e "${no_color}";
  echo >> $log;
}

function echoHighlight() {
  echo -e "${green}$1${no_color}";
  echo "$1" >> $log;
}

function aptInstall() {
  sudo apt install -y "$@" 2>&1 | tee -a $log;
}

function snapInstall() {
  sudo snap install "$@" 2>&1 | tee -a $log;
}

function echoColorEmptyLine() {
  echo -e "${green}\n";
  echo >> $log;
}

function echoNoColorEmptyLine() {
  echo -e "${no_color}\n";
  echo >> $log;
}

if [ -f "$log" ]; then
  rm $log;
fi

echoColorEmptyLine;
echo "Hello, fellow programmer! Welcome to Danilo's" | tee -a $log;
echo | tee -a $log;

echo "██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗" | tee -a $log;
echo "██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝" | tee -a $log;
echo "██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗" | tee -a $log;
echo "██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║" | tee -a $log;
echo "██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║" | tee -a $log;
echo "╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝" | tee -a $log;

echo -e "                                              install script." | tee -a $log;
echo | tee -a $log;
echo "This script will automatically install an i3 desktop and" | tee -a $log;
echo "some dev and utility stuff, which I use in my main machine." | tee -a $log;
echo | tee -a $log;
echo "It may ask you something in the middle of the proccess." | tee -a $log;
echo | tee -a $log;
echo "Now sit back and relax. It'll take some time, but when done," | tee -a $log;
echo "you'll have a much more simpler, focused and performant system." | tee -a $log;
echo | tee -a $log;
echo "-Danilo" | tee -a $log;
echoNoColorEmptyLine;

read -p "Press Enter to continue...";

echoSectionTitle "Updating apt repos";
sudo apt update 2>&1 | tee -a $log;

echoColorEmptyLine;
echo "██████╗ ███████╗██████╗ ███████╗███╗   ██╗██████╗ ███████╗███╗   ██╗ ██████╗██╗███████╗███████╗" | tee -a $log;
echo "██╔══██╗██╔════╝██╔══██╗██╔════╝████╗  ██║██╔══██╗██╔════╝████╗  ██║██╔════╝██║██╔════╝██╔════╝" | tee -a $log;
echo "██║  ██║█████╗  ██████╔╝█████╗  ██╔██╗ ██║██║  ██║█████╗  ██╔██╗ ██║██║     ██║█████╗  ███████╗" | tee -a $log;
echo "██║  ██║██╔══╝  ██╔═══╝ ██╔══╝  ██║╚██╗██║██║  ██║██╔══╝  ██║╚██╗██║██║     ██║██╔══╝  ╚════██║" | tee -a $log;
echo "██████╔╝███████╗██║     ███████╗██║ ╚████║██████╔╝███████╗██║ ╚████║╚██████╗██║███████╗███████║" | tee -a $log;
echo "╚═════╝ ╚══════╝╚═╝     ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═╝╚══════╝╚══════╝" | tee -a $log;
echoNoColorEmptyLine;

echoSectionTitle "Installing i3-gaps dependencies";
aptInstall libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev \
libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake;

echoSectionTitle "Installing apt-get dependencies";
aptInstall software-properties-common;

echoSectionTitle "Installing Visual Studio Codium dependencies";
aptInstall libgtk2.0-0;

echoSectionTitle "Installing PyWal dependencies";
aptInstall python3-pip imagemagick;

echoSectionTitle "Installing Polybar dependencies";
aptInstall clang cmake libcairo2-dev libxcb-xkb-dev xcb-proto \
libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libasound2-dev \
libpulse-dev libiw-dev libmpdclient-dev libcurl4-openssl-dev python-xcbgen;

echoSectionTitle "Installing snapd";
aptInstall snapd;

echoSectionTitle "Installing audio dependencies";
aptInstall alsa-utils;

echoSectionTitle "Installing betterlockscreen dependencies";
aptInstall imagemagick bc feh libxrandr-dev libev-dev libxcb-composite0 \
libxcb-composite0-dev libxcb-xinerama0 libxcb-randr0 libxcb-xinerama0-dev \
libxcb-xkb-dev libxcb-image0-dev libxcb-util-dev libxkbcommon-x11-dev \
libjpeg-turbo8-dev libpam0g-dev;

echoSectionTitle "Installing curl";
aptInstall curl;

echoSectionTitle "Installing dunst dependencies";
aptInstall libnotify-bin libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev;

echoSectionTitle "Installing dependencies for custom scripts";
aptInstall ssh-askpass-gnome ssh-askpass;

echoColorEmptyLine;
echo "████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     " | tee -a $log;
echo "╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     " | tee -a $log;
echo "   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     " | tee -a $log;
echo "   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     " | tee -a $log;
echo "   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗" | tee -a $log;
echo "   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝" | tee -a $log;
echoNoColorEmptyLine;

echoSectionTitle "Installing Zsh";
aptInstall zsh;

echoSectionTitle "Installing Git";
aptInstall git;

echoSectionTitle "Installing Oh-My-Zsh";
(wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh) 2>&1 | tee -a $log;

echoSectionTitle "Installing Z.sh in home directory";
(wget -q https://raw.githubusercontent.com/rupa/z/master/z.sh) 2>&1 | tee -a $log;
echoHighlight "z.sh installed" | tee -a $log;

echoSectionTitle "Installing URxvt";
aptInstall rxvt-unicode;

echoColorEmptyLine;
echo "██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗ " | tee -a $log;
echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗" | tee -a $log;
echo "██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝" | tee -a $log;
echo "██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝ " | tee -a $log;
echo "██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║     " | tee -a $log;
echo "╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     " | tee -a $log;
echoNoColorEmptyLine;

echoSectionTitle "Creating common folders at home directory";
if [ ! -d "$HOME/Downloads" ]; then
  mkdir $HOME/Downloads;
  echoHighlight "$HOME/Downloads folder created";
else
  echoHighlight "$HOME/Downloads folder already exists";
fi

if [ ! -d "$HOME/Music" ]; then
  mkdir $HOME/Music;
  echoHighlight "$HOME/Music folder created";
else
  echoHighlight "$HOME/Music folder already exists";
fi

if [ ! -d "$HOME/Pictures" ]; then
  mkdir $HOME/Pictures;
  echoHighlight "$HOME/Pictures folder created";
else
  echoHighlight "$HOME/Pictures folder already exists";
fi

if [ ! -d "$HOME/Videos" ]; then
  mkdir $HOME/Videos;
  echoHighlight "$HOME/Videos folder created";
else
  echoHighlight "$HOME/Videos folder already exists";
fi

echoSectionTitle "Installing Xorg";
aptInstall xorg;

echoSectionTitle "Installing LightDM";
aptInstall lightdm;

echoSectionTitle "Installing i3-gaps at ~/.i3-gaps directory";
# clone repo
git clone https://www.github.com/Airblader/i3 $HOME/.i3-gaps 2>&1 | tee -a $log;
# compile and install
cd .i3-gaps;
autoreconf --force --install 2>&1 | tee -a $log;
rm -rf build/;
mkdir -p build;
cd build/;
# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers 2>&1 | tee -a $log;
make -j8 2>&1 | tee -a $log;
sudo make install 2>&1 | tee -a $log;
cd $HOME;

echoSectionTitle "Cloning dotfiles repo in $dotfiles directory";
git clone https://github.com/danilobjr/dotfiles.git $dotfiles 2>&1 | tee -a $log;

echoSectionTitle "Installing Polybar in ~/.polybar directory";
# clone repo
git clone --branch 3.2 --recursive https://github.com/jaagr/polybar $HOME/.polybar 2>&1 | tee -a $log;
cd .polybar;
patch $HOME/.polybar/build.sh < $dotfiles/polybar/build.sh.diff 2>&1 | tee -a $log;
./build.sh 2>&1 | tee -a $log;
cd $HOME;

echoSectionTitle "Installing i3lock-color in ~/.i3lock-color";
git clone https://github.com/PandorasFox/i3lock-color.git $HOME/.i3lock-color 2>&1 | tee -a $log;
cd .i3lock-color;
autoreconf -i 2>&1 | tee -a $log;
bash configure 2>&1 | tee -a $log;
cd x86_64-pc-linux-gnu;
make -j8 2>&1 | tee -a $log;
cd $HOME;

echoSectionTitle "Installing betterlockscreen script";
wget https://raw.githubusercontent.com/pavanjadhaw/betterlockscreen/master/betterlockscreen 2>&1 | tee -a $log;
chmod 755 betterlockscreen;
sudo cp $HOME/betterlockscreen /usr/local/bin/betterlockscreen;
rm betterlockscreen;

echoSectionTitle "Installing pywal";
pip3 install pywal 2>&1 | tee -a $log;

echoSectionTitle "Installing rofi";
aptInstall rofi;

echoSectionTitle "Installing ranger";
aptInstall ranger;

echoSectionTitle "Installing Chromium";
snapInstall chromium;

echoSectionTitle "Installing mpv";
snapInstall mpv;

echoSectionTitle "Installing compton";
aptInstall compton;

echoSectionTitle "Installing feh";
aptInstall feh;

echoSectionTitle "Installing scrot";
aptInstall scrot;

echoSectionTitle "Installing neofetch";
aptInstall neofetch;

echoSectionTitle "Installing htop";
aptInstall htop;

echoSectionTitle "Installing pandoc";
aptInstall pandoc;

echoSectionTitle "Installing dunst";
aptInstall dunst;

echoSectionTitle "Installing Brightness Controller";
sudo add-apt-repository -y ppa:apandada1/brightness-controller 2>&1 | tee -a $log;
aptInstall brightness-controller;

echoSectionTitle "Installing zip";
aptInstall zip;

echoSectionTitle "Installing unzip";
aptInstall unzip;

echoSectionTitle "Installing sound-theme-freedesktop";
aptInstall sound-theme-freedesktop;

echoSectionTitle "Cloning Workman"
gcl https://github.com/ojbucao/Workman.git $HOME/.workman;

echoColorEmptyLine;
echo "██████╗ ███████╗██╗   ██╗    ███████╗████████╗██╗   ██╗███████╗███████╗" | tee -a $log;
echo "██╔══██╗██╔════╝██║   ██║    ██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝" | tee -a $log;
echo "██║  ██║█████╗  ██║   ██║    ███████╗   ██║   ██║   ██║█████╗  █████╗  " | tee -a $log;
echo "██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  " | tee -a $log;
echo "██████╔╝███████╗ ╚████╔╝     ███████║   ██║   ╚██████╔╝██║     ██║     " | tee -a $log;
echo "╚═════╝ ╚══════╝  ╚═══╝      ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     " | tee -a $log;
echoNoColorEmptyLine;

echoSectionTitle "Installing Vim";
aptInstall vim;

echoSectionTitle "Installing Vundle";
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim 2>&1 | tee -a $log;

echoSectionTitle "Installing nvm";
(wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash) 2>&1 | tee -a $log;
chmod 755 $HOME/.nvm/nvm.sh;
bash $HOME/.nvm/nvm.sh 2>&1 | tee -a $log;

echoSectionTitle "Installing node";
nvm install node 2>&1 | tee -a $log;

echoSectionTitle "Installing now";
npm install -g now 2>&1 | tee -a $log;

# dialogDev ".................................terminal-alarm";
# echoSectionTitle "Installing terminal-alarm";
# npm install -g terminal-alarm;

echoSectionTitle "Installing Visual Studio Codium";
snapInstall codium --classic;

echoSectionTitle "Installing Github CLI";
wget $githubCliDebFileUrl -P $HOME/Downloads;
aptInstall $githubCliDebFile;

echoSectionTitle "Installing Font Awesome";
if [ ! -d "$tmp" ]; then
  mkdir ${tmp};
fi
wget -qO ${tmp}/font-awesome.zip https://github.com/FortAwesome/Font-Awesome/archive/5.2.0.zip 2>&1 | tee -a $log;
unzip -o ${tmp}/font-awesome.zip -d ${tmp} 2>&1 | tee -a $log;
echoSectionTitle "Moving $fontFiles to $fonts";
cp ${fontFiles} ${fonts} 2>&1 | tee -a $log;

echoSectionTitle "Installing Noto Color Emoji font";
mkdir -p $fontsFolder;
wget $emojiFontUrl -P $fontsFolder;
mkdir -p $fontConfigFolder;
ln -s "$dotfiles/$fontConfFile" "$fontConfigFolder/$fontConfFile";

echoSectionTitle "Caching fonts";
sudo fc-cache -fv 2>&1 | tee -a $log;

echoColorEmptyLine;
echo "███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗" | tee -a $log;
echo "██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝" | tee -a $log;
echo "███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗" | tee -a $log;
echo "╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║" | tee -a $log;
echo "███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║" | tee -a $log;
echo "╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝" | tee -a $log;
echoNoColorEmptyLine;

# .profile
echoSectionTitle "Creating symlink for .profile at $HOME/.profile";
if [ -f "$HOME/.profile" ]; then
  rm $HOME/.profile;
fi
ln -s $dotfiles/.profile $HOME/.profile 2>&1 | tee -a $log;

# .Xdefaults
echoSectionTitle "Creating symlink for .Xdefaults at $HOME/.Xdefaults";
ln -s $dotfiles/.Xdefaults $HOME/.Xdefaults 2>&1 | tee -a $log;

# audio
echoSectionTitle "Applying patch $dotfiles/audio/analog-output-headphones.diff at $analogOutputHeadphones";
sudo patch $analogOutputHeadphones < $dotfiles/audio/analog-output-headphones.diff 2>&1 | tee -a $log;

# i3
echoSectionTitle "Creating symlink for i3 at $config/i3";
rm -rf $config/i3;
ln -sf $dotfiles/i3 $config/i3 2>&1 | tee -a $log;

# Polybar
echoSectionTitle "Creating symlink for Polybar at $config/polybar/config";
rm $config/polybar/config;
ln -s $dotfiles/polybar/config $config/polybar/config 2>&1 | tee -a $log;

# i3blocks
# echoSectionTitle "Creating symlink for i3blocks at $config/i3blocks";
# ln -sf ${dotfiles}/i3blocks ${config}/i3blocks;
# rm /usr/share/i3blocks/volume;
# ln -s ${dotfiles}/i3blocks/volume /usr/share/i3blocks/volume;

# ranger
echoSectionTitle "Moving ranger settings to $config/ranger";
# ranger --copy-config=all;
ln -sf $dotfiles/ranger $config/ranger 2>&1 | tee -a $log;

# zsh
echoSectionTitle "Creating symlink for Zsh at ~/.zshrc";
rm $HOME/.zshrc;
ln -s $dotfiles/zsh/.zshrc $HOME/.zshrc 2>&1 | tee -a $log;
sudo chsh -s `which zsh` 2>&1 | tee -a $log;

# .gitconfig
echoSectionTitle "Creating symlink for .gitconfig at ~/.gitconfig";
ln -s $dotfiles/git/.gitconfig $HOME/.gitconfig 2>&1 | tee -a $log;

# tmux
# dialogSettings "............................................tmux";
# echoSectionTitle "Creating symlink for tmux at ~/.tmux.conf";
# ln -s ${dotfiles}/tmux/.tmux.conf ${HOME}/.tmux.conf;

# neofetch
echoSectionTitle "Creating symlink for neofetch";
ln -s $dotfiles/neofetch/config $HOME/.config/neofetch/config;
echoHighlight "Created at ~/.config/neofetch/config"

# dunst
echoSectionTitle "Creating symlink for dunst";
ln -s $dotfiles/dunst/dunstrc $HOME/.config/dunst/dunstrc;

# rofi
echoSectionTitle "Creating symlink for rofi at ~/.config/rofi/config";
mkdir $config/rofi;
ln -s $dotfiles/rofi/config $config/rofi/config;
ln -s $dotfiles/rofi/rofi-theme.rasi $config/wal/templates/rofi-theme.rasi;

# workman
echoSectionTitle "Switching to workman keyboard layoutSet"
cd $HOME/.workman;
sudo cp xorg/workman /usr/share/X11/xkb/symbols/workman;
cd $HOME;

# vscodium
echoSectionTitle "Installing Visual Studio Codium extensions";
readarray vscodium_extensions < $dotfiles/vscodium/extensions;

for i in ${vscodium_extensions[@]}
do
  /snap/bin/codium --install-extension $i;
done

ln -s $dotfiles/vscodium/keybindings.json $vscodium_user/keybindings.json;
ln -s $dotfiles/vscodium/settings.json $vscodium_user/settings.json;
rm -rf $vscodium_user/snippets;
ln -sf $dotfiles/vscodium/snippets $vscodium_user/snippets;

# vim
echoSectionTitle "Creating symlink for Vim at ~/.vimrc";
ln -s $dotfiles/vim/.vimrc $HOME/.vimrc 2>&1 | tee -a $log;

echoSectionTitle "Installing Vim plugins";

vim +PluginInstall +qall 2>&1 | tee -a $log;

# echoHighlight "Removing $tmp folder"
rm -rf ${tmp};

echoColorEmptyLine;
echo "Congratulations!" | tee -a $log;
echo | tee -a $log;
echo "Now you have all the environment set in minutes." | tee -a $log;
echo "Read the docs in https://github.com/danilobjr/dotfiles to know the features and keymappings." | tee -a $log;
echo "Also you can see .dotfiles_installation_log file in you home directory with all outputs from this operation." | tee -a $log;
echo | tee -a $log;
echo "You have to reboot your system to see the changes." | tee -a $log;
echoNoColorEmptyLine;

read -p "Press Enter to quit..."
