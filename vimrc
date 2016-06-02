"   _   ________  ______  _____
"  | | / /  _/  |/  / _ \/ ___/
"  | |/ // // /|_/ / , _/ /__  
"  |___/___/_/  /_/_/|_|\___/  
"                              

" PLUGINS

call plug#begin('~/.vim/plugged')
" Base
Plug 'tpope/vim-sensible'             " Some sensible deafaults
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'               " A fuzzyfinder
Plug 'christoomey/vim-tmux-navigator' " Better tmux and vim integration
" Automation
Plug 'tpope/vim-vinegar'              " Make Netrw easier to use
Plug 'tpope/vim-surround'             " Surrounding text motion
Plug 'tpope/vim-fugitive'             " A Git wrapper
Plug 'tpope/vim-unimpaired'           " Some extra shortcuts for useful tasks
Plug 'tpope/vim-ragtag'               " Some extra mappings
Plug 'tpope/vim-repeat'               " Dot command with plugins
Plug 'junegunn/vim-pseudocl'          " Pseudo command line
Plug 'junegunn/vim-oblique'           " For hiding highlights after searching
Plug 'mattn/emmet-vim'                " Code writing shorthand
Plug 'SirVer/ultisnips'               " Snippet expansion
Plug 'honza/vim-snippets'             " Snippets!
Plug 'tomtom/tcomment_vim'            " Commenting out stuff
Plug 'scrooloose/syntastic'           " Syntax checking
Plug 'junegunn/gv.vim'                " Requires fugitive - commit viewer
Plug 'chip/vim-fat-finger'            " Corrects some easily made typing mistakes
Plug 'vim-scripts/camelcasemotion'    " Treat cammel case as words
Plug 'vim-scripts/loremipsum'         " Lorem Ipsum generator
Plug 'simeji/winresizer'              " Easily resize windows with <c-e>
Plug 'phongvcao/vim-stardict'         " Lok up words in the dictionary
Plug 'tommcdo/vim-lion'               " align stuff according to marks
" Colour Schemes
Plug 'junegunn/seoul256.vim'          " A colour scheme which works
Plug 'chriskempson/base16-vim'        " Some colour schemes which don't always work
" GUI
Plug 'junegunn/goyo.vim'              " Distraction free coding
Plug 'junegunn/vim-peekaboo'          " Show the registers
Plug 'ap/vim-css-color'               " show colors in a highlight
Plug 'airblade/vim-gitgutter'         " Git marks in the gutter
Plug 'sjl/gundo.vim'                  " Undo tree visualisation
" Syntax
Plug 'cakebaker/scss-syntax.vim' 
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'othree/html5.vim'
Plug 'captbaritone/better-indent-support-for-php-with-html'
" Wordpress
Plug 'sudar/vim-wordpress-snippets'   " Wordpress snippets which I dont know
Plug 'dsawardekar/wordpress.vim'      " ??
" Sessions
Plug 'tpope/vim-obsession'            " For saving sessions
" Documentation look up
Plug 'rhysd/devdocs.vim'              " Look up things in DevDocs
Plug 'keith/investigate.vim'          " An alternative documentation lookup
" Wiki
Plug 'vimwiki/vimwiki'
call plug#end()

filetype plugin on 
filetype indent on                " Turn on indentation by filetype
runtime macros/matchit.vim        " Enable built-in matchit plugin
runtime! ftplugin/man.vim         " Syntax highlighting man pages

" General

set nocompatible                  " Disable Vi compatibility
set nomodeline                    " Modelines have been a source of vulnerabilities.
set encoding=utf-8                " utf-8 for character encoding
set scrolloff=5                   " Keep a context (rows) when scrolling vertically
set autoindent                    " Indent a new line according to the previous one
set showmode                      " Show the current mode
set showcmd                       " Show (partial) command in the status line.
set hidden                        " Allow switching edited buffers without saving
set noerrorbells visualbell t_vb= " No error bells
set cursorline                    " Show which line the cursor is on
set ttyfast                       " Improves redrawing for new computers
set ruler                         " Show line and column number
set backspace=indent,eol,start    " Allow backspacing over everything in insert mode 
set laststatus=2                  " Always show the status line
set nrformats-=octal              " Make incrementing 007 result into 008 rather than 010.
set wildmenu                     " Make use of tab completion in vim command line
set wildmode=list:full           " Complete longest common string, then each full match

" Colour Scheme

"set termguicolors                " Use all the colours! New for vim 7.4 + tmux 2.2 and iTerm
set t_Co=256                      " Set colours to 256
set background=dark               " Use a dark background

let g:seoul256_background = 237   " Seoul can tweak the background a bit
colo seoul256                     " Set the colour scheme

" Numbering

set number                        " Show line number
set rnu                           " Use relative line numbering
set nowrap                        " Long lines will keep going off screen
set showtabline=0                 " Never show tabline

" Macvim

set guioptions-=r                 " Remove right-hand scroll bar
set guioptions-=L                 " Remove left-hand scroll bar

" Formatting

set fo+=q                         " Allow formatting of comments with "gq".
set fo-=r fo-=o                   " Turn off automatic insertion of comment characters.
set fo+=j                         " Remove a comment leader when joining comment lines.

" Splitting.

set splitright                    " Open new vertical panes in the right rather than left.
set splitbelow                    " Open new horizontal panes in the bottom rather than top.


" Meta

set nobackup                      " Disable backup files.
set noswapfile                    " Disable swap files.
set nowritebackup                 " Disable auto backup before overwriting a file.
set viminfo+=n~/.vim/viminfo      " viminfo stores the the state of your previous editing session

" Remember last cursor position

augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

" undofile - This allows you to use undos after exiting and restarting

if exists("+undofile")
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
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.


" File Specific

au BufRead,BufNewFile *.php set ft=phtml " Will include HTML Snippets in php files
au BufRead,BufNewFile *.md set wrap linebreak | :Goyo 100 " make markdown more readable
au BufRead,BufNewFile *.wiki set wrap linebreak | :Goyo 100 " make markdown more readable

" Emmet

imap <C-k> <C-y>,

" Insert the contents of the clipboard.
nnoremap <silent> <Leader>P :set paste<CR>"+]P:set nopaste<CR>
nnoremap <silent> <Leader>p :set paste<CR>"+]p:set nopaste<CR>
vnoremap          <Leader>p "+p

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

" Searching.
set hlsearch            " Highlight search matches.
set incsearch           " Incremental search.
" Case-smart searching (make /-style searches case-sensitive only if there is
" a capital letter in the search expression).
set ignorecase
set smartcase

" Note that remapping C-s requires flow control to be disabled
" " (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Mappings
let mapleader = ' ' " Set space to be the leader

" Move lines up and down with arrow keys
nnoremap <up> ddkP
nnoremap <down> ddp

" Move between helpgrep search results with arrows 
nmap <right> :cnext<cr>
nmap <left> :cprev<cr>

" Another way to exit insert mode
imap jk <Esc>

" Easier file completion
imap <c-f> <c-x><c-f>

" A double space to switch alternate file
nmap <leader><leader> <c-^>

" Recognice camel case with Vim motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" Text Objects

" A text object for the entire file ("a file")
onoremap af :<C-u>normal! ggVG<CR>

" A text object for a css value ("a value")
onoremap av :<C-u>normal! 0f:lvt;<CR><space>

" reindent the whole file
nmap <leader>= gg=G``

" Load Vimrc for editing
nnoremap <leader>vim :silent :edit ~/.vimrc<cr>

" Source vimrc
nmap <leader>r :source ~/.vimrc<cr>

" Load the Tmux conf file for editing
nmap <leader>tmux :silent :edit ~/.tmux.conf<cr>

" Load zshrc for editing
nnoremap <leader>zsh :silent :tabedit ~/.zshrc<cr>

" Seamless tmux and vim split integration
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

" Call the Plug updater
nnoremap <leader>load :silent PlugClean \| PlugUpdate \| PlugInstall \| q<cr>

" Choose the tree view when using netrw
let g:netrw_liststyle=3

" Delete the buffer
nmap <silent> <C-q> :bd<cr>

" Toggle distraction free viewing with Goyo
nmap <leader>gy :Goyo<cr>

" The next two functions make Goyo behave in a more sane way
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



" Make vim-stardict split open in a :split (default value)
let g:stardict_split_horizontal = 1

" Set vim-stardict split width (or height) to 20 based on whether
" vim-stardict split is a :vsplit (or :split)
let g:stardict_split_size = 20

" Map vim-stardict's commands
" Ready for typing the word in
nnoremap <leader>sw :StarDict<Space>
" Lookup the word under cursor
nnoremap <leader>sc :StarDict <c-R><c-W><CR>

" Make some Lorem when in insert mode
imap lorem <esc>:Loremipsum 

" Seen in Steve Losh's .vimrc for sorting css/sass alphabetically
au BufNewFile,BufRead *.scss,*.css nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

" K will search vim help in vimfiles
au FileType vim setlocal keywordprg=:help

" Use a colourful man viewer in vim split
noremap K :Man <c-r><c-w><cr> 

"Fugitive 
" Shamelessly stolen shortcuts taken from the authors dotfiles
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
" A special one for gv plugin
nnoremap <leader>gh :GV<cr>

" FZF
" Also shamelessly stolen shortcuts taken from the authors dotfiles
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

" Search for a word in the project
nmap <leader>/ :Ag 

" Syntastic linters
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['jshint']
" some Syntastic defaults
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Zero will go to the start of the content first and then the very start
function! ToggleHomeZero()
  let pos = getpos('.')
  execute "normal! ^"
  if pos == getpos('.')
    execute "normal! 0"
  endif
endfunction
nnoremap 0 :call ToggleHomeZero()<CR>

" Toggle the undo tree
nmap <leader>gu :GundoToggle<cr>

" Toggle syntax checking (large files with lots of errors make things slow)
nnoremap <leader>syn :SyntasticToggleMode<cr>

" Give an indication when a line is more than 80 coumns long
highlight ColorColumn ctermbg=blue
call matchadd('ColorColumn', '\%81v', 100)

" A list of mappings to auto close brackets sometimes
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O

" Make a scratch buffer
command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile

" Make j and k move by virtual lines instead of physical lines, but only when
" not used in the count mode (e.g. 3j). This is great when 'wrap' and
" 'relativenumber' are used.
" Based on http://stackoverflow.com/a/21000307/2580955
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Enable omni completion.
set omnifunc=syntaxcomplete#Complete

" Close the opened HTML tag with Ctrl+_ (I do not use vim-closetag because it
" often fails with an error).
inoremap <silent> <C-_> </<C-x><C-o><C-x>

" Treat phtml files like php for comments
" let g:tcomment#filetype_map['phtml'] = 'php'

" Tell Vim which characters to show for expanded tabs, trailing whitespace,
" ends of lines, and non-breakable space.
set listchars=tab:>-,trail:#,eol:$,nbsp:~,extends:>,precedes:<

" Make Ctrl-e jump to the end of the line in the insert mode.
inoremap <C-e> <C-o>$

" Stay in visual mode when indenting.
vnoremap < <gv
vnoremap > >gv

" Quickly select the text I just pasted.
noremap gV `[v`]

" Copy the selected text into the clipboard.
noremap <Leader>y "+y

" Cut the selected text into the clipboard.
noremap <Leader>d "+d

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

au BufNewFile,BufRead *pentadactylrc*,*.penta set filetype=vim

let g:vimwiki_list = [{'path': '~/vimwiki/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]


" Put at the very end of your .vimrc file.
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType phtml call PhpSyntaxOverride()
augroup END
