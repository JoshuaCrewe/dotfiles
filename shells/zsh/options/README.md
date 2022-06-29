# Options

There are various options to choose from to make zsh work the way in which you want. Here are a few of the ones I understand and a few that I definitely do not understand.

    - `AUTO_CD` auto changes to a directory without typing `cd`.
    - `AUTO_PUSHD` pushes the old directory onto the stack on `cd`.
    - `PUSHD_IGNORE_DUPS` does not store duplicates in the stack.
    - `PUSHD_SILENT` does not print the directory stack after `pushd` or `popd`.
    - `PUSHD_TO_HOME` pushes to the home directory when no argument is given.
    - `CDABLE_VARS` changes directory to a path stored in a variable.
    - `AUTO_NAME_DIRS` auto adds variable-stored paths to `~` list.
    - `MULTIOS` writes to multiple descriptors.
    - `EXTENDED_GLOB` uses extended globbing syntax.
    - `CLOBBER` does not overwrite existing files with `>` and `>>`. Use `>!` and
    `>>!` to bypass.
