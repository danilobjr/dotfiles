" ======================================================================
" =                   install plugins on first run                     =
" ======================================================================

" if empty(glob('~/.config/nvim/plugged'))
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
" "  autocmd VimEnter * CocInstall coc-snippets coc-pairs coc-tsserver
" "    \ coc-eslint coc-prettier coc-json coc-reason coc-fsharp coc-emmet
" endif

" ======================================================================
" =                             plugins                                =
" ======================================================================

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ======================================================================
" =                          color scheme                              =
" ======================================================================

colorscheme nord

" ======================================================================
" =                          base settings                             =
" ======================================================================

" TextEdit might fail if hidden is not set
set hidden
set number            " show line numbers
set relativenumber    " show line numbers relative to the current line
set inccommand=split  " substitute show all references in another panel
"set cmdheight=2       " Give more space for displaying messages.
set shortmess+=c      " Don't pass messages to |ins-completion-menu|.
"set laststatus=2      " Show more info in status bar
set noshowmode        " Hide mode display at the very bottom (lightline already shows one)
set splitbelow        " Open new window below when run :split
set splitright        " Open new window on the right when run :vsplit
set nowrap            " Do not wrap lines
set ignorecase        " Case insensitive on search

" ======================================================================
" =                             leader                                 =
" ======================================================================

let mapleader="\<space>"

" ======================================================================
" =                           custom maps                              =
" ======================================================================

" neovim config file
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" cursor navigation
nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ; l

vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ; l

onoremap j h
onoremap k j
onoremap l k
onoremap ; l

" window navigation
noremap <a-j> <c-w>h
noremap <a-k> <c-w>j
noremap <a-l> <c-w>k
noremap <a-;> <c-w>l

" replace
nnoremap <F3> :%s/<c-r><c-w>//g<left><left>

" toggle search highlight
nnoremap <F5> :set hlsearch!<cr>

" common commands
nnoremap <leader>ww :w<cr>
nnoremap <leader>wa :wa<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>on :on<cr>

" insert semicolon at end of line
nnoremap <leader>; A;<esc>

" git
nnoremap <leader>gs :vertical rightbelow G<cr>
nnoremap <leader>gc :vertical rightbelow Gcommit<cr>
nnoremap <leader>gd :vertical rightbelow Git dc<cr>
nnoremap <leader>gj :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>

" netrw
nnoremap <F4> :Vex<cr>

" ======================================================================
" =                               ntrw                                 =
" ======================================================================

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_localrmdir = 'rm -r'

" ======================================================================
" =                           autocommands                             =
" ======================================================================

" javascript comment
autocmd FileType javascript nnoremap <buffer> <leader>/ :0i//<esc>
autocmd FileType javascript vnoremap <buffer> <leader>/ :normal 0i//<esc>

" comment highlight at jsonc files
autocmd FileType json syntax match Comment +\/\/.\+$+

" ======================================================================
" =                         plugins specific                           =
" ======================================================================

" ----------------------------------------------------------------------
" -                               coc                                  -
" ----------------------------------------------------------------------

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f :CocCommand prettier.formatFile<cr>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ----------------------------------------------------------------------
" -                               fzf                                  -
" ----------------------------------------------------------------------

nnoremap <C-p>   :Files<CR>
nnoremap <C-A-p> :GFiles<CR>
nnoremap <C-f>   :Ag<space>

" ----------------------------------------------------------------------
" -                            lightline                               -
" ----------------------------------------------------------------------

let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['gitbranch', 'readonly', 'filename', 'modified']
  \   ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ }

" ----------------------------------------------------------------------
" -                         vim-reason-plus                            -
" ----------------------------------------------------------------------

"let g:LanguageClient_serverCommands = {
"    \ 'reason': ['/home/danilo/.config/nvim/plugged/vim-reason-plus/reason-language-server']
"    \ }
