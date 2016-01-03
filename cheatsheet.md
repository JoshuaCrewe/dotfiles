# A Cheat Sheet for Vim commands

- :%s/old/new/gc -> substitute old for new g(o) c(onfirm).
- :args `find . -type f` -> will populate the args list with all the files in the current directory.
- :vim /thing-to-search/ ## -> vimgrep to add buffers to quickfix.
- :cfdo -> edit all the files in the quickfix list.
- :argdo -> perform a command on all files in the args list.

- <C-r>= -> back of the envelope calculations from insert mode.
- <C-o>zz -> Insert normal mode, center content.
- <C-h> -> Delete back one character.
- <C-w> -> Delete back one word.
- <C-u> -> Delete back one line.

- :sp -> split window horizontaly.
- :vsp -> split window vertically.
- :only -> closes all windows apart from the one you are working on.
- <C-W>= -> equalises the window sizes.
- <C-W>_ -> Maximise the window in terms of vertical space.
- <C-W>| -> Maximise the window in terms of horizontal space.

- g~ -> Swap case
- gu -> make lowercase
- gU -> make uppercase
- {number}<C-a> -> perform addition
- {number}<C-x> -> perform subtraction

- zf{motion} -> operator to create a fold.
- zD -> delete one fold at cursor.
