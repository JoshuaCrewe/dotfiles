type -p exa > /dev/null && alias ls="exa" || alias ls='ls -F --color=auto'
type -p exa > /dev/null && alias l="exa -lahg --git" || alias l="ls -lah"

type -p bat > /dev/null && alias cat="bat"

alias cp="cp -r"

type -p xclip > /dev/null && alias pbcopy="xclip -selection clipboard -in"
type -p xclip > /dev/null && alias pbpaste="xclip -selection clipboard -out"

type -p xsel > /dev/null && alias pbcopy='xsel --clipboard --input'
type -p xsel > /dev/null && alias pbpaste='xsel --clipboard --output'
