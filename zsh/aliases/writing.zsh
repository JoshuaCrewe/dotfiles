# for use with notes https://github.com/pimterry/notes
alias note="notes"
alias fnotes="notes-fzf"

# https://github.com/FraGag/feeds-to-pocket
alias pocket="feeds-to-pocket ~/SparkleShare/gitlab.com/docs/config/feeds-to-pocket.yaml"
alias getpocket="o https://getpocket.com"

# https://github.com/neomutt/neomutt
alias mutt='cd ~/Downloads/ && neomutt'

# https://github.com/utatti/pen
if hash pen 2>/dev/null; then

    if hash pandoc 2>/dev/null; then
        alias md=pen --pandoc gfm
    elif then
        alias md=pen gfm
    fi

fi
