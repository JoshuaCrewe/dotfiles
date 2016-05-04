call plug#begin('~/.vim/plugged')
" Base
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-vinegar'
" Automation
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter' " This is th next one to go
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'chip/vim-fat-finger'
Plug 'vim-scripts/camelcasemotion'
Plug 'vim-scripts/loremipsum'
Plug 'simeji/winresizer'
" GUI
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/limelight.vim' " Possibly this one also
Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'
" Syntax
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-ragtag'
Plug 'othree/html5.vim'
" Wordpress
Plug 'sudar/vim-wordpress-snippets'
Plug 'dsawardekar/wordpress.vim'
" Sessions
Plug 'tpope/vim-obsession'
" Testing Plugins
Plug 'junegunn/vim-after-object'
Plug 'phongvcao/vim-stardict'
Plug 'duff/vim-scratch'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'jasonlong/vim-textobj-css'
Plug 'sjl/gundo.vim'
Plug 'aaronbieber/vim-quicktask'
" Documentation look up
Plug 'rhysd/devdocs.vim'
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
let g:seoul256_background = 237
colo seoul256
set background=dark

set linespace=5
set number
set rnu
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=e
set nowrap
set showtabline=0
set scrolloff=5
set splitright
set splitbelow
set formatoptions-=or " Prevent automatic comment prefixing"

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

" Remember last cursor position
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
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

" make markdown more readable
au BufRead,BufNewFile *.md set wrap linebreak | :Goyo 100

" Emmet
imap <C-k> <C-y>,

" Better Clipboard pasting
nmap <Leader>P :set paste<CR>o<esc>"+]p:set nopaste<cr>

" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode?utm_content=buffer73792&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Search
set ignorecase
set incsearch
set hlsearch

" Note that remapping C-s requires flow control to be disabled
" " (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

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

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"reindent
nmap <leader>= gg=G``

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

" Choose the tree view when using netrw
let g:netrw_liststyle=3
" pressing q in netrw will close the file explorer
autocmd FileType netrw noremap q :bp\|bd #<CR>

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


" Toggle distraction free viewing with Goyo
nmap <leader>gy :Goyo<cr>

function! GoyoBefore()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! GoyoAfter()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

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

" FZF
nnoremap <cr> :Files<cr>
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>`        :Marks<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

command! Plugs call fzf#run({
      \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
      \ 'options': '--delimiter / --nth -1',
      \ 'down':    '~20%',
      \ 'sink':    'Explore'})

" Syntastic linters
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['jshint']

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

function! ToggleHomeZero()
  let pos = getpos('.')
  execute "normal! ^"
  if pos == getpos('.')
    execute "normal! 0"
  endif
endfunction

nnoremap 0 :call ToggleHomeZero()<CR>

nmap <leader>gu :GundoToggle<cr>
nnoremap <leader>syn :SyntasticToggleMode<cr>

"highlight ColorColumn ctermbg=blue
"call matchadd('ColorColumn', '\%81v', 100)


inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O
"
"command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
