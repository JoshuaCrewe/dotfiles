call plug#begin('~/.vim/plugged')
" Base
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ggreer/the_silver_searcher'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
" Automation
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/AutoClose'
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
Plug 'junegunn/vim-xmark', { 'do': 'make' }
call plug#end()

   "   _   ________  ______  _____
   "  | | / /  _/  |/  / _ \/ ___/
   "  | |/ // // /|_/ / , _/ /__  
   "  |___/___/_/  /_/_/|_|\___/  
   "                              

" Defaults
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
 set undofile

" GUI
 let g:seoul256_background = 236
 colo seoul256
 set background=dark

 set guifont=Menlo:h12
 set linespace=2
 set number
 set guioptions-=r  "remove right-hand scroll bar
 set guioptions-=L  "remove left-hand scroll bar
 set iskeyword+=\-  "autocomplete does not break at dashes
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

" Emmet
 imap <D-Enter> <C-y>,

" Better Clipboard pasting
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" Colon
 "noremap ; :

" Search
 set ignorecase
 set incsearch
 set hlsearch

" Save
 nnoremap <C-s> :w<cr>
 nnoremap <C-q> :q<cr>

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

" VIMRC
 nnoremap <leader>vim :silent :tabedit ~/.vimrc<cr>
 autocmd! bufwritepost .virmc source %

" Treat <li> and <p> tags like the block tags they are
 let g:html_indent_tags = 'li\|p'

" Plug
 nnoremap <leader>plug :silent PlugClean \| PlugUpdate \| PlugInstall \| q<cr>

 " The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
 endif

" NerdTree
 nnoremap <leader>tf :silent NERDTreeFind<cr>
 nnoremap <C-t> :silent NERDTreeToggle<cr>

" Buffers
nmap <silent> [b :bprevious<cr>
nmap <silent> ]b :bnext<cr>
nmap <silent> [B :bfirst<cr>
nmap <silent> ]B :blast<cr>

"nmap ˙ :silent :tabp<cr>
"nmap ¬ :silent :tabn<cr>
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

" Php
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

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

"let g:fzf_launcher = "In_a_new_term_function %s"
