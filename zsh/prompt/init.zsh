# The prompt is set from ${HOME}/dotfiles/zsh/pluigns/zplugin.zsh
# The following will allow for an indication of which mode the prompt is in
# with Vi keybindings
VIM_PROMPT="❯"
PROMPT='%(?.%F{pink}.%F{red})${VIM_PROMPT}%f '

prompt_pure_update_vim_prompt() {
    zle || {
        print "error: pure_update_vim_prompt must be called when zle is active"
        return 1
    }
    VIM_PROMPT=${${KEYMAP/vicmd/❮}/(main|viins)/❯}
    zle .reset-prompt
}

function zle-line-init zle-keymap-select { 
    prompt_pure_update_vim_prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
