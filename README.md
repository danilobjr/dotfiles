# dotfiles

My dotfiles

## Install

wget -qO- https://raw.githubusercontent.com/danilobjr/dotfiles/master/install.sh | bash

### Start

- Update apt (apt update)
- run install.sh (with sudo)

## Install script

### Terminal

- zsh (apt install zsh)
- git (apt install git)
- oh-my-zsh (wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh)
- z (?)

### Desktop Environment

- i3 - Window manager (apt install i3)
- i3blocks - System status bar (apt install i3blocks)
- compton - Blur effects (apt install compton)
- feh - Wallpaper management (apt install feh)
- ranger - File management (apt install ranger)

### Dev stuff

- nvm (wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash)
- node (nvm install node)
- snapd (apt install snapd)
- Visual Studio Code (snap install vscode)
- Chromium (snap install chromium)

>TODO: let user choose what code editor and browser.

### Settings

`cp ~/dotfiles/.bash_profile ~`
`cp -r ~/dotfiles/.config/ ~`
`cp ~/dotfiles/.config/i3blocks/volume /usr/share/i3blocks/`
`cp ~/dotfiles/vscode/settings.json ~/.config/Code/User/`
`cp ~/dotfiles/vscode/keybindings.json ~/.config/Code/User/`
`cp ~/dotfiles/vscode/snippets/ ~/.config/Code/User/`
`code --install-extension $extensions`
- Change shell to zsh (chsh -s `which zsh`)
- Set wallpaper

>TODO: create $extensions variable
>TODO: create symlink instead of `mv`? This should ease when update dotfiles folder and push to git. All things stay updated.
>TODO: use an envvar for sound card in volume. Put its value in .bash_profile: SOUND_CARD_NUMBER. Value should be: default or hn:1.

### Utilities

These utilities should be choosen by user.

- now - Universal serverless single-command deployment (npm install -g terminal-alarm)
- terminal-alarm - Countdown in your terminal (npm install -g terminal-alarm)

### What's next

Enable color scheme for Vim by uncomment the lines below.

```
let base16colorspace=256
colorscheme base16-default-dark " the base16-shell colors has precedence
```

## License

Licensed under [MIT License](https://danilobjr.mit-license.org/).
