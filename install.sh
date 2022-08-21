#!/bin/sh

log() {
    printf '\033[1;34m[ARCHBOX]\033[m %s\n' "$1"
}

for file in home/.*; do
    case $file in
        .) ;;
        ..) ;;
        *)
            [ -f "$file" ] && {
                log "Symlinking ~/${file##*/}"
                ln -sf "$PWD/$file" "$HOME/${file##*/}"
            }
        ;;
    esac
done

mkdir -p ~/bin

for file in bin/*; do
    case $file in
        .) ;;
        ..) ;;
        *)
            [ -f "$file" ] && {
                log "Symlinking ~/bin/${file##*/}"
                ln -sf "$PWD/$file" "$HOME/bin/${file##*/}"
            }
        ;;
    esac
done

log "Run the following to configure Git:"
printf '%s\n' "
    git config --global user.name \"<name>\"
    git config --global user.email \"<email>\"
"

log "Run the following to set up an SSH key:"
printf '%s\n' "
    ssh-keygen -t ed25519 -C \"<email>\"
    eval \"\$(ssh-agent -s)\"
    ssh-add ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub
"

log "Run the following to install packages:"
printf '%s\n' "
    sudo pacman -Syu \$(cat packages.txt)
"

log "Run the following to configure VirtualBox:"
printf '%s\n' "
    sudo systemctl enable --now vboxservice.service
    sudo modprobe -a vboxguest vboxsf vboxvideo
    VBoxClient-all
"

log "Done"
