# =============================================================================
# === ENV VARS
# =============================================================================

export BREW=/opt/homebrew
export BROWSER=brave
export DOTFILES="$HOME/.dotfiles"
export EDITOR=nvim
export VISUAL=$EDITOR
# export MANPAGER=$EDITOR
export RANGER_LOAD_DEFAULT_RC=FALSE
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
# custom colors for eza (move this to eza-colors.sh file?)
export LS_COLORS='*.7z=38;5;40:*.WARC=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;40:*.tbz=38;5;40:*.tgz=38;5;40:*.warc=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.zoo=38;5;40:*.zpaq=38;5;40:*.zst=38;5;40:*.zstd=38;5;40:*.zz=38;5;40:*@.service=38;5;45:*AUTHORS=38;5;220;1:*CHANGES=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*COPYING=38;5;220;1:*COPYRIGHT=38;5;220;1:*CodeResources=38;5;239:*Dockerfile=38;5;155:*HISTORY=38;5;220;1:*INSTALL=38;5;220;1:*LICENSE=38;5;220;1:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*MANIFEST=38;5;243:*Makefile=38;5;155:*NOTICE=38;5;220;1:*PATENTS=38;5;220;1:*PkgInfo=38;5;239:*README=38;5;220;1:*README.md=38;5;220;1:*README.rst=38;5;220;1:*VERSION=38;5;220;1:*authorized_keys=1:*cfg=1:*conf=1:*config=1:*core=38;5;241:*id_dsa=38;5;192;3:*id_ecdsa=38;5;192;3:*id_ed25519=38;5;192;3:*id_rsa=38;5;192;3:*known_hosts=1:*lock=38;5;248:*lockfile=38;5;248:*pm_to_blib=38;5;240:*rc=1:*.1p=38;5;7:*.32x=38;5;213:*.3g2=38;5;115:*.3ga=38;5;137;1:*.3gp=38;5;115:*.3p=38;5;7:*.82p=38;5;121:*.83p=38;5;121:*.8eu=38;5;121:*.8xe=38;5;121:*.8xp=38;5;121:*.A64=38;5;213:*.BAT=38;5;172:*.BUP=38;5;241:*.C=38;5;81:*.CFUserTextEncoding=38;5;239:*.DS_Store=38;5;239:*.F=38;5;81:*.F03=38;5;81:*.F08=38;5;81:*.F90=38;5;81:*.F95=38;5;81:*.H=38;5;110:*.IFO=38;5;114:*.JPG=38;5;97:*.M=38;5;110:*.MOV=38;5;114:*.PDF=38;5;141:*.PFA=38;5;66:*.PL=38;5;160:*.R=38;5;49:*.RData=38;5;178:*.Rproj=38;5;11:*.S=38;5;110:*.S3M=38;5;137;1:*.SKIP=38;5;244:*.TIFF=38;5;97:*.VOB=38;5;115;1:*.a00=38;5;213:*.a52=38;5;213:*.a64=38;5;213:*.a78=38;5;213:*.aac=38;5;137;1:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.adf=38;5;213:*.adoc=38;5;184:*.afm=38;5;66:*.agda=38;5;81:*.agdai=38;5;110:*.ahk=38;5;41:*.ai=38;5;99:*.aiff=38;5;136;1:*.alac=38;5;136;1:*.allow=38;5;112:*.am=38;5;242:*.amr=38;5;137;1:*.ape=38;5;136;1:*.apk=38;5;215:*.application=38;5;116:*.aria2=38;5;241:*.asc=38;5;192;3:*.asciidoc=38;5;184:*.asf=38;5;115:*.asm=38;5;81:*.ass=38;5;117:*.atr=38;5;213:*.au=38;5;137;1:*.automount=38;5;45:*.avi=38;5;114:*.awk=38;5;172:*.bak=38;5;241:*.bash=38;5;172:*.bash_login=1:*.bash_logout=1:*.bash_profile=1:*.bat=38;5;172:*.bfe=38;5;192;3:*.bib=38;5;178:*.bin=38;5;124:*.bmp=38;5;97:*.bsp=38;5;215:*.c=38;5;81:*.c++=38;5;81:*.cab=38;5;215:*.caf=38;5;137;1:*.cap=38;5;29:*.car=38;5;57:*.cbr=38;5;141:*.cbz=38;5;141:*.cc=38;5;81:*.cda=38;5;136;1:*.cdi=38;5;213:*.cdr=38;5;97:*.chm=38;5;141:*.cl=38;5;81:*.clj=38;5;41:*.cljc=38;5;41:*.cljs=38;5;41:*.cljw=38;5;41:*.cnc=38;5;7:*.coffee=38;5;074;1:*.cp=38;5;81:*.cpp=38;5;81:*.cr=38;5;81:*.crx=38;5;215:*.cs=38;5;81:*.css=38;5;125;1:*.csv=38;5;78:*.ctp=38;5;81:*.cue=38;5;116:*.cxx=38;5;81:*.dart=38;5;51:*.dat=38;5;137;1:*.db=38;5;60:*.deb=38;5;215:*.def=38;5;7:*.deny=38;5;196:*.description=38;5;116:*.device=38;5;45:*.dhall=38;5;178:*.dicom=38;5;97:*.diff=48;5;197;38;5;232:*.directory=38;5;116:*.divx=38;5;114:*.djvu=38;5;141:*.dll=38;5;241:*.dmg=38;5;215:*.dmp=38;5;29:*.doc=38;5;111:*.dockerignore=38;5;240:*.docm=38;5;111;4:*.docx=38;5;111:*.drw=38;5;99:*.dtd=38;5;178:*.dts=38;5;137;1:*.dump=38;5;241:*.dwg=38;5;216:*.dylib=38;5;241:*.ear=38;5;215:*.el=38;5;81:*.elc=38;5;241:*.eln=38;5;241:*.eml=38;5;125;1:*.enc=38;5;192;3:*.entitlements=1:*.epf=1:*.eps=38;5;99:*.epsf=38;5;99:*.epub=38;5;141:*.err=38;5;160;1:*.error=38;5;160;1:*.etx=38;5;184:*.ex=38;5;7:*.example=38;5;7:*.f=38;5;81:*.f03=38;5;81:*.f08=38;5;81:*.f4v=38;5;115:*.f90=38;5;81:*.f95=38;5;81:*.fcm=38;5;137;1:*.feature=38;5;7:*.flac=38;5;136;1:*.flif=38;5;97:*.flv=38;5;115:*.fm2=38;5;213:*.fmp12=38;5;60:*.fnt=38;5;66:*.fon=38;5;66:*.for=38;5;81:*.fp7=38;5;60:*.ftn=38;5;81:*.fvd=38;5;124:*.fxml=38;5;178:*.gb=38;5;213:*.gba=38;5;213:*.gbc=38;5;213:*.gbr=38;5;7:*.gel=38;5;213:*.gemspec=38;5;41:*.ger=38;5;7:*.gg=38;5;213:*.ggl=38;5;213:*.gif=38;5;97:*.git=38;5;197:*.gitattributes=38;5;240:*.gitignore=38;5;240:*.gitmodules=38;5;240:*.go=38;5;81:*.gp3=38;5;115:*.gp4=38;5;115:*.gpg=38;5;192;3:*.gs=38;5;81:*.h=38;5;110:*.h++=38;5;110:*.hi=38;5;110:*.hidden-color-scheme=1:*.hidden-tmTheme=1:*.hin=38;5;242:*.hpp=38;5;110:*.hs=38;5;81:*.htm=38;5;125;1:*.html=38;5;125;1:*.hxx=38;5;110:*.icns=38;5;97:*.ico=38;5;97:*.ics=38;5;7:*.ii=38;5;110:*.img=38;5;124:*.iml=38;5;166:*.in=38;5;242:*.info=38;5;184:*.ini=1:*.ipa=38;5;215:*.ipk=38;5;213:*.ipynb=38;5;41:*.iso=38;5;124:*.j64=38;5;213:*.jad=38;5;215:*.jar=38;5;215:*.java=38;5;074;1:*.jhtm=38;5;125;1:*.jpeg=38;5;97:*.jpg=38;5;97:*.js=38;5;074;1:*.jsm=38;5;074;1:*.json=38;5;178:*.jsonl=38;5;178:*.jsonnet=38;5;178:*.jsp=38;5;074;1:*.kak=38;5;172:*.key=38;5;166:*.lagda=38;5;81:*.lagda.md=38;5;81:*.lagda.rst=38;5;81:*.lagda.tex=38;5;81:*.last-run=1:*.less=38;5;125;1:*.lhs=38;5;81:*.libsonnet=38;5;142:*.lisp=38;5;81:*.lnk=38;5;39:*.localized=38;5;239:*.localstorage=38;5;60:*.log=38;5;190:*.lua=38;5;81:*.m=38;5;110:*.m2v=38;5;114:*.m3u=38;5;116:*.m3u8=38;5;116:*.m4=38;5;242:*.m4a=38;5;137;1:*.m4v=38;5;114:*.map=38;5;7:*.markdown=38;5;184:*.md=38;5;184:*.md5=38;5;116:*.mdb=38;5;60:*.mde=38;5;60:*.mdump=38;5;241:*.merged-ca-bundle=1:*.mf=38;5;7:*.mfasl=38;5;7:*.mht=38;5;125;1:*.mi=38;5;7:*.mid=38;5;136;1:*.midi=38;5;136;1:*.mjs=38;5;074;1:*.mkd=38;5;184:*.mkv=38;5;114:*.mm=38;5;7:*.mobi=38;5;141:*.mod=38;5;137;1:*.moon=38;5;81:*.mount=38;5;45:*.mov=38;5;114:*.mp3=38;5;137;1:*.mp4=38;5;114:*.mp4a=38;5;137;1:*.mpeg=38;5;114:*.mpg=38;5;114:*.msg=38;5;178:*.msql=38;5;222:*.mtx=38;5;7:*.mustache=38;5;125;1:*.mysql=38;5;222:*.nc=38;5;60:*.ndjson=38;5;178:*.nds=38;5;213:*.nes=38;5;213:*.nfo=38;5;184:*.nib=38;5;57:*.nim=38;5;81:*.nimble=38;5;81:*.nix=38;5;155:*.nrg=38;5;124:*.nth=38;5;97:*.numbers=38;5;112:*.o=38;5;241:*.odb=38;5;111:*.odp=38;5;166:*.ods=38;5;112:*.odt=38;5;111:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.ogm=38;5;114:*.ogv=38;5;115:*.old=38;5;242:*.opus=38;5;137;1:*.org=38;5;184:*.orig=38;5;241:*.otf=38;5;66:*.out=38;5;242:*.p12=38;5;192;3:*.p7s=38;5;192;3:*.pacnew=38;5;33:*.pages=38;5;111:*.pak=38;5;215:*.part=38;5;239:*.patch=48;5;197;38;5;232;1:*.path=38;5;45:*.pbxproj=1:*.pc=38;5;7:*.pcap=38;5;29:*.pcb=38;5;7:*.pcf=1:*.pcm=38;5;136;1:*.pdf=38;5;141:*.pem=38;5;192;3:*.pfa=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.pgn=38;5;178:*.pgp=38;5;192;3:*.pgsql=38;5;222:*.php=38;5;81:*.pi=38;5;7:*.pid=38;5;248:*.pk3=38;5;215:*.pl=38;5;208:*.plist=1:*.plt=38;5;7:*.ply=38;5;216:*.pm=38;5;203:*.png=38;5;97:*.pod=38;5;184:*.pot=38;5;7:*.pps=38;5;166:*.ppt=38;5;166:*.ppts=38;5;166:*.pptsm=38;5;166;4:*.pptx=38;5;166:*.pptxm=38;5;166;4:*.profile=1:*.properties=38;5;116:*.ps=38;5;99:*.psd=38;5;97:*.psf=1:*.pxd=38;5;97:*.pxm=38;5;97:*.py=38;5;41:*.pyc=38;5;240:*.qcow=38;5;124:*.r=38;5;49:*.r[0-9]{0,2}=38;5;239:*.rake=38;5;155:*.rb=38;5;41:*.rdata=38;5;178:*.rdf=38;5;7:*.rkt=38;5;81:*.rlib=38;5;241:*.rmvb=38;5;114:*.rnc=38;5;178:*.rng=38;5;178:*.rom=38;5;213:*.rpm=38;5;215:*.rs=38;5;81:*.rss=38;5;178:*.rst=38;5;184:*.rstheme=1:*.rtf=38;5;111:*.ru=38;5;7:*.s=38;5;110:*.s3m=38;5;137;1:*.sample=38;5;114:*.sass=38;5;125;1:*.sassc=38;5;244:*.sav=38;5;213:*.sc=38;5;41:*.scala=38;5;41:*.scan=38;5;242:*.sch=38;5;7:*.scm=38;5;7:*.scpt=38;5;219:*.scss=38;5;125;1:*.sed=38;5;172:*.service=38;5;45:*.sfv=38;5;116:*.sgml=38;5;178:*.sh=38;5;172:*.sid=38;5;137;1:*.sig=38;5;192;3:*.signature=38;5;192;3:*.sis=38;5;7:*.sms=38;5;213:*.snapshot=38;5;45:*.socket=38;5;45:*.sparseimage=38;5;124:*.spl=38;5;7:*.sql=38;5;222:*.sqlite=38;5;60:*.srt=38;5;117:*.ssa=38;5;117:*.st=38;5;213:*.stackdump=38;5;241:*.state=38;5;248:*.stderr=38;5;160;1:*.stl=38;5;216:*.storyboard=38;5;196:*.strings=1:*.sty=38;5;7:*.sub=38;5;117:*.sublime-build=1:*.sublime-commands=1:*.sublime-keymap=1:*.sublime-project=1:*.sublime-settings=1:*.sublime-snippet=1:*.sublime-workspace=1:*.sug=38;5;7:*.sup=38;5;117:*.svg=38;5;99:*.swap=38;5;45:*.swift=38;5;219:*.swo=38;5;244:*.swp=38;5;244:*.sx=38;5;81:*.t=38;5;114:*.target=38;5;45:*.tcc=38;5;110:*.tcl=38;5;64;1:*.tdy=38;5;7:*.tex=38;5;184:*.textile=38;5;184:*.tf=38;5;168:*.tfm=38;5;7:*.tfnt=38;5;7:*.tfstate=38;5;168:*.tfvars=38;5;168:*.tg=38;5;7:*.theme=38;5;116:*.tif=38;5;97:*.tiff=38;5;97:*.timer=38;5;45:*.tmTheme=1:*.tmp=38;5;244:*.toast=38;5;124:*.toml=38;5;178:*.torrent=38;5;116:*.ts=38;5;115:*.tsv=38;5;78:*.ttf=38;5;66:*.twig=38;5;81:*.txt=38;5;253:*.typelib=38;5;60:*.un~=38;5;241:*.urlview=38;5;116:*.user-ca-bundle=1:*.v=38;5;81:*.vala=38;5;81:*.vapi=38;5;81:*.vb=38;5;81:*.vba=38;5;81:*.vbs=38;5;81:*.vcard=38;5;7:*.vcd=38;5;124:*.vcf=38;5;7:*.vdf=38;5;215:*.vdi=38;5;124:*.vfd=38;5;124:*.vhd=38;5;124:*.vhdx=38;5;124:*.vim=38;5;172:*.viminfo=1:*.vmdk=38;5;124:*.vob=38;5;115;1:*.vpk=38;5;215:*.vtt=38;5;117:*.war=38;5;215:*.wav=38;5;136;1:*.webloc=38;5;116:*.webm=38;5;115:*.webp=38;5;97:*.wma=38;5;137;1:*.wmv=38;5;114:*.woff=38;5;66:*.woff2=38;5;66:*.wrl=38;5;216:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.xcconfig=1:*.xcf=38;5;7:*.xcsettings=1:*.xcuserstate=1:*.xcworkspacedata=1:*.xib=38;5;208:*.xla=38;5;76:*.xln=38;5;7:*.xls=38;5;112:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.xml=38;5;178:*.xpi=38;5;215:*.xpm=38;5;97:*.xsd=38;5;178:*.xsh=38;5;41:*.yaml=38;5;178:*.yml=38;5;178:*.z[0-9]{0,2}=38;5;239:*.zcompdump=38;5;241:*.zig=38;5;81:*.zlogin=1:*.zlogout=1:*.zprofile=1:*.zsh=38;5;172:*.zshenv=1:*.zwc=38;5;241:*.zx[0-9]{0,2}=38;5;239:bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;30:do=38;5;127:ex=38;5;208;1:pi=38;5;126:fi=0:ln=target:mh=38;5;222;1:no=0:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;3;38;5;0:su=38;5;220;1;3;100;1:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3'
export PKG_MANAGER=pnpm
# bun
export BUN_INSTALL="$HOME/.bun"
# dotnet
DOTNET_CLI_TELEMETRY_OPTOUT=1
# path
export PATH="$BUN_INSTALL/bin:$PATH"
export PNPM_HOME="/Users/danilo/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PATH:$PNPM_HOME" ;;
esac
export PATH=$PATH:$DOTFILES/scripts
export PATH=$PATH:$HOME/.nvim/bin
export PATH=$PATH:~/.yarn/bin
# export PATH=$PATH:/Users/danilo/.asdf/installs/rust/stable/bin
export PATH=$PATH:/Users/danilo/Library/Python/3.8/bin
export PATH=$PATH:/Users/danilo/.cargo/bin
export PATH=$PATH:/Users/danilo/.local/bin
# export PATH=$PATH:/Users/danilo/.dotnet/tools
export PATH=$PATH:$HOME/.asdf/shims/dotnet
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

# history in cache directory
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# some zsh options
setopt autocd extendedglob nomatch notify

# auto/tab complete
autoload -U compinit;
zstyle ':completion:*' menu select;
# zstyle :compinstall filename "$HOME/.zshrc";
zmodload zsh/complist;
compinit;

# vi mode
bindkey -v 
export KEYTIMEOUT=1

bindkey -M menuselect 'j' vi-backward-char
bindkey -M menuselect 'k' vi-down-line-or-history
bindkey -M menuselect 'l' vi-up-line-or-history
bindkey -M menuselect ';' vi-forward-char

bindkey -M vicmd 'j' vi-backward-char
bindkey -M vicmd 'k' down-line-or-history
bindkey -M vicmd 'l' up-line-or-history
bindkey -M vicmd ';' vi-forward-char

bindkey -M visual 'j' vi-backward-char
bindkey -M visual ';' vi-forward-char

bindkey '^r' history-incremental-search-backward

# asdf completions
fpath=(${ASDF_DIR}/completions $fpath)

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
alias zshconfig="$EDITOR ~/.zshrc"
alias vimconfig="$EDITOR ~/.config/nvim/lua/user/init.lua"
alias gitconfig="$EDITOR ~/.gitconfig"
alias i3config="$EDITOR ~/.config/i3/config"
alias rangerconfig="$EDITOR ~/.config/ranger/rc.conf"
alias tmuxconfig="$EDITOR ~/.tmux.conf"
alias lazygitconfig="$EDITOR ~/.config/lazygit/config.yml"

# utils
alias rm=trash
alias rmnm="trash ./node_modules"
alias ll="eza -l --header --icons --group-directories-first"
alias la="ll --all"
alias ld="ll --only-dirs"
function lt {
  ll --tree --level=2 $1 $2
}

# sudo
alias sudoe="sudo env 'PATH=$PATH'"

# android
alias avd-ls='avdmanager list avd'
alias emulator-pixel-3='emulator -avd Pixel_3a_API_30_x86 -netdelay none -no-snapshot -wipe-data &'
alias emulator-galaxy-nexus='emulator -avd Galaxy_Nexus_API_30_1 -netdelay none -no-snapshot -wipe-data &'

# apt-get
alias sai="sudo apt install"
alias sap="sudo apt purge"
alias saar="sudo apt autoremove"
alias saud="sudo apt update"
alias saug="sudo apt upgrade"

# aws
alias aws-cf-invalidate='aws cloudfront create-invalidation --distribution-id DIST_ID --paths "/*"'

# brew
alias buzap="brew uninstall --zap" # uninstall package/cask and remove all settings from system
alias bcu="brew cleanup" # Remove stale lock files and outdated downloads for all formulae and casks, and remove old versions of installed formulae. If arguments are specified, only do this for the given formulae and casks. Removes all downloads more than 120 days old. This can be adjusted with HOMEBREW_CLEANUP_MAX_AGE_DAYS
alias bar="brew autoremove" # Uninstall formulae that were only installed as a dependency of another formula and are now no longer needed

# docker
alias dcls='docker container list --format "table {{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"'
alias dclsp='docker container list --format "table {{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}"'
alias dclsa='docker container list --all --format "table {{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"'
alias dcstart='docker container start'
alias dcstop='docker container stop'
alias dcrestart='docker container restart'
alias dclogs='docker container logs -f'
alias diqall="docker images -q | % { docker rmi $_ }"
alias drm='docker rm'
alias dexecit='docker exec -it'
alias dvls='docker volume ls'
alias dvrm='docker volume rm'
alias dlogs='docker logs'
alias dclearlogs='sudo sh -c "truncate -s 0 /var/lib/docker/containers/*/*-json.log"'
alias dsp='docker system prune'
alias dbuild='docker build -t NAME:TAG .'

# dotnet
alias dn-info='dotnet --info'
alias dn-new='dotnet new -h' # template instantiation commands
alias dn-newls='dotnet new list' # list project templates: solution, webapi, class lib, gitignore, editorconfig
alias dn-newsln='dotnet new sln -h' # create an empty solution containing no projects
# alias dn-newclasslib='dotnet new classlib -n ClassLibProject' 
# alias dn-newwebapi='dotnet new webapi -n WebApiProject' 
alias db-sln='dotnet sln -h' # modify solution files
alias dn-slnls='dotnet sln list' # list all projects in a solution file
alias dn-slnadd='dotnet sln add -h' # add one or more projects to a solution file
alias dn-addref='dotnet add reference -h' # add a project-to-project reference to the project
alias dn-addpkg='dotnet add package -h' # add a nuget package reference to the project
alias dn-build='dotnet build' # It'll build on current folder or you can specify a project 'dn-build ./SomeProject'
alias dn-clean='dotnet build --no-incremental' # Marks the build as unsafe for incremental build. This flag turns off incremental compilation and forces a clean rebuild of the project's dependency graph. 'dn-clean'
alias dn-run='dotnet run --urls=http://localhost:9000 --project' # example 'dn-run ./SomeProject'

# git
alias gs="git st"
alias gdiff="git dc"
alias gstashsup="git stash show -u -p"
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
alias gfp="git fetch -p"
alias glast="git last"
alias ghist="git hist"
alias gparent='git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//"'
alias gfo='git fetch origin'
alias gruop='git remote update origin --prune'

# lazygit
alias lg='lazygit'
alias lgf='lazygit -f' # git history of a file. Example: lgf .prettierrc

# node package manager
alias ni="$PKG_MANAGER install"
alias nr="$PKG_MANAGER run"
alias ns="$PKG_MANAGER run start"
alias nrb="$PKG_MANAGER run build"
alias nrd="$PKG_MANAGER run dev"
alias nrl="$PKG_MANAGER run lint"
alias nrt="$PKG_MANAGER run test"

if [[ "$PKG_MANAGER" == "npm" ]]; then
  alias na="$PKG_MANAGER install -E -S"
  alias nad="$PKG_MANAGER install -E -D"
  alias nu="$PKG_MANAGER uninstall"
fi

if [[ "$PKG_MANAGER" == "pnpm" ]]; then
  alias na="$PKG_MANAGER add -E"
  alias nad="$PKG_MANAGER add -E -D"
  alias nu="$PKG_MANAGER rm"
fi

# pacman
alias pms="sudo pacman -S --needed"
alias pmr="sudo pacman -Rns"
alias pmu="sudo pacman -Syu"
alias pmq="pacman -Qs"

# vim
alias v="$EDITOR"

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

# =============================================================================
# === SCRIPTS
# =============================================================================

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f $BREW/etc/profile.d/z.sh ]] || source $BREW/etc/profile.d/z.sh
[[ ! -f ~/.asdf/asdf.sh ]] || source $HOME/.asdf/asdf.sh
[[ ! -f $BREW/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme ]] || source $BREW/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f $DOTFILES/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] || source $DOTFILES/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ ! -f $DOTFILES/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]] || source $DOTFILES/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
[[ ! -f $DOTFILES/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] || source $DOTFILES/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ ! -f $BREW/opt/asdf/libexec/asdf.sh ]] || source $BREW/opt/asdf/libexec/asdf.sh 
# bun completions
[ -s "/Users/danilo/.bun/_bun" ] && source "/Users/danilo/.bun/_bun"
