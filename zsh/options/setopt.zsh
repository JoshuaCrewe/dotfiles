# Auto changes to a directory without typing cd.
setopt AUTO_CD

# Push the old directory onto the stack on cd.
setopt AUTO_PUSHD

# Do not store duplicates in the stack.
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after pushd or popd.
setopt PUSHD_SILENT         

# Push to home directory when no argument is given.
setopt PUSHD_TO_HOME        

# Change directory to a path stored in a variable.
setopt CDABLE_VARS          

# Auto add variable-stored paths to ~ list.
setopt AUTO_NAME_DIRS       

# Write to multiple descriptors.
setopt MULTIOS              

# Use extended globbing syntax.
setopt EXTENDED_GLOB

# Do not overwrite existing files with > and >>.
# Use >! and >>! to bypass.
unsetopt CLOBBER            

# do not autoselect the first completion entry
unsetopt menu_complete
# show completion menu on succesive tab press
setopt auto_menu

# ===== History

# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY 

# Add comamnds as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY 

# Do not write events to history that are duplicates of previous events
setopt HIST_IGNORE_DUPS

# When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

# Remove extra blanks from each command line being added to history
setopt HIST_REDUCE_BLANKS

# Include more information about when the command was executed, etc
setopt EXTENDED_HISTORY

# ===== Completion 

# Allow completion from within a word/phrase
setopt COMPLETE_IN_WORD 

# When completing from the middle of a word, move the cursor to the end of the word
setopt ALWAYS_TO_END            

# ===== Prompt

# Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt PROMPT_SUBST
