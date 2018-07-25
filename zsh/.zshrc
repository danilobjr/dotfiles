# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/danilo/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

source ~/z.sh
cd /home/danilo/dev

# NVM
# ===

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ENVVARS
# =======

export RANGER_LOAD_DEFAULT_RC=FALSE
# export BROWSER=chromium

# ALIASES
# =======

# reload zsh config
alias reload!="source ~/.zshrc"

# open dotfiles
alias zshrc="vim ~/.zshrc"
#alias vimrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias gitconfig="vim ~/.gitconfig"

# NPM

alias nrb="npm run build"
alias nrd="npm run dev"
alias ns="npm start"
alias ni="npm install"
alias nu="npm uninstall"

# YARN

alias yi="yarn install"
alias ya="yarn add -E"
alias yad="yarn add -E -D"
alias yr="yarn remove"

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

# git-flow

alias gfi="git fi"
alias gfid="git fid"

alias gfp="git fp"
alias gff="git ff"
alias gfd="git fd"

alias gffs="git ffs"
alias gfff="git fff"
alias gffp="git ffp"
alias gfft="git fft"

alias gfrs="git frs"
alias gfrf="git frf"
alias gfrp="git frp"
alias gfrt="git frt"

alias gfhs="git fhs"
alias gfhf="git fhf"
alias gfhp="git fhp"
alias gfht="git fht"

alias gfbs="git fbs"
alias gfbf="git fbf"
alias gfbp="git fbp"
alias gfbt="git fbt"
