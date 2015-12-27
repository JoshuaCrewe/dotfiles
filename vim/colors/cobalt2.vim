" Cobalt 2 Vim Color Scheme
" Sublime Text original by Wes Bos
" Adapted for Vim by Marcel Bischoff
" --ALPHA VERSION--

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "cobalt2"

hi Visual ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=#0050a4 gui=NONE
hi VertSplit ctermfg=60 ctermbg=60 cterm=NONE guifg=#5c707e guibg=#5c707e gui=NONE
hi StatusLine ctermfg=15 ctermbg=60 cterm=bold guifg=#cccccc guibg=#35434d gui=NONE
hi StatusLineNC ctermfg=15 ctermbg=60 cterm=NONE guifg=#ffffff guibg=#5c707e gui=NONE
hi Pmenu ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc600 guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=25 cterm=NONE guifg=NONE guibg=#0050a4 gui=NONE
hi IncSearch ctermfg=23 ctermbg=76 cterm=NONE guifg=#193549 guibg=#35d900 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff628c guibg=NONE gui=NONE
hi Folded ctermfg=33 ctermbg=23 cterm=NONE guifg=#0088ff guibg=#193549 gui=NONE

hi Normal ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=#193549 gui=NONE
hi Boolean ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff628c guibg=NONE gui=NONE
hi Character ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff628c guibg=NONE gui=NONE
hi Comment ctermfg=33 ctermbg=NONE cterm=NONE guifg=#0088ff guibg=NONE gui=italic
hi Conditional ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ff9d00 guibg=NONE gui=NONE
hi Constant ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff628c guibg=NONE gui=NONE
hi Define ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ff9d00 guibg=NONE gui=NONE
hi DiffAdd ctermfg=15 ctermbg=64 cterm=bold guifg=#ffffff guibg=#438613 gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#880b0f guibg=NONE gui=NONE
hi DiffChange ctermfg=15 ctermbg=23 cterm=NONE guifg=#ffffff guibg=#1c4068 gui=NONE
hi DiffText ctermfg=15 ctermbg=24 cterm=bold guifg=#ffffff guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=88 cterm=NONE guifg=#f8f8f8 guibg=#800f00 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=88 cterm=NONE guifg=#f8f8f8 guibg=#800f00 gui=NONE
hi Float ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff628c guibg=NONE gui=NONE
hi Function ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc600 guibg=NONE gui=NONE
hi Identifier ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc600 guibg=NONE gui=NONE
hi Keyword ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ff9d00 guibg=NONE gui=NONE
hi Label ctermfg=76 ctermbg=NONE cterm=NONE guifg=#35d900 guibg=NONE gui=NONE
hi NonText ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc600 guibg=#253f52 gui=NONE
hi Number ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff628c guibg=NONE gui=NONE
hi Operator ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ff9d00 guibg=NONE gui=NONE
hi PreProc ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ff9d00 guibg=NONE gui=NONE
hi Special ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi SpecialKey ctermfg=220 ctermbg=59 cterm=NONE guifg=#ffc600 guibg=#30495b gui=NONE
hi Statement ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ff9d00 guibg=NONE gui=NONE
hi StorageClass ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc600 guibg=NONE gui=NONE
hi String ctermfg=76 ctermbg=NONE cterm=NONE guifg=#35d900 guibg=NONE gui=NONE
hi Tag ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc600 guibg=NONE gui=NONE
hi Title ctermfg=15 ctermbg=NONE cterm=bold guifg=#ffffff guibg=NONE gui=bold
hi Todo ctermfg=33 ctermbg=NONE cterm=inverse,bold guifg=#0088ff guibg=NONE gui=inverse,bold,italic
hi Type ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc600 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline

" Basic
hi ColorColumn guifg=NONE guibg=#526776 gui=NONE ctermbg=NONE
hi Cursor guifg=#193549 guibg=#ffc600 gui=NONE
hi CursorColumn guifg=NONE guibg=#1d425d gui=NONE
hi CursorLine guifg=NONE guibg=#1d425d gui=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi LineNr guifg=#8c9aa4 guibg=#193549 gui=NONE
hi CursorLineNr guifg=#8c9aa4 guibg=#1d425d gui=NONE
hi MatchParen guifg=#ff9d00 guibg=NONE gui=underline

" Ruby
hi rubyClass ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ff9d00 guibg=NONE gui=NONE
hi rubyFunction ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc600 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff628c guibg=NONE gui=NONE
hi rubyConstant ctermfg=121 ctermbg=NONE cterm=NONE guifg=#80ffbb guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=76 ctermbg=NONE cterm=NONE guifg=#35d900 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=252 ctermbg=23 cterm=NONE guifg=#cccccc guibg=#0d3a58 gui=NONE
hi rubyInstanceVariable ctermfg=212 ctermbg=NONE cterm=NONE guifg=#ff80e1 guibg=NONE gui=NONE
hi rubyInclude ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ff9d00 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=252 ctermbg=23 cterm=NONE guifg=#cccccc guibg=#0d3a58 gui=NONE
hi rubyRegexp ctermfg=121 ctermbg=NONE cterm=NONE guifg=#80ffc2 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=121 ctermbg=NONE cterm=NONE guifg=#80ffc2 guibg=NONE gui=NONE
hi rubyEscape ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff628c guibg=NONE gui=NONE
hi rubyControl ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ff9d00 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=252 ctermbg=23 cterm=NONE guifg=#cccccc guibg=#0d3a58 gui=NONE
hi rubyOperator ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ff9d00 guibg=NONE gui=NONE
hi rubyException ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ff9d00 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=212 ctermbg=NONE cterm=NONE guifg=#ff80e1 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=121 ctermbg=NONE cterm=NONE guifg=#80ffbb guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb054 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb054 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb054 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb054 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=195 ctermbg=NONE cterm=NONE guifg=#e1efff guibg=NONE gui=NONE
hi erubyComment ctermfg=33 ctermbg=NONE cterm=NONE guifg=#0088ff guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb054 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb054 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

" Yaml
hi yamlKey ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc600 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=252 ctermbg=23 cterm=NONE guifg=#cccccc guibg=#0d3a58 gui=NONE
hi yamlAlias ctermfg=252 ctermbg=23 cterm=NONE guifg=#cccccc guibg=#0d3a58 gui=NONE
hi yamlDocumentHeader ctermfg=76 ctermbg=NONE cterm=NONE guifg=#35d900 guibg=NONE gui=NONE

" CSS
hi cssURL ctermfg=252 ctermbg=23 cterm=NONE guifg=#cccccc guibg=#0d3a58 gui=NONE
hi cssFunctionName ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb054 guibg=NONE gui=NONE
hi cssColor ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff628c guibg=NONE gui=NONE
hi cssValueLength ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ffee80 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=174 ctermbg=NONE cterm=NONE guifg=#eb939a guibg=NONE gui=NONE
hi cssBraces ctermfg=195 ctermbg=NONE cterm=NONE guifg=#e1efff guibg=NONE gui=NONE
hi cssMediaType guifg=#eb939a guibg=NONE gui=NONE
hi cssMediaProp guifg=#80ffbb guibg=NONE gui=NONE 
hi cssUnitDecorators guifg=#ff9d00 guibg=NONE gui=NONE 
hi cssInclude guifg=#ffffff guibg=NONE gui=NONE
hi cssMediaBlock guifg=#80ffbb guibg=NONE gui=NONE 
hi cssTagName guifg=#80fcff guibg=NONE gui=NONE 
hi cssClassName guifg=#3ad900 guibg=NONE gui=NONE 
hi cssClassNameDot guifg=#ffffff guibg=NONE gui=NONE
hi cssPseudoClassLang guifg=#ff628c guibg=NONE gui=NONE 
hi cssPseudoClassId ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc600 guibg=NONE gui=NONE
hi cssDefinition guifg=#80ffbb guibg=NONE gui=NONE
hi cssAttrRegion guifg=#ffee80 guibg=NONE gui=NONE
hi cssValueNumber guifg=#ffee80 guibg=NONE gui=NONE
hi cssPositioningAttr guifg=#ffee80 guibg=NONE gui=NONE
hi cssProp guifg=#80ffbb guibg=NONE gui=NONE

" HTML
hi htmlTagN guifg=#ffffff guibg=NONE gui=NONE
hi htmlEndTag guifg=#ffffff guibg=NONE gui=NONE
hi htmlTagName guifg=#9effff guibg=NONE gui=NONE
hi htmlArg guifg=#9effff guibg=NONE gui=NONE
hi htmlSpecialChar guifg=#ff628c guibg=NONE gui=NONE
hi htmlTitle guifg=NONE guibg=NONE gui=NONE
hi htmlH1 guifg=NONE guibg=NONE gui=NONE
hi link htmlH2 htmlH1
hi link htmlH3 htmlH1
hi link htmlH4 htmlH1
hi link htmlH5 htmlH1
hi link htmlH6 htmlH1
hi htmlLink guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialTagName guifg=#ffc600 guibg=NONE gui=NONE

" JavaScript
hi javaScriptFunction guifg=#ff80e1 guibg=NONE gui=NONE
hi javaScriptFuncName guifg=#ffc600 guibg=NONE gui=NONE
hi javaScriptBraces guifg=#ffffff guibg=NONE gui=NONE
hi jsGlobalObjects guifg=#ffc600 guibg=NONE gui=NONE
hi jsFuncCall guifg=#ff9d00  guibg=NONE gui=NONE
hi jsFuncArgs guifg=#cccccc guibg=#35434d gui=NONE
hi jsThis guifg=#ff80e1 guibg=#35434d gui=NONE

" Twig
hi twigTagDelim guifg=NONE guibg=NONE gui=NONE
hi link twigVarDelim twigTagDelim
hi twigString guifg=#35d900 guibg=NONE gui=NONE
hi twigVariable guifg=#eeee80 guibg=NONE gui=NONE
hi twigBlockName guifg=#cccccc guibg=#0d3a58 gui=NONE

" Markdown
hi markdownH1 guifg=#ffc600 guibg=#000000 gui=NONE
hi link markdownH2 markdownH1
hi link markdownH3 markdownH1
hi link markdownH4 markdownH1
hi link markdownH5 markdownH1
hi link markdownH6 markdownH1
hi markdownHeadingDelimiter guifg=#ffffff guibg=#000000 gui=NONE
hi markdownUrl guifg=#ffffff guibg=NONE gui=NONE 
hi markdownLink guifg=#3ad900 guibg=NONE gui=NONE 
hi markdownLinkText guifg=#3ad900 guibg=NONE gui=NONE
hi markdownBold guifg=#c1afff guibg=NONE gui=NONE
hi markdownItalic guifg=#80ffbb guibg=NONE gui=NONE 

" Php
hi phpRegion guifg=#ffee80 guibg=NONE gui=NONE
hi phpOperator guifg=#ff9d00 guibg=NONE gui=NONE
hi phpIdentifier guifg=#cccccc guibg=#35434d gui=NONE
hi phpVarSelector guifg=#ffffff guibg=#35434d gui=NONE

" Startify
hi startifyNumber guifg=#eb939a guibg=NONE gui=NONE
hi startifyFile guifg=#ffc600 gui=NONE gui=NONE
hi startifyPath guifg=#eb939a guibg=NONE gui=NONE
