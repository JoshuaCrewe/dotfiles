call plug#begin('~/.vim/plugged')
" Base
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'ggreer/the_silver_searcher'
Plug 'ervandew/supertab'
Plug 'haya14busa/incsearch.vim'
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
PLug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
" GUI
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/hexHighlight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-emoji'
" Syntax
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
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
 "hi Comment guifg=25 guibg=NONE gui=NONE

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

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

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

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
 set wildmode=list:longest,list:full
 set complete=.,w,t
 function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
 endfunction
 

" CtrlP
 noremap <C-b> :CtrlPBuffer<cr>
 noremap <C-m> :CtrlPMRU<cr>
 set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
 set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
 let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
 let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': [],
            \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
            \ }

" Emmet
 imap <D-Enter> <C-y>,

" Colon
 noremap ; :

" Search
 set ignorecase
 set incsearch
 set hlsearch

" Save
 nnoremap <C-s> :w<cr>

" Mappings
 let mapleader = ' '
 nnoremap <leader>zsh :silent :tabedit ~/.zshrc<cr>
 nnoremap <up> ddkP
 nnoremap <down> ddp
 nnoremap § %

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

" bind K to grep word under cursor
 nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
 command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

 nnoremap \ :Ag<SPACE>

" NerdTree
 nnoremap <leader>tf :silent NERDTreeFind<cr>
 nnoremap <C-t> :silent NERDTreeToggle<cr>

" Startify
 "let g:startify_list_order = [ 'files' ]
 let g:startify_list_order = [
            \ ['    MRU : '],
            \ 'files',
            \ ['    MRU (dir) : '],
            \ 'dir',
            \ ['    Sessions :'],
            \ 'sessions',
            \ ['    Bookmarks :'],
            \ 'bookmarks',
            \ ]

    function! s:filter_header(lines) abort
        let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
        let centered_lines = map(copy(a:lines),
            \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
        return centered_lines
    endfunction
    
    "let g:startify_custom_header = s:filter_header(['a', 'bb', 'ccc'])
    let g:startify_custom_header = s:filter_header([
            \ '                                 ________  __ __        ',
            \ '            __                  /\_____  \/\ \\ \       ',
            \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
            \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
            \ '',
            \ '',
            \ ])

" Buffers
nmap ˙ :silent :tabp<cr>
nmap ¬ :silent :tabn<cr>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <silent> <C-q> :bd<cr>

" Colorizer
:let g:colorizer_auto_color = 1

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
