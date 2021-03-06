# Harry Potter Fun Times {{
    alias accio=wget
    alias avadaKedavra='rm -f'
    alias imperio=sudo
    alias priorIncantato='echo `history |tail -n2 |head -n1` | sed "s/[0-9]* //"'
    alias stupefy='sleep 5'
    alias wingardiumLeviosa=mv

    alias sonorus='set -v'
    alias quietus='set +v'

    alias colloportus='openssl enc -aes-256-cbc'  # locking spell!  $colloportus -in unencryptedName -out encryptedName
    alias alohamora='openssl enc -d -aes-256-cbc'  # unlocking spell!  $alohamora -in encryptedName -out unencryptedName

    alias reducio='zip -r'  # $reducio zippedName thingToZip
    alias engorgio=unzip  # $engorgio zippedName

    alias legilimens='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'  # see the hidden thoughts!
    alias occlumens='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'  # keep hidden things hidden!

    alias obliviate='history -c; history -w'  # clear bash history
    alias obscuro='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'  # lock screen

    alias tergeo='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'  # makes surfaces clean!
    alias untergeo='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'  # (this one isn't canon)

    alias expectoPatronum='open ~/Pictures/turtleBasking.jpg'  # summon your spirit animal!  (replace with a picture of your own spirit animal)

    function bodyBindCurse() {
        alias cd='echo "you are immobilized!  you cannot get to"'
    }

    function blindingCurse() {
        alias ls='echo "you have been blinded!"'
    }
#}}
