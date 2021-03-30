function ade-bolinda
    export WINEPREFIX=$HOME/.adewine/
    wine $HOME/.adewine/drive_c/Program\ Files/Adobe/Adobe\ Digital\ Editions\ 2.0/DigitalEditions.exe > /dev/null 2>&1 &
end
