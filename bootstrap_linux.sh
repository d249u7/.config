#!/bin/sh

system() {
    pacman -Syu

    # Write ibt=off to boot parameters
    nano /etc/default/grub
    grub-mkconfig -o /boot/grub/grub.cfg
    
    pacman -S nvidia yay firefox manjaro-pipewire
}

gaming() {
    packages=("steam" "gamemode" "lib32-gamemode" "mangohud lib32-mangohud" "goverlay-bin discord" "proton-ge-custom-bin")
    
    for p in "$packages"; do yay -S "$p"; done

    # Disable mouse acceleration
    touch /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
    echo "Section "InputClass"                                                                                               ✘ INT
        Identifier "My Mouse"
        MatchIsPointer "yes"
        Option "AccelerationProfile" "-1"
        Option "AccelerationScheme" "none"
        Option "AccelSpeed" "-1"
    EndSection" > /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

    # Proton ge likes dis
    usermod -a $(whoami) -G games
}

programming() {

    # zsh + oh my zsh + powerlevel10k
    yay -S zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    chsh -s $(which zsh)
    
    # Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # GitHub
    pacman -S github-cli
    gh auth login

    # Helix fork
    gh repo clone d249u7/helix ~/helix
    cd ~/helix
    cargo install --locked --path helix-term

    yay -S syncthing
    
    # Get configs
    gh repo clone d249u7/.config ~/cfg
    mv ~/cfg/* ~/.config
    mv ~/cfg/.* .config
    rm -rf cfg

    # Powerlevel10k and zsh configs
    rm -rf ~/.config/helix/runtime
    rm -f ~/.zshrc
    rm -f ~/.p10k.zsh
    ln -s ~/helix/runtime ~/.config/helix/runtime
    ln ~/.config/.zshrc ~/.zshrc
    ln ~/.config/.p10k.zsh ~/.p10k.zsh

    # Alacritty + zellij
    yay -S alacritty
    cargo install --locked zellij

    # Fonts
    mkdir ~/.fonts
    cp ~/.config/fonts/* ~/.fonts
}