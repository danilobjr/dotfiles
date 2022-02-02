# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# === ENV VARS
# =============================================================================

export BROSER=chromium
export DOTFILES="$HOME/.dotfiles"
export EDITOR=nvim
export RANGER_LOAD_DEFAULT_RC=FALSE
export ZSH="$HOME/.oh-my-zsh"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
#export ANDROID_SDK_ROOT="fd --type f --hidden --exclude .git"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$DOTFILES/scripts # set on .bashrc as well
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/android-studio/bin
export PATH=$PATH:~/.tfenv/bin
export PATH=$PATH:~/.yarn/bin

# =============================================================================
# === ZSH STUFF
# =============================================================================

#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit
# End of lines added by compinstall

source $ZSH/oh-my-zsh.sh
source $HOME/z.sh

# default folder
yellow="\033[1;33m"
light_cyan="\033[1;36m"
no_color="\033[0m"

if ! [ -d "$HOME/repos" ]; then
  mkdir $HOME/repos;
  echo
  echo -e "${yellow}  ╭────────────────────────────────────────╮"
  echo -e "${yellow}  │                                        │"
  echo -e "${yellow}  │   ${no_color}Running Zsh for the First time.      ${yellow}│"
  echo -e "${yellow}  │   ${light_cyan}$HOME/repos ${no_color}folder created.   ${yellow}│"
  echo -e "${yellow}  │                                        │"
  echo -e "${yellow}  │   ${light_cyan}-dotfiles                            ${yellow}│"
  echo -e "${yellow}  │                                        │"
  echo -e "${yellow}  ╰────────────────────────────────────────╯"
  echo
fi

# =============================================================================
# === NVM
# =============================================================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# =============================================================================
# === ALIASES
# =============================================================================

# reload zsh config
alias reload!="source ~/.zshrc"

# open dotfiles
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias gitconfig="nvim ~/.gitconfig"
alias i3config="nvim ~/.config/i3/config"
alias rangerconfig="nvim ~/.config/ranger/rc.conf"
alias tmuxconfig="nvim ~/.tmux.conf"

# utils
alias rmrf="rm -rf"
alias rmrfnm="rm -rf node_modules"

# sudo
alias sudoe="sudo env 'PATH=$PATH'"

# nvim
alias v="nvim"

# pacman
alias pms="sudo pacman -S --needed"
alias pmr="sudo pacman -Rns"
alias pmu="sudo pacman -Syu"
alias pmq="pacman -Qs"

# apt-get
#alias sai="sudo apt install"
#alias sap="sudo apt purge"
#alias saar="sudo apt autoremove"
#alias saud="sudo apt update"
#alias saug="sudo apt upgrade"

# npm
alias ns="npm start"
alias ni="npm install -E -S"
alias nid="npm install -E -D"
alias nu="npm uninstall"
alias nr="npm run"
alias nrb="npm run build"
alias nrd="npm run dev"
alias nrl="npm run lint"

# yarn
alias yi="yarn install"
alias ya="yarn add -E"
alias yad="yarn add -E -D"
alias yr="yarn remove"
alias yb="yarn build"
alias yd="yarn dev"
alias ys="yarn start"
alias yl="yarn lint"
alias yrb="yarn re:build"
alias yrs="yarn re:start"
alias yt="yarn test"
alias ytw="yarn test --watch"
alias ytc="yarn test --coverage"
alias yc="yarn commit"

# git
alias gs="git st"
alias gdc="git dc"
alias ga="git a"
alias gap="git ap"
alias gaa="git aa"
alias gcm="git cm"
alias gcam="git commit -a -m"
alias gpull="git pull"
alias gpush="git push"
alias gpullo="git pull origin"
alias gpusho="git push origin"
alias gunstage="git unstage"
alias gundo="git undo"
alias gco="git co"
alias gb="git br"
alias gcl="git cl"
alias gm="git m"
alias gr="git r"
alias grc="git rc"
alias glast="git last"
alias ghist="git hist"
alias gparent='git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//"'
alias gfo='git fetch origin'
alias gruop='git remote update origin --prune'

# lazygit
alias lg='lazygit'

# docker
alias dcls='docker container list --format "table {{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"'
alias dclsp='docker container list --format "table {{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}"'
alias dclsa='docker container list --all --format "table {{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"'
alias dcstart='docker container start'
alias dcstop='docker container stop'
alias dcr='docker container restart'
alias dcl='docker container logs -f'
alias dclearlogs='sudo sh -c "truncate -s 0 /var/lib/docker/containers/*/*-json.log"'

# aws
alias aws-cf-invalidate='aws cloudfront create-invalidation --distribution-id DIST_ID --paths "/*"'

# android
alias avd-ls='avdmanager list avd'
alias emulator-pixel-3='emulator -avd Pixel_3a_API_30_x86 -netdelay none -no-snapshot -wipe-data &'
alias emulator-galaxy-nexus='emulator -avd Galaxy_Nexus_API_30_1 -netdelay none -no-snapshot -wipe-data &'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
