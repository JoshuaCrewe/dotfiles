
" generic headers "{{{
if g:vimwiki_symH
  "" symmetric
  for s:i in range(1,6)
    let g:vimwiki_rxH{s:i}_Template = repeat(g:vimwiki_rxH, s:i).' __Header__ '.repeat(g:vimwiki_rxH, s:i)
    let g:vimwiki_rxH{s:i} = '^\s*'.g:vimwiki_rxH.'\{'.s:i.'}[^'.g:vimwiki_rxH.'].*[^'.g:vimwiki_rxH.']'.g:vimwiki_rxH.'\{'.s:i.'}\s*$'
    let g:vimwiki_rxH{s:i}_Start = '^\s*'.g:vimwiki_rxH.'\{'.s:i.'}[^'.g:vimwiki_rxH.'].*[^'.g:vimwiki_rxH.']'.g:vimwiki_rxH.'\{'.s:i.'}\s*$'
    let g:vimwiki_rxH{s:i}_End = '^\s*'.g:vimwiki_rxH.'\{1,'.s:i.'}[^'.g:vimwiki_rxH.'].*[^'.g:vimwiki_rxH.']'.g:vimwiki_rxH.'\{1,'.s:i.'}\s*$'
  endfor
  let g:vimwiki_rxHeader = '^\s*\('.g:vimwiki_rxH.'\{1,6}\)\zs[^'.g:vimwiki_rxH.'].*[^'.g:vimwiki_rxH.']\ze\1\s*$'
else
  " asymmetric
  for s:i in range(1,6)
    let g:vimwiki_rxH{s:i}_Template = repeat(g:vimwiki_rxH, s:i).' __Header__'
    let g:vimwiki_rxH{s:i} = '^\s*'.g:vimwiki_rxH.'\{'.s:i.'}[^'.g:vimwiki_rxH.'].*$'
    let g:vimwiki_rxH{s:i}_Start = '^\s*'.g:vimwiki_rxH.'\{'.s:i.'}[^'.g:vimwiki_rxH.'].*$'
    let g:vimwiki_rxH{s:i}_End = '^\s*'.g:vimwiki_rxH.'\{1,'.s:i.'}[^'.g:vimwiki_rxH.'].*$'
  endfor
  let g:vimwiki_rxHeader = '^\s*\('.g:vimwiki_rxH.'\{1,6}\)\zs[^'.g:vimwiki_rxH.'].*\ze$'
endif

" Header levels, 1-6
for s:i in range(1,6)
  execute 'syntax match VimwikiHeader'.s:i.' /'.g:vimwiki_rxH{s:i}.'/ contains=VimwikiTodo,VimwikiHeaderChar,VimwikiNoExistsLink,VimwikiCode,VimwikiLink,@Spell'
  execute 'syntax region VimwikiH'.s:i.'Folding start=/'.g:vimwiki_rxH{s:i}_Start.
        \ '/ end=/'.g:vimwiki_rxH{s:i}_End.'/me=s-1 transparent fold'
endfor


" }}}

