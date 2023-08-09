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

function brewInstall() {
  cmd brew install "$@";
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

# echoColorEmptyLine;
# echo "██████╗ ███████╗██████╗ ███████╗███╗   ██╗██████╗ ███████╗███╗   ██╗ ██████╗██╗███████╗███████╗";
# echo "██╔══██╗██╔════╝██╔══██╗██╔════╝████╗  ██║██╔══██╗██╔════╝████╗  ██║██╔════╝██║██╔════╝██╔════╝";
# echo "██║  ██║█████╗  ██████╔╝█████╗  ██╔██╗ ██║██║  ██║█████╗  ██╔██╗ ██║██║     ██║█████╗  ███████╗";
# echo "██║  ██║██╔══╝  ██╔═══╝ ██╔══╝  ██║╚██╗██║██║  ██║██╔══╝  ██║╚██╗██║██║     ██║██╔══╝  ╚════██║";
# echo "██████╔╝███████╗██║     ███████╗██║ ╚████║██████╔╝███████╗██║ ╚████║╚██████╗██║███████╗███████║";
# echo "╚═════╝ ╚══════╝╚═╝     ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═╝╚══════╝╚══════╝";
# echoNoColorEmptyLine;

# echoSectionTitle "Installing curl";
# brewInstall curl;

# echoSectionTitle "Installing Git";
# brewInstall git;

echoColorEmptyLine;
cmd echo "████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     ";
cmd echo "╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     ";
cmd echo "   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     ";
cmd echo "   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     ";
cmd echo "   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗";
cmd echo "   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝";
echoNoColorEmptyLine;

echoSectionTitle "Installing Z.sh";
brewInstall z;

echoSectionTitle "Installing tmux";
brewInstall tmux;

echoSectionTitle "Installing tmux-powerline";
gitClone https://github.com/erikw/tmux-powerline.git $HOME/.tmux-powerline;
cmd cp $HOME/.tmux-powerline/themes/default.sh $HOME/.tmux-powerline/themes/default.sh.backup;
cmd ln -sf $dotfiles/tmux/powerline/themes/default.sh $HOME/.tmux-powerline/themes/default.sh;

echoSectionTitle "Installing Powerlevel10k";
gitClone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k;

# echoSectionTitle "Installing zsh-syntax-highlighting";
# gitClone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting;

# echoSectionTitle "Installing zsh-autosuggestions";
# gitClone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions;

# echoSectionTitle "Installing zsh-completions";
# gitClone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions;

echoSectionTitle "Installing Silver Searcher";
brewInstall the_silver_searcher;

echoSectionTitle "Installing fd";
brewInstall fd;

echoSectionTitle "Installing Lazygit";
brewInstall lazygit;
cmd mv /Users/danilo/Library/Application\ Support/lazygit/config.yml /Users/danilo/Library/Application\ Support/lazygit/config.yml.backup;
cmd ln -s $DOTFILES/lazygit/config.yml /Users/danilo/Library/Application\ Support/lazygit/config.yml;

echoSectionTitle "Installing exa";
brewInstall exa;

echoSectionTitle "Installing bat";
brewInstall bat;

echoColorEmptyLine;
cmd echo "██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗ ";
cmd echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗";
cmd echo "██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝";
cmd echo "██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝ ";
cmd echo "██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║     ";
cmd echo "╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     ";
echoNoColorEmptyLine;

echoSectionTitle "Installing rectangle";
brewInstall --cask rectangle;
cmd defaults write com.knollsoft.Rectangle screenEdgeGapTop -int 5;
cmd defaults write com.knollsoft.Rectangle screenEdgeGapBottom -int 5;
cmd defaults write com.knollsoft.Rectangle screenEdgeGapLeft -int 5;
cmd defaults write com.knollsoft.Rectangle screenEdgeGapRight -int 5;

echoSectionTitle "Cloning dotfiles repo in $dotfiles directory";
gitClone https://github.com/danilobjr/dotfiles.git $dotfiles;

#echoSectionTitle "Installing Font Awesome";
#pacmanSynchronize ttf-font-awesome;

echoSectionTitle "Installing JetBrains font";
cmd brew tap homebrew/cask-fonts;
brewInstall --cask font-jetbrains-mono;

echoSectionTitle "Installing yabai";
brewInstall koekeishiya/formulae/yabai;

echoSectionTitle "Installing skhd";
brewInstall koekeishiya/formulae/skhd;

echoColorEmptyLine;
echo "██████╗ ███████╗██╗   ██╗    ███████╗████████╗██╗   ██╗███████╗███████╗";
echo "██╔══██╗██╔════╝██║   ██║    ██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝";
echo "██║  ██║█████╗  ██║   ██║    ███████╗   ██║   ██║   ██║█████╗  █████╗  ";
echo "██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  ";
echo "██████╔╝███████╗ ╚████╔╝     ███████║   ██║   ╚██████╔╝██║     ██║     ";
echo "╚═════╝ ╚══════╝  ╚═══╝      ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     ";
echoNoColorEmptyLine;

echoSectionTitle "Installing asdf-vm";
brewInstall asdf;

echoSectionTitle "Installing docker-compose";
# cmd sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
# cmd sudo chmod +x /usr/local/bin/docker-compose;
# cmd sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose;
# cmd docker-compose --version;

echoSectionTitle "Installing docker";
# cmd sudo apt-get remove docker docker-engine docker.io containerd runc;
# cmd aptUpdate;
# aptInstall apt-transport-https ca-certificates curl gnupg-agent software-properties-common;
# cmd curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
# cmd sudo apt-key fingerprint 0EBFCD88;
# cmd sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable";
# cmd aptUpdate;
# aptInstall docker-ce docker-ce-cli containerd.io;
# cmd sudo groupadd docker;
# cmd sudo usermod -aG docker $USER;
# cmd newgrp docker;
# cmd sudo chmod 666 /var/run/docker.sock;

echoSectionTitle "Installing Visual Studio Code";
brewInstall --cask visual-studio-code;

echoSectionTitle "Installing Neovim";
brewInstall neovim;

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
# cmd ln -sf $dotfiles/.bashrc $HOME/.bashrc;
# cmd ln -sf $dotfiles/.bash_profile $HOME/.bash_profile;

# zsh
echoSectionTitle "Creating symlink for Zsh at ~/.zshrc";
cmd ln -sf $dotfiles/zsh/.zshrc $HOME/.zshrc;
cmd sudo chsh -s $(which zsh);

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

# vscode
# echoSectionTitle "Installing Visual Studio Code extensions";
# cmd readarray vscode_extensions < $dotfiles/vscode/extensions;

# for i in ${vscode_extensions[@]}
# do
#   cmd /var/lib/snapd/snap/bin/code --install-extension $i;
# done

# cmd ln -s $dotfiles/vscode/keybindings.json $vscode_user/keybindings.json;
# cmd ln -s $dotfiles/vscode/settings.json $vscode_user/settings.json;
# cmd rm -rf $vscode_user/snippets;
cmd ln -sf $DOTFILES/vscode/snippets $HOME/Library/Application\ Support/Code/User/snippets

# karabiner
cmd ln -sf $DOTFILES/karabiner/karabiner.json $HOME/.config/karabiner/karabiner.json

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
