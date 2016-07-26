runtime! debian.vim

" start vundler
set nocompatible              
filetype off                 
set rtp+=~/.vim/bundle/Vundle.vim

" vundler plugin wrapper
call vundle#begin()

" core plugin
Plugin 'VundleVim/Vundle.vim'

" main plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()           
filetype plugin indent on  

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

"""""""""""""""""""""""""""""
"
" SETTINGS
"
"""""""""""""""""""""""""""""

set tabstop=4           " Show existing tab with 4 spaces width
set shiftwidth=4        " When indenting with '>', use 4 spaces width
set expandtab           " On pressing tab, insert 4 spaces
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
"set autowrite          " Automatically save before commands like :next and :make
set autoread            " Automatically refresh any unchanged files
set hidden              " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes)
set showmatch
set relativenumber
set number
set laststatus=2

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

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

if has("syntax")
  syntax on
endif

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"""""""""""""""""""""""""""""
"
" KEYBIDINGS
"
"""""""""""""""""""""""""""""

map <F12> :NERDTreeToggle<CR>

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
