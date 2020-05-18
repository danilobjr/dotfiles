# Env Vars
# ========

export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"

# Zsh Stuff
# =========

ZSH_THEME="robbyrussell"
plugins=(git)
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

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
# =======

# reload zsh config
alias reload!="source ~/.zshrc"

# open dotfiles
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias gitconfig="vim ~/.gitconfig"
alias i3config="vim ~/.config/i3/config"

# apt-get
alias sai="sudo apt install"
alias sap="sudo apt purge"
alias saar="sudo apt autoremove"
alias saud="sudo apt update"
alias saug="sudo apt upgrade"

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
alias ys="yarn start"
alias yb="yarn build"
alias yl="yarn lint"

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
