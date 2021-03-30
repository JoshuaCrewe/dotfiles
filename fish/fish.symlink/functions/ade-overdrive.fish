function ade-overdrive
    export WINEPREFIX=$HOME/.adewine-overdrive/
    wine $HOME/.adewine-overdrive/drive_c/Program\ Files/Adobe/Adobe\ Digital\ Editions\ 2.0/DigitalEditions.exe > /dev/null 2>&1 &
end

