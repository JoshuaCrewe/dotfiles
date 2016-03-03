call plug#begin('~/.vim/plugged')
" Base
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'christoomey/vim-tmux-navigator'
" Automation
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sudar/vim-wordpress-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'chip/vim-fat-finger'
" GUI
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
Plug 'othree/html5.vim'
" Testing Plugins
Plug 'junegunn/vim-easy-align' 
Plug 'junegunn/vim-after-object'
Plug 'phongvcao/vim-stardict'
Plug 'vim-scripts/loremipsum'
Plug 'blindFS/vim-taskwarrior'
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

" Syntax highlighting man pages
runtime! ftplugin/man.vim

" GUI
let g:seoul256_background = 236
colo seoul256
set background=dark

set guifont=Inout:h13
set linespace=5
set number
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=e
set nowrap
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

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

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
noremap <C-m> :CtrlPMRU<cr>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist\|plugins\|languages'
"let g:ctrlp_prompt_mappings = {
      "\ 'AcceptSelection("e")': [],
      "\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
      "\ }

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
nmap <right> :cnext<cr>
nmap <left> :cprev<cr>
nnoremap § %
nmap j gj
nmap k gk
imap jk <Esc>
imap <c-f> <c-x><c-f>
nmap <leader><leader> <c-^>

"reindent
nmap <leader>= mqggvG$=`q

" VIMRC
nnoremap <leader>vim :silent :edit ~/.vimrc<cr>
autocmd! bufwritepost .virmc source %

" TMUX conf
nmap <leader>tmux :silent :edit ~/.tmux.conf<cr>

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Plug
nnoremap <leader>plug :silent PlugClean \| PlugUpdate \| PlugInstall \| q<cr>

" NerdTree
nnoremap <leader>tf :silent NERDTreeFind<cr>
nnoremap <C-t> :silent NERDTreeToggle<cr>

nmap <silent> <C-q> :bd<cr>

" Show highlighting groups for current word <space>syn
nmap <Leader>syn :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

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

nmap <leader>r :source %<cr>

" Put at the very end of your .vimrc file.

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END


" FZF mappings
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <leader>f :Files<cr>
nmap <cr> :Files<cr>
noremap <C-b> :Buffers<cr>

" Make vim-stardict split open in a :split (default value)
let g:stardict_split_horizontal = 1

" Set vim-stardict split width (or height) to 20 based on whether
" vim-stardict split is a :vsplit (or :split)
let g:stardict_split_size = 20

" Map vim-stardict's commands
" Ready for typing the word in
nnoremap <leader>sw :StarDict<Space>
" Lookup the word under cursor
nnoremap <leader>sc :StarDictCursor<CR>


imap lorem <esc>:Loremipsum 

" Seen in Steve Losh's .vimrc for sorting css/sass alphabetically
au BufNewFile,BufRead *.scss,*.css nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

"Fugitive
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
