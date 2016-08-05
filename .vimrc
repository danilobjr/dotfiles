runtime! debian.vim

" start vundler
set nocompatible              
filetype off                 
set rtp+=~/.vim/bundle/Vundle.vim

" vundler plugin wrapper
call vundle#begin()

" core plugin
Plugin 'VundleVim/Vundle.vim' " plugin manager

" main plugins
Plugin 'vim-airline/vim-airline' " fancy statusbar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim' " apply same vim-airline theme of vim on tmux statusbar
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file finder
Plugin 'scrooloose/nerdtree' " project drawer / file explorer
Plugin 'jiangmiao/auto-pairs' " auto close for \", (, {, [ 
Plugin 'Valloric/YouCompleteMe' " auto completion
Plugin 'tpope/vim-fugitive' " awesome git commands
Plugin 'airblade/vim-gitgutter' " show git changes aside line numbers
Plugin 'vim-scripts/matchit.zip' " jumps to matching close tags in html and other languages
Plugin 'SirVer/ultisnips' " ultimate solution for snippets

" language specific
" Plugin 'pangloss/vim-javascript' " javascript syntax
Plugin 'othree/yajs.vim' " javascript syntax
Plugin 'leafgarland/typescript-vim' " typescript syntax
" Plugin 'othree/html5.vim' " html5 syntax
Plugin 'mattn/emmet-vim' " expand abbreviations for html/css

call vundle#end()           
filetype plugin indent on  

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

"""""""""""""""""""""""""""""
" SETTINGS & KEYBINDINGS
"""""""""""""""""""""""""""""

set tabstop=4           " Show existing tab with 4 spaces width
set shiftwidth=4        " When indenting with '>', use 4 spaces width
set expandtab           " On pressing tab, insert 4 spaces
set showcmd             " Show (partial) command in status line.
"set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
"set autowrite          " Automatically save before commands like :next and :make
set autoread            " Automatically refresh any unchanged files
set hidden              " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes)
set relativenumber      " relative line numbers to the current focused line
set number              " show line numbers
set laststatus=2        " show status bar

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" NERDTree
let NERDTreeHijackNetrw=1
map <F4> :NERDTreeToggle<CR>

" Colorscheme
"colorscheme Tomorrow-Night

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_expandabbr_key = '<Tab>'

" UltiSnips
" make vim recognizing snippets dir
set runtimepath+=~/.vim/my-snippets/
" use different snippets dir
let g:UltiSnipsSnippetsDir='~/.vim/my-snippets/'
let g:UltiSnipsSnippetDirectories=["my-snippets"]
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" YouCompleteMe
let g:ycm_key_list_select_completion=['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<Up>']

if has("syntax")
  syntax on
endif

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"""""""""""""""""""""""""""""
"
" BUG WORKAROUNDS
"
"""""""""""""""""""""""""""""

" vim mode-switch lag fix
if ! has("gui_running")
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
