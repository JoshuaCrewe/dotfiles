call plug#begin('~/.vim/plugged')
" Base
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
" Automation
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sudar/vim-wordpress-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
" GUI
Plug 'vim-scripts/hexHighlight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-emoji'
Plug 'ap/vim-css-color'
" Syntax
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-ragtag'
Plug 'dsawardekar/wordpress.vim'
Plug 'mustache/vim-mustache-handlebars'
" Testing Plugins
Plug 'junegunn/vim-easy-align' 
Plug 'junegunn/vim-after-object'
call plug#end()

   "   _   ________  ______  _____
   "  | | / /  _/  |/  / _ \/ ___/
   "  | |/ // // /|_/ / , _/ /__  
   "  |___/___/_/  /_/_/|_|\___/  
   "                              

" Defaults
 filetype plugin on 
 filetype indent on

 set nocompatible
 set modelines=0
 set encoding=utf-8
 set scrolloff=3
 set autoindent
 set smartindent
 set showmode
 set showcmd
 set hidden
 set wildmenu
 set wildmode=list:longest
 set visualbell
 set cursorline
 set ttyfast
 set ruler
 set backspace=indent,eol,start
 set laststatus=2

 :au FocusLost * silent! wa

" Enable built-in matchit plugin
 runtime macros/matchit.vim

" GUI
 let g:seoul256_background = 236
 colo seoul256
 set background=dark

 set guifont=Menlo:h12
 set linespace=5
 set number
 set guioptions-=r  "remove right-hand scroll bar
 set guioptions-=L  "remove left-hand scroll bar
 set guioptions-=e
 set wrap
 set showtabline=0
 set scrolloff=5
 set splitright
 set splitbelow

" Backups
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Swapfiles
" Turn them off rather than save them anywhere.
set noswapfile

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" TABS
 set expandtab
 set smarttab
 set tabstop=2
 set softtabstop=2
 set shiftwidth=2

" Snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Will include HTML Snippets in php files
au BufRead,BufNewFile *.php set ft=phtml

" CtrlP
 noremap <C-b> :CtrlPBuffer<cr>
 noremap <C-m> :CtrlPMRU<cr>
 set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
 set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
 let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist\|plugins\|languages'
 let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': [],
            \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
            \ }

 let g:ctrlp_working_path_mode = 'ra'
" Emmet
 imap <C-k> <C-y>,

" Better Clipboard pasting
nmap <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" Search
 set ignorecase
 set incsearch
 set hlsearch

" Note that remapping C-s requires flow control to be disabled
" " (e.g. in .bashrc or .zshrc)
  map <C-s> <esc>:w<CR>
  imap <C-s> <esc>:w<CR>
  map <C-x> <C-w>c

" Mappings
 let mapleader = ' '
 nnoremap <leader>zsh :silent :tabedit ~/.zshrc<cr>
 nnoremap <up> ddkP
 nnoremap <down> ddp
 nnoremap § %
 nmap j gj
 nmap k gk
 imap jk <Esc>
 imap <c-f> <c-x><c-f>
 nmap <leader><leader> <c-^>

" VIMRC
 nnoremap <leader>vim :silent :tabedit ~/.vimrc<cr>
 autocmd! bufwritepost .virmc source %

" Treat <li> and <p> tags like the block tags they are
 let g:html_indent_tags = 'li\|p'

" Plug
 nnoremap <leader>plug :silent PlugClean \| PlugUpdate \| PlugInstall \| q<cr>

" NerdTree
 nnoremap <leader>tf :silent NERDTreeFind<cr>
 nnoremap <C-t> :silent NERDTreeToggle<cr>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <silent> <C-q> :bd<cr>

" Show highlighting groups for current word <space>syn
nmap <Leader>syn :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Toggle the color highlighting visual
nmap <Leader>h :call HexHighlight()<Return>

" Limelight toggles
nmap <leader>ll :Limelight!!<cr>

" Emoji
function! s:replace_emojis() range
  for lnum in range(a:firstline, a:lastline)
    let line = getline(lnum)
    let subs = substitute(line,
          \ ':\([^:]\+\):', '\=emoji#for(submatch(1), submatch(0))', 'g')
    if line != subs
      call setline(lnum, subs)
    endif
  endfor
endfunction
command! -range EmojiReplace <line1>,<line2>call s:replace_emojis()
set completefunc=emoji#complete


" Toggle distraction free viewing with Goyo
  nmap <leader>gy :Goyo<cr>

" Treat all numerals as decimal
set nrformats=

nmap <leader>so :source<space>~/.vimrc<cr>

" Put at the very end of your .vimrc file.

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
