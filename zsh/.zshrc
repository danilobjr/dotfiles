# =============================================================================
# === ENV VARS
# =============================================================================

export BREW=/opt/homebrew
export BROWSER=brave
export DOTFILES="$HOME/.dotfiles"
export EDITOR=lvim
export RANGER_LOAD_DEFAULT_RC=FALSE
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
export PATH=$PATH:$DOTFILES/scripts
export PATH=$PATH:~/.yarn/bin
export PATH=$PATH:/Users/danilo/.asdf/installs/rust/stable/bin
export PATH=$PATH:/Users/danilo/Library/Python/3.8/bin
export PATH=$PATH:/Users/danilo/.cargo/bin
export PATH=$PATH:/Users/danilo/.local/bin
#export ANDROID_SDK_ROOT="fd --type f --hidden --exclude .git"
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#export ANDROID_HOME=~/Android/Sdk
#export PATH=$PATH:$ANDROID_HOME/emulator
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:$ANDROID_HOME/tools/bin
#export PATH=$PATH:$ANDROID_HOME/platform-tools
#export PATH=$PATH:~/android-studio/bin
#export PATH=$PATH:~/.tfenv/bin

# =============================================================================
# === ZSH STUFF
# =============================================================================

#ZSH_THEME="powerlevel10k/powerlevel10k"
#plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

fpath=(${ASDF_DIR}/completions $fpath)

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc";
autoload -Uz compinit;
compinit;
# End of lines added by compinstall

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
# === ALIASES
# =============================================================================

# reload zsh config
alias reload!="source ~/.zshrc"

# open dotfiles
alias zshconfig="lvim ~/.zshrc"
alias nvimconfig="lvim ~/.config/nvim/init.vim"
alias lvimconfig="lvim"
alias gitconfig="lvim ~/.gitconfig"
alias i3config="lvim ~/.config/i3/config"
alias rangerconfig="lvim ~/.config/ranger/rc.conf"
alias tmuxconfig="lvim ~/.tmux.conf"
alias lazygitconfig="lvim ~/.config/lazygit/config.yml"

# utils
alias rmrf="rm -rf"
alias rmrfnm="rm -rf node_modules"
alias ll="exa -l --header --icons --group-directories-first"
alias la="ll --all"
alias ld="ll --only-dirs"
function lt {
  ll --tree --level=2 $1 $2
}

# sudo
alias sudoe="sudo env 'PATH=$PATH'"

# vim
alias v="lvim"

# pacman
alias pms="sudo pacman -S --needed"
alias pmr="sudo pacman -Rns"
alias pmu="sudo pacman -Syu"
alias pmq="pacman -Qs"

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
alias yb="yarn build"
alias yd="yarn dev"
alias ys="yarn start"
alias yl="yarn lint"
alias yrb="yarn rescript:build"
alias yrs="yarn rescript:start"
alias yrw="yarn rescript:watch"
alias yt="yarn test"
alias ytw="yarn test --watch"
alias ytc="yarn test --coverage"
alias yc="yarn commit"

# git
alias gs="git st"
alias gdiff="git dc"
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

# =============================================================================
# === SCRIPTS
# =============================================================================

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.z.sh ]] || source $HOME/.z.sh
[[ ! -f ~/.asdf/asdf.sh ]] || source $HOME/.asdf/asdf.sh
[[ ! -f ~/.powerlevel10k/powerlevel10k.zsh-theme ]] || source ~/.powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f $DOTFILES/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] || source $DOTFILES/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ ! -f $DOTFILES/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]] || source $DOTFILES/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
[[ ! -f $DOTFILES/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] || source $DOTFILES/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
