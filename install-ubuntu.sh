#!/bin/bash

# colors
green="\033[0;32m"
no_color="\033[0m"

# locations

dotfiles="$HOME/.dotfiles"
tmp="/tmp/.dotfiles"
config="$HOME/.config"
vscode_user="$config/Code/User"
modprobeConfigFile="/etc/modprobe.d/default.conf"
fontsFolder="$HOME/.local/share/fonts"
fontFiles=${tmp}/Font-Awesome-5.2.0/web-fonts-with-css/webfonts/*.ttf
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

function echoColorEmptyLine() {
  echo -e "${green}\n";
  echo >> $log;
}

function echoNoColorEmptyLine() {
  echo -e "${no_color}\n";
  echo >> $log;
}

function cmd() {
  "$@" 2>&1 | tee -a $log;
}

function snapInstall() {
  cmd sudo snap install "$@";
}

function aptInstall() {
  cmd sudo apt install -y "$@";
}

function aptUpdate() {
  cmd sudo apt update;
}

function gitClone() {
  cmd git clone "$@";
}

if [ -f "$log" ]; then
  rm $log;
fi

echoColorEmptyLine;
cmd echo "Hello, fellow programmer! Welcome to Danilo's";
cmd echo;

cmd echo "██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗";
cmd echo "██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝";
cmd echo "██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗";
cmd echo "██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║";
cmd echo "██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║";
cmd echo "╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝";

cmd echo -e "                                              install script.";
cmd echo;
cmd echo "This script will automatically install some dev and utility";
cmd echo "stuff, which I use in my main machine.";
cmd echo;
cmd echo "It may ask you something in the middle of the proccess.";
cmd echo;
cmd echo "Now sit back and relax. It'll take some time.";
cmd echo;
cmd echo "-Danilo";
echoNoColorEmptyLine;

read -p "Press Enter to continue...";

echoSectionTitle "Updating system";
cmd aptUpdate & sudo apt upgrade;

echoColorEmptyLine;
echo "██████╗ ███████╗██████╗ ███████╗███╗   ██╗██████╗ ███████╗███╗   ██╗ ██████╗██╗███████╗███████╗";
echo "██╔══██╗██╔════╝██╔══██╗██╔════╝████╗  ██║██╔══██╗██╔════╝████╗  ██║██╔════╝██║██╔════╝██╔════╝";
echo "██║  ██║█████╗  ██████╔╝█████╗  ██╔██╗ ██║██║  ██║█████╗  ██╔██╗ ██║██║     ██║█████╗  ███████╗";
echo "██║  ██║██╔══╝  ██╔═══╝ ██╔══╝  ██║╚██╗██║██║  ██║██╔══╝  ██║╚██╗██║██║     ██║██╔══╝  ╚════██║";
echo "██████╔╝███████╗██║     ███████╗██║ ╚████║██████╔╝███████╗██║ ╚████║╚██████╗██║███████╗███████║";
echo "╚═════╝ ╚══════╝╚═╝     ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═╝╚══════╝╚══════╝";
echoNoColorEmptyLine;

echoSectionTitle "Installing curl";
cmd aptInstall curl;

echoSectionTitle "Installing build-essential";
cmd aptInstall build-essential;

echoSectionTitle "Installing apt dependencies";
aptInstall software-properties-common;
aptUpdate;

echoSectionTitle "Installing dconf";
aptInstall dconf-editor;

# echoSectionTitle "Adding brightness-controller ppa";
# cmd sudo add-apt-repository -y ppa:apandada1/brightness-controller;

echoSectionTitle "Installing Git";
aptInstall git;

echoSectionTitle "Installing Lazygit";
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+');
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz";
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit;
lazygit --version;
rm -rf lazygit.tar.gz;

#echoSectionTitle "Installing glu (flutter dependency)";
#pacmanSynchronize glu;

#echoSectionTitle "Installing betterlockscreen dependencies";
#aptInstall autoconf imagemagick bc feh libxrandr-dev libev-dev libxcb-composite0 \
#libxcb-composite0-dev libxcb-xinerama0 libxcb-randr0 libxcb-xinerama0-dev \
#libxcb-xkb-dev libxcb-image0-dev libxcb-util-dev libxkbcommon-x11-dev \
#libjpeg-turbo8-dev libpam0g-dev libxcb-xinerama0-dev;

echoColorEmptyLine;
cmd echo "████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     ";
cmd echo "╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     ";
cmd echo "   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     ";
cmd echo "   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     ";
cmd echo "   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗";
cmd echo "   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝";
echoNoColorEmptyLine;

echoSectionTitle "Installing Zsh";
aptInstall zsh;

#echoSectionTitle "Installing Oh-My-Zsh";
#cmd wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh;

echoSectionTitle "Installing Z.sh in home directory";
cmd wget https://raw.githubusercontent.com/rupa/z/master/z.sh;
echoHighlight "z.sh installed";

echoSectionTitle "Installing tmux";
aptInstall tmux;

echoSectionTitle "Installing Powerlevel10k";
mkdir -p $config;
echoHighlight "$config folder created";
cmd gitClone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k;

# echoSectionTitle "Installing zsh-syntax-highlighting";
# gitClone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting;

echoSectionTitle "Installing zsh-autosuggestions";
gitClone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions;

echoSectionTitle "Installing zsh-completions";
gitClone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions;

echoSectionTitle "Installing Silver Searcher";
pacmanSynchronize the_silver_searcher;

echoSectionTitle "Installing fd";
pacmanSynchronize fd;

echoColorEmptyLine;
cmd echo "██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗ ";
cmd echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗";
cmd echo "██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝";
cmd echo "██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝ ";
cmd echo "██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║     ";
cmd echo "╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     ";
echoNoColorEmptyLine;

# echoSectionTitle "Creating common folders at home directory";
# echoSectionTitle "Creating Downloads folder";
# if [ ! -d "$HOME/Downloads" ]; then
#   cmd mkdir $HOME/Downloads;
#   echoHighlight "$HOME/Downloads folder created";
# fi

# echoSectionTitle "Creating Music folder";
# if [ ! -d "$HOME/Music" ]; then
#   cmd mkdir $HOME/Music;
#   echoHighlight "$HOME/Music folder created";
# fi

# echoSectionTitle "Creating Pictures folder";
# if [ ! -d "$HOME/Pictures" ]; then
#   cmd mkdir $HOME/Pictures;
#   echoHighlight "$HOME/Pictures folder created";
# fi

# echoSectionTitle "Creating Videos folder";
# if [ ! -d "$HOME/Videos" ]; then
#   cmd mkdir $HOME/Videos;
#   echoHighlight "$HOME/Videos folder created";
# fi

echoSectionTitle "Creating $fontsFolder folder";
cmd mkdir -p $fontsFolder;
cmd mkdir -p $fontsFolder/bitmap;
cmd mkdir -p $fontsFolder/ttf;

# echoSectionTitle "Installing audio stuff";
# pacmanSynchronize alsa-utils;
# pacmanSynchronize asoundconf;

# echoSectionTitle "Installing Xorg";
# pacmanSynchronize xorg xorg-init xf86-video-ati;

## make has some dependencies in Polybar dependencies. Check which ones
#echoSectionTitle "Installing i3-gaps at ~/.i3-gaps directory";
## clone repo
#gitClone https://www.github.com/Airblader/i3 $HOME/.i3-gaps;
## compile and install
#cmd cd .i3-gaps;
#cmd autoreconf --force --install 2>&1 | tee -a $log;
#cmd rm -rf build/;
#cmd mkdir -p build;
#cmd cd build/;
## Disabling sanitizers is important for release versions!
## The prefix and sysconfdir are, obviously, dependent on the distribution.
#cmd ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers;
#cmd make -j8;
#cmd sudo make install;
#cmd cd $HOME;

#echoSectionTitle "Installing i3-gaps";
#pacmanSynchronize i3-gaps;

echoSectionTitle "Cloning dotfiles repo in $dotfiles directory";
gitClone https://github.com/danilobjr/dotfiles.git $dotfiles;

#echoSectionTitle "Installing Font Awesome";
#pacmanSynchronize ttf-font-awesome;

echoSectionTitle "Installing JetBrains font";
wGet https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip -P $HOME/Downloads;
cmd unzip $HOME/Downloads/JetBrainsMono-2.242.zip -d JetBrainsMono;
cmd mv $HOME/JetBrainsMono/fonts/ttf/* $fontsFolder/ttf;
cmd rm -rf $HOME/JetBrainsMono;

echoSectionTitle "Installing fonts for powerlevel10k";
wGet https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P $fontsFolder/ttf;
wGet https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P $fontsFolder/ttf;
wGet https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P $fontsFolder/ttf;
wGet https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P $fontsFolder/ttf;

# echoSectionTitle "Installing Waffle bitmap font";
# cmd cp $dotfiles/polybar/fonts/* $fontsFolder/bitmap;
# cmd mkfontdir $fontsFolder/bitmap;

echoSectionTitle "Installing Noto Color Emoji font";
wGet $emojiFontUrl -P $fontsFolder/ttf;

echoSectionTitle "Caching fonts";
cmd sudo fc-cache -fv;

# echoSectionTitle "Installing Polybar in ~/.polybar directory";
# gitClone --recursive https://github.com/polybar/polybar $HOME/.polybar;
# cmd cd .polybar;
# #cmd patch $HOME/.polybar/build.sh < $dotfiles/polybar/build.sh.diff;
# cmd ./build.sh;
# cmd cd $HOME;

# echoSectionTitle "Installing i3lock-color in ~/.i3lock-color";
# cmd yay -S i3lock-color;

# echoSectionTitle "Installing betterlockscreen script";
# wGet https://raw.githubusercontent.com/pavanjadhaw/betterlockscreen/master/betterlockscreen;
# cmd chmod 755 betterlockscreen;
# cmd sudo mv $HOME/betterlockscreen /usr/local/bin/betterlockscreen;
# cmd ln -s $dotfiles/betterlockscreen/betterlockscreenrc $config/betterlockscreenrc;

#echoSectionTitle "Installing pywal";
#cmd pip3 install pywal;

# echoSectionTitle "Installing OBS Studio";
# cmd sudo snap install obs-studio;

echoSectionTitle "Installing rofi";
pacmanSynchronize rofi;

# echoSectionTitle "Installing ranger";
# pacmanSynchronize ranger;

# echoSectionTitle "Installing w3m";
# pacmanSynchronize w3m;

# echoSectionTitle "Installing calcurse";
# pacmanSynchronize calcurse;

# echoSectionTitle "Installing Chromium";
# pacmanSynchronize chromium;

# echoSectionTitle "Installing mpv";
# pacmanSynchronize mpv;

# echoSectionTitle "Installing mplayer";
# pacmanSynchronize mplayer;

# echoSectionTitle "Installing compton";
# pacmanSynchronize compton;

# echoSectionTitle "Installing feh";
# pacmanSynchronize feh;

# echoSectionTitle "Installing scrot";
# pacmanSynchronize scrot;

# echoSectionTitle "Installing neofetch";
# pacmanSynchronize neofetch;

# echoSectionTitle "Installing glow";
# cmd yay -S glow;

# echoSectionTitle "Installing htop";
# pacmanSynchronize htop;

# echoSectionTitle "Installing pandoc";
# pacmanSynchronize pandoc;

# echoSectionTitle "Installing dunst";
# pacmanSynchronize dunst;

#echoSectionTitle "Installing Brightness Controller";
#aptInstall brightness-controller;

# echoSectionTitle "Installing zip";
# pacmanSynchronize zip;

# echoSectionTitle "Installing unzip";
# pacmanSynchronize unzip;

#echoSectionTitle "Installing sound-theme-freedesktop";
#aptInstall sound-theme-freedesktop;

echoColorEmptyLine;
echo "██████╗ ███████╗██╗   ██╗    ███████╗████████╗██╗   ██╗███████╗███████╗";
echo "██╔══██╗██╔════╝██║   ██║    ██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝";
echo "██║  ██║█████╗  ██║   ██║    ███████╗   ██║   ██║   ██║█████╗  █████╗  ";
echo "██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  ";
echo "██████╔╝███████╗ ╚████╔╝     ███████║   ██║   ╚██████╔╝██║     ██║     ";
echo "╚═════╝ ╚══════╝  ╚═══╝      ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     ";
echoNoColorEmptyLine;

echoSectionTitle "Installing asdf-vm";
cmd git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0;

echoSectionTitle "Installing docker-compose";
cmd sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
cmd sudo chmod +x /usr/local/bin/docker-compose;
cmd sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose;
cmd docker-compose --version;

echoSectionTitle "Installing docker";
cmd sudo apt-get remove docker docker-engine docker.io containerd runc;
cmd aptUpdate;
aptInstall apt-transport-https ca-certificates curl gnupg-agent software-properties-common;
cmd curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
cmd sudo apt-key fingerprint 0EBFCD88;
cmd sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable";
cmd aptUpdate;
aptInstall docker-ce docker-ce-cli containerd.io;
cmd sudo groupadd docker;
cmd sudo usermod -aG docker $USER;
cmd newgrp docker;
cmd sudo chmod 666 /var/run/docker.sock;

echoSectionTitle "Installing Visual Studio Code";
aptInstall code;

echoSectionTitle "Installing Neovim";
wGet https://github.com/neovim/neovim/releases/latest/download/nvim.appimage;
cmd chmod u+x nvim.appimage;
cmd ./nvim.appimage --appimage-extract;
cmd rm nvim.appimage;
cmd mv squashfs-root nvim-appimage;
# exposing nvim globally
cmd mv nvim-appimage /;
cmd ln -s /nvim-appimage/AppRun /usr/bin/nvim;

echoSectionTitle "Installing LunarVim";

# echoSectionTitle "Installing nvm";
# wGet -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash;

#echoSectionTitle "Installing flutter";
#cmd snap install flutter --classic;
#cmd yay -S android-sdk;

#echoSectionTitle "Installing vercel";
#cmd npm install -g vercel;

#echoSectionTitle "Installing alarm-cli";
#cmd npm install -g alarm-cli;

#echoSectionTitle "Installing Github CLI";
#wGet $githubCliDebFileUrl -P $HOME/Downloads;
#aptInstall $githubCliDebFile;

echoColorEmptyLine;
echo "███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗";
echo "██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝";
echo "███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗";
echo "╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║";
echo "███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║";
echo "╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝";
echoNoColorEmptyLine;

# .bash
echoSectionTitle "Creating symlink for .bashrc and .bash_profile";
cmd ln -sf $dotfiles/.bashrc $HOME/.bashrc;
cmd ln -sf $dotfiles/.bash_profile $HOME/.bash_profile;

# .xinitrc
# echoSectionTitle "Creating symlink for .xinitrc at $HOME/.xinitrc";
# cmd ln -sf $dotfiles/xorg/.xinitrc $HOME/.xinitrc;

# .Xresources
# echoSectionTitle "Creating symlink for .Xresources at $HOME/.Xresources";
# cmd ln -sf $dotfiles/xorg/.Xresources $HOME/.Xresources;

# audio
# echoSectionTitle "Audio settings";
# cmd sudo touch $modprobeConfigFile;
# #cmd echo "options snd_hda_intel index=1" | sudo tee $modprobeConfigFile;
# cmd asoundconf set-default-card PCH;

# i3
# echoSectionTitle "Creating symlink for i3 at $config/i3";
# #cmd rm -rf $config/i3;
# cmd ln -sf $dotfiles/i3 $config/i3;

# Polybar
# echoSectionTitle "Creating symlink for Polybar at $config/polybar/config";
# #cmd rm $config/polybar/config;
# cmd ln -s $dotfiles/polybar $config/polybar;

# ranger
# echoSectionTitle "Moving ranger settings to $config/ranger";
# # ranger --copy-config=all;
# cmd ln -sf $dotfiles/ranger $config/ranger;

# zsh
echoSectionTitle "Creating symlink for Zsh at ~/.zshrc";
cmd ln -sf $dotfiles/zsh/.zshrc $HOME/.zshrc;
#cmd sudo chsh -s $(which zsh);

# .gitconfig
echoSectionTitle "Creating symlink for .gitconfig at ~/.gitconfig";
cmd ln -sf $dotfiles/git/.gitconfig $HOME/.gitconfig;

# tmux
echoSectionTitle "Creating symlink for tmux at ~/.tmux.conf";
cmd ln -sf ${dotfiles}/tmux/.tmux.conf ${HOME}/.tmux.conf;

# neofetch
# echoSectionTitle "Creating symlink for neofetch";
# cmd mkdir -p $config/neofetch;
# cmd ln -s $dotfiles/neofetch/config $HOME/.config/neofetch/config;
# echoHighlight "Created at ~/.config/neofetch/config"

# dunst
# echoSectionTitle "Creating symlink for dunst";
# cmd mkdir -p $condif/dunst;
# cmd ln -s $dotfiles/dunst/dunstrc $HOME/.config/dunst/dunstrc;

# rofi
echoSectionTitle "Creating symlink for rofi at ~/.config/rofi/";
cmd ln -s $dotfiles/rofi $config/rofi;
#cmd ln -s $dotfiles/rofi/rofi-theme.rasi $config/wal/templates/rofi-theme.rasi;

# vscode
echoSectionTitle "Installing Visual Studio Code extensions";
cmd readarray vscode_extensions < $dotfiles/vscode/extensions;

for i in ${vscode_extensions[@]}
do
  cmd /var/lib/snapd/snap/bin/code --install-extension $i;
done

cmd ln -s $dotfiles/vscode/keybindings.json $vscode_user/keybindings.json;
cmd ln -s $dotfiles/vscode/settings.json $vscode_user/settings.json;
cmd rm -rf $vscode_user/snippets;
cmd ln -sf $dotfiles/vscode/snippets $vscode_user/snippets;

# Neovim
# echoSectionTitle "Creating symlink for Neovim at $config/nvim";
# cmd ln -sf $dotfiles/nvim $config/nvim;
# echoSectionTitle "Install python3 provider for Neovim";
# cmd python3 -m pip install --user --upgrade pynvim;

#echoSectionTitle "Installing Neovim plugins";
#cmd curl -fLo "$config/nvim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# echoHighlight "Removing $tmp folder"
cmd rm -rf ${tmp};

# Keyboard mapping
# echoSectionTitle "Mapping CapsLock as Escape";
# cmd xmodmap -e 'keycode 66 = Escape';
# cmd xmodmap -e 'keycode 66 = Escape';
# cmd xmodmap -e 'clear lock';
# cmd xmodmap -pke > $HOME/.Xmodmap;

echoColorEmptyLine;
cmd echo "Congratulations!";
cmd echo;
cmd echo "Now you have all the environment set in minutes.";
cmd echo "Read the docs in https://github.com/danilobjr/dotfiles to know the features and keymappings.";
cmd echo "Also you can see .dotfiles_installation_log file in you home directory with all outputs from this operation.";
cmd echo;
cmd echo "Run sudo dconf-editor /org/gnome/mutter to centralized windows on open (make this via script only)";
cmd echo;
cmd echo "You have to reboot your system to see the changes.";
echoNoColorEmptyLine;

cmd read -p "Press Enter to quit..."
