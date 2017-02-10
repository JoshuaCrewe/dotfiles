" vim:tabstop=4:shiftwidth=4:expandtab:foldmethod=marker:textwidth=79
" Vimwiki syntax file
" Desc: Defines markdown syntax
" Home: https://github.com/vimwiki/vimwiki/

" syn match   myTodo   contained   "\<\(TODO\|FIXME\):"
" hi def link myTodo Todo

syn keyword TodoKeywords TODO NOTE 
hi def link TodoKeywords Todo
