# https://muttwizard.com/

## Setup

Go through the setup for this script. Once finished, install these extra bits of config. Then add the following line to `~/.config/mutt/muttrc` :

```
source ~/.config/mutt/user/muttrc
```

## MW fixes

`mw` isn't great at figuring out the mailboxes on the work account. You will need to go through its configs and amend the paths to the mailboxes. The correct path is **not** prefixed with `=INBOX`.

```
macro index,pager ga "<change-folder>=Archive<enter>" "go to archive"
macro index,pager Ma ";<save-message>=Archive<enter>" "move mail to archive"
macro index,pager Ca ";<copy-message>=Archive<enter>" "copy mail to archive"

macro index,pager gh "<change-folder>=heidi<enter>" "go to inbox"
macro index,pager Mh ";<save-message>=heidi<enter>" "move mail to inbox"
macro index,pager Ch ";<copy-message>=heidi<enter>" "copy mail to inbox"
```

OK?
