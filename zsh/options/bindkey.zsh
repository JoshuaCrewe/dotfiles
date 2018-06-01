bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a  
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
bindkey "^D"      delete-char                          # ctrl-d
bindkey "^F"      forward-char                         # ctrl-f
bindkey "^B"      backward-char                        # ctrl-b
bindkey -e # Default to standard emacs bindings, regardless of editor string
# bindkey -v # Default to standard vim bindings, made possible by status

# Red dots for completing process'
# http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "\e[31m...\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Use ^o in completion menu to use selection and show next completion options
# Useful for moving around folders.
bindkey -M menuselect '^o' accept-and-infer-next-history


bindkey "^X^G" open-tig-status
bindkey "^X^B" fzf-branches
