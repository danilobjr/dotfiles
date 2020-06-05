#!/bin/bash

# colors
green="\033[0;32m"
no_color="\033[0m"

# locations

dotfiles="$HOME/.dotfiles"
tmp="/tmp/.dotfiles"
config="$HOME/.config"
vscodium_user="$config/VSCodium/User"
modprobeConfigFile="/etc/modprobe.d/default.conf"
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

function pacmanSynchronize() {
  sudo pacman -Sy --needed "$@" 2>&1 | tee -a $log;
}

function gitClone() {
  git clone "$@" 2>&1 | tee -a $log;
}

function wGet() {
  wget "$@" 2>&1 | tee -a $log;
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
cmd echo "This script will automatically install an i3 desktop and";
cmd echo "some dev and utility stuff, which I use in my main machine.";
cmd echo;
cmd echo "It may ask you something in the middle of the proccess.";
cmd echo;
cmd echo "Now sit back and relax. It'll take some time, but when done,";
cmd echo "you'll have a much more simpler, focused and performant system.";
cmd echo;
cmd echo "-Danilo";
echoNoColorEmptyLine;

read -p "Press Enter to continue...";

echoSectionTitle "Updating system";
cmd sudo pacman -Syu;

echoColorEmptyLine;
echo "██████╗ ███████╗██████╗ ███████╗███╗   ██╗██████╗ ███████╗███╗   ██╗ ██████╗██╗███████╗███████╗";
echo "██╔══██╗██╔════╝██╔══██╗██╔════╝████╗  ██║██╔══██╗██╔════╝████╗  ██║██╔════╝██║██╔════╝██╔════╝";
echo "██║  ██║█████╗  ██████╔╝█████╗  ██╔██╗ ██║██║  ██║█████╗  ██╔██╗ ██║██║     ██║█████╗  ███████╗";
echo "██║  ██║██╔══╝  ██╔═══╝ ██╔══╝  ██║╚██╗██║██║  ██║██╔══╝  ██║╚██╗██║██║     ██║██╔══╝  ╚════██║";
echo "██████╔╝███████╗██║     ███████╗██║ ╚████║██████╔╝███████╗██║ ╚████║╚██████╗██║███████╗███████║";
echo "╚═════╝ ╚══════╝╚═╝     ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═╝╚══════╝╚══════╝";
echoNoColorEmptyLine;

#echoSectionTitle "Installing apt dependencies";
#aptInstall software-properties-common;
#sudo apt update 2>&1 | tee -a $log;

#echoSectionTitle "Adding speed-ricer ppa";
#sudo add-apt-repository -y ppa:kgilmer/speed-ricer 2>&1 | tee -a $log;

#echoSectionTitle "Adding brightness-controller ppa";
#sudo add-apt-repository -y ppa:apandada1/brightness-controller 2>&1 | tee -a $log;

#echoSectionTitle "Installing i3-gaps dependencies";
#aptInstall libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
#libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev \
#libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev \
#libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev;

#echoSectionTitle "Installing Visual Studio Codium dependencies";
#aptInstall libgtk2.0-0;

#echoSectionTitle "Installing PyWal dependencies";
#aptInstall python3-pip imagemagick;
echoSectionTitle "Installing Python and pip";
pacmanSynchronize python python-pip;

#echoSectionTitle "Installing Polybar dependencies";
#aptInstall build-essential git cmake cmake-data pkg-config python3-sphinx \
#libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev \
#python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev;

#echoSectionTitle "Installing Polybar optional dependencies";
#aptInstall libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev \
##these can conflict with i3-gaps
##i3-wm libjsoncpp-dev \
#libpulse-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev;

#echoSectionTitle "Installing snapd";
#aptInstall snapd;

echoSectionTitle "Installing Git";
pacmanSynchronize git;

echoSectionTitle "Installing yay";
cmd git clone https://aur.archlinux.org/yay.git
cmd cd yay
cmd makepkg -sicr

#echoSectionTitle "Installing betterlockscreen dependencies";
#aptInstall autoconf imagemagick bc feh libxrandr-dev libev-dev libxcb-composite0 \
#libxcb-composite0-dev libxcb-xinerama0 libxcb-randr0 libxcb-xinerama0-dev \
#libxcb-xkb-dev libxcb-image0-dev libxcb-util-dev libxkbcommon-x11-dev \
#libjpeg-turbo8-dev libpam0g-dev libxcb-xinerama0-dev;

echoSectionTitle "Installing curl";
aptInstall curl;

#echoSectionTitle "Installing dunst dependencies";
#aptInstall libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev \
#libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libnotify-dev;

#echoSectionTitle "Installing dependencies for custom scripts";
#aptInstall ssh-askpass-gnome ssh-askpass;

echoColorEmptyLine;
cmd echo "████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     ";
cmd echo "╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     ";
cmd echo "   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     ";
cmd echo "   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     ";
cmd echo "   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗";
cmd echo "   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝";
echoNoColorEmptyLine;

echoSectionTitle "Installing Zsh";
pacmanSynchronize zsh;

echoSectionTitle "Installing Oh-My-Zsh";
wGet https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh;

echoSectionTitle "Installing Z.sh in home directory";
wGet https://raw.githubusercontent.com/rupa/z/master/z.sh;
echoHighlight "z.sh installed";

echoSectionTitle "Installing URxvt";
pacmanSynchronize rxvt-unicode;

echoSectionTitle "Installing URxvt resize font plugin";
cmd yay -S urxvt-resize-font-git;

echoSectionTitle "Installing tmux";
pacmanSynchronize tmux;

echoSectionTitle "Installing Powerlevel10k";
if [ ! -d "$config" ]; then
  mkdir $config;
  echoHighlight "$config folder created";
fi
gitClone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k);
wGet https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf;
wGet https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf;
wGet https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf;
wGet https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf;
cmd sudo mv ./*.ttf /usr/share/fonts/TTF;
cmd fc-cache -f -v;

echoSectionTitle "Installing zsh-syntax-highlighting";
gitClone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting;

echoSectionTitle "Installing zsh-autosuggestions";
pacmanSynchronize zsh-autosuggestions;

echoSectionTitle "Installing zsh-completions";
gitClone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions;

echoSectionTitle "Installing Silver Searcher";
pacmanSynchronize the_silver_searcher;

echoColorEmptyLine;
cmd echo "██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗ ";
cmd echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗";
cmd echo "██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝";
cmd echo "██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝ ";
cmd echo "██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║     ";
cmd echo "╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     ";
echoNoColorEmptyLine;

echoSectionTitle "Creating common folders at home directory";
if [ ! -d "$HOME/Downloads" ]; then
  cmd mkdir $HOME/Downloads;
  echoHighlight "$HOME/Downloads folder created";
fi

if [ ! -d "$HOME/Music" ]; then
  cmd mkdir $HOME/Music;
  echoHighlight "$HOME/Music folder created";
fi

if [ ! -d "$HOME/Pictures" ]; then
  cmd mkdir $HOME/Pictures;
  echoHighlight "$HOME/Pictures folder created";
fi

if [ ! -d "$HOME/Videos" ]; then
  cmd mkdir $HOME/Videos;
  echoHighlight "$HOME/Videos folder created";
fi

echoSectionTitle "Installing audio (alsa-utils)";
pacmanSynchronize alsa-utils;

echoSectionTitle "Installing Xorg";
pacmanSynchronize xorg;

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

echoSectionTitle "Installing i3-gaps";
pacmanSynchronize i3-gaps;

echoSectionTitle "Cloning dotfiles repo in $dotfiles directory";
gitClone https://github.com/danilobjr/dotfiles.git $dotfiles;

echoSectionTitle "Installing Polybar in ~/.polybar directory";
# clone repo
gitClone --branch 3.2 --recursive https://github.com/jaagr/polybar $HOME/.polybar;
cmd cd .polybar;
cmd patch $HOME/.polybar/build.sh < $dotfiles/polybar/build.sh.diff;
cmd ./build.sh 2>&1 | tee -a $log;
cmd cd $HOME;

echoSectionTitle "Installing i3lock-color in ~/.i3lock-color";
gitClone https://github.com/PandorasFox/i3lock-color.git $HOME/.i3lock-color;
cmd cd .i3lock-color;
cmd autoreconf -i;
cmd bash configure;
cmd cd x86_64-pc-linux-gnu;
cmd make -j8;
cmd cd $HOME;

echoSectionTitle "Installing betterlockscreen script";
wGet https://raw.githubusercontent.com/pavanjadhaw/betterlockscreen/master/betterlockscreen;
cmd chmod 755 betterlockscreen;
cmd sudo cp $HOME/betterlockscreen /usr/local/bin/betterlockscreen;
cmd rm betterlockscreen;

echoSectionTitle "Installing pywal";
cmd pip3 install pywal;

echoSectionTitle "Installing rofi";
pacmanSynchronize rofi;

echoSectionTitle "Installing ranger";
pacmanSynchronize ranger;

echoSectionTitle "Installing Chromium";
pacmanSynchronize chromium;

echoSectionTitle "Installing mpv";
pacmanSynchronize mpv;

echoSectionTitle "Installing mplayer";
pacmanSynchronize mplayer;

echoSectionTitle "Installing compton";
pacmanSynchronize compton;

echoSectionTitle "Installing feh";
pacmanSynchronize feh;

echoSectionTitle "Installing scrot";
pacmanSynchronize scrot;

echoSectionTitle "Installing neofetch";
pacmanSynchronize neofetch;

echoSectionTitle "Installing htop";
pacmanSynchronize htop;

echoSectionTitle "Installing pandoc";
pacmanSynchronize pandoc;

echoSectionTitle "Installing dunst";
pacmanSynchronize dunst;

#echoSectionTitle "Installing Brightness Controller";
#aptInstall brightness-controller;

echoSectionTitle "Installing zip";
pacmanSynchronize zip;

echoSectionTitle "Installing unzip";
pacmanSynchronize unzip;

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

echoSectionTitle "Installing Neovim";
pacmanSynchronize neovim;

echoSectionTitle "Installing nvm";
wGet -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash;
cmd chmod 755 $HOME/.nvm/nvm.sh;
cmd bash $HOME/.nvm/nvm.sh;

echoSectionTitle "Installing node";
cmd nvm install node;

echoSectionTitle "Installing now";
cmd npm install -g now;

#echoSectionTitle "Installing alarm-cli";
#cmd npm install -g alarm-cli;

#echoSectionTitle "Installing Visual Studio Codium";
#pacmanSynchronize codium;

#echoSectionTitle "Installing Github CLI";
#wGet $githubCliDebFileUrl -P $HOME/Downloads;
#aptInstall $githubCliDebFile;

#echoSectionTitle "Installing Font Awesome";
#pacmanSynchronize ttf-font-awesome;

#echoSectionTitle "Installing Noto Color Emoji font";
#cmd mkdir -p $fontsFolder;
#wGet $emojiFontUrl -P $fontsFolder;
#cmd mkdir -p $fontConfigFolder;
#cmd ln -s "$dotfiles/$fontConfFile" "$fontConfigFolder/$fontConfFile";

echoSectionTitle "Caching fonts";
cmd sudo fc-cache -fv;

echoColorEmptyLine;
echo "███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗";
echo "██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝";
echo "███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗";
echo "╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║";
echo "███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║";
echo "╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝";
echoNoColorEmptyLine;

# .xinitrc
echoSectionTitle "Creating symlink for .xinitrc at $HOME/.xinitrc";
cmd ln -sf $dotfiles/xorg/.xinitrc $HOME/.xinitrc;

# .Xresources
echoSectionTitle "Creating symlink for .Xresources at $HOME/.Xresources";
cmd ln -sf $dotfiles/xorg/.Xresources $HOME/.Xresources;

# audio
echoSectionTitle "Audio settings";
cmd sudo touch $modprobeConfigFile;
cmd echo "options snd_hda_intel index=1" | sudo tee $modprobeConfigFile;

# i3
echoSectionTitle "Creating symlink for i3 at $config/i3";
cmd rm -rf $config/i3;
cmd ln -sf $dotfiles/i3 $config/i3;

# Polybar
echoSectionTitle "Creating symlink for Polybar at $config/polybar/config";
cmd rm $config/polybar/config;
cmd ln -s $dotfiles/polybar $config/polybar;

# ranger
echoSectionTitle "Moving ranger settings to $config/ranger";
# ranger --copy-config=all;
cmd ln -sf $dotfiles/ranger $config/ranger;

# zsh
echoSectionTitle "Creating symlink for Zsh at ~/.zshrc";
cmd rm $HOME/.zshrc;
cmd ln -s $dotfiles/zsh/.zshrc $HOME/.zshrc;
cmd sudo chsh -s $(which zsh);

# .gitconfig
echoSectionTitle "Creating symlink for .gitconfig at ~/.gitconfig";
cmd ln -s $dotfiles/git/.gitconfig $HOME/.gitconfig;

# tmux
echoSectionTitle "Creating symlink for tmux at ~/.tmux.conf";
cmd ln -s ${dotfiles}/tmux/.tmux.conf ${HOME}/.tmux.conf;

# neofetch
echoSectionTitle "Creating symlink for neofetch";
cmd ln -s $dotfiles/neofetch/config $HOME/.config/neofetch/config;
echoHighlight "Created at ~/.config/neofetch/config"

# dunst
echoSectionTitle "Creating symlink for dunst";
cmd ln -s $dotfiles/dunst/dunstrc $HOME/.config/dunst/dunstrc;

# rofi
echoSectionTitle "Creating symlink for rofi at ~/.config/rofi/";
cmd ln -s $dotfiles/rofi $config/rofi;
#cmd ln -s $dotfiles/rofi/rofi-theme.rasi $config/wal/templates/rofi-theme.rasi;

# vscodium
echoSectionTitle "Installing Visual Studio Codium extensions";
cmd readarray vscodium_extensions < $dotfiles/vscodium/extensions;

for i in ${vscodium_extensions[@]}
do
  cmd /bin/codium --install-extension $i;
done

cmd ln -s $dotfiles/vscodium/keybindings.json $vscodium_user/keybindings.json;
cmd ln -s $dotfiles/vscodium/settings.json $vscodium_user/settings.json;
cmd rm -rf $vscodium_user/snippets;
cmd ln -sf $dotfiles/vscodium/snippets $vscodium_user/snippets;

# Neovim
echoSectionTitle "Creating symlink for Neovim at $config/nvim";
cmd ln -sf $dotfiles/nvim $config/nvim;
echoSectionTitle "Install python3 provider for Neovim";
cmd python3 -m pip install --user --upgrade pynvim;

#echoSectionTitle "Installing Neovim plugins";
#cmd curl -fLo "$config/nvim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# echoHighlight "Removing $tmp folder"
cmd rm -rf ${tmp};

echoColorEmptyLine;
cmd echo "Congratulations!";
cmd echo;
cmd echo "Now you have all the environment set in minutes.";
cmd echo "Read the docs in https://github.com/danilobjr/dotfiles to know the features and keymappings.";
cmd echo "Also you can see .dotfiles_installation_log file in you home directory with all outputs from this operation.";
cmd echo;
cmd echo "You have to reboot your system to see the changes.";
echoNoColorEmptyLine;

cmd read -p "Press Enter to quit..."
