#!/bin/sh

system() {
    pacman -Syu
    nano /etc/default/grub
    grub-mkconfig -o /boot/grub/grub.cfg
    pacman -S nvidia
    pacman -S yay
}

gaming() {
    packages=("steam" "gamemode" "lib32-gamemode" "mangohud lib32-mangohud" "goverlay-bin discord")
    
    for p in "$packages"; do yay -S "$p"; done
}

programming() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    
    sudo pacman -S github-cli
    gh auth login
    
    gh repo clone d249u7/helix ~/helix
    cd ~/helix
    cargo install --locked --path helix-term
    
    gh repo clone d249u7/.config cfg
    mv cfg/* .config
    mv cfg/.* .config
    rm -rf cfg

    chmod +x ~/.config/setup.sh
    ~/.config/setup.sh
}

finally() {
    curl -LO --output-dir ~/.local/share/Steam/steamapps/shadercache/1172470/DXVK_state_cache/ https://github.com/bcook254/apex-legends-cache/raw/main/r5apex.dxvk-cache
}

