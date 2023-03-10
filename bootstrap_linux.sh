#!/bin/sh

system() {
    sudo pacman -Syu --noconfirm

    # Write ibt=off to boot parameters
    suo nano /etc/default/grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    
    sudo pacman -S nvidia yay firefox manjaro-pipewire --noconfirm
}

gaming() {
    packages=("steam" "gamemode" "lib32-gamemode" "mangohud lib32-mangohud" "goverlay-bin discord" "proton-ge-custom-bin")
    
    for p in "$packages"; do yay -S "$p" --noconfirm; done

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
    sudo usermod -a $(whoami) -G games
}

programming() {
    if ! which yay; then
        exit 1
    fi

    yay --noconfirm

    yay -S zsh --noconfirm
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/d249u7/ohmyzsh/master/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    if ! which rustup; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        rustup component add rust-analyzer
    else
        rustup self update
    fi

    cargo install --locked bat zellij sccache 

    if ! which gh; then 
        sudo pacman -S github-cli --noconfirm
        gh auth login
    fi

    if ! which hx; then
        gh repo clone d249u7/helix ~/helix
        cd ~/helix
        cargo install --locked --path helix-term
    fi

    if ! which syncthing; then
        yay -S daemonize syncthing --noconfirm
    fi

    cd ~/.config
    if git rev-parse --git-dir > /dev/null 2>&1; then
        git fetch origin master
        git reset --hard origin/master
    else
        rm -rf ~/cfg
        gh repo clone d249u7/.config ~/cfg
        mv -f ~/cfg/* ~/.config
        mv -f ~/cfg/.* .config
        rm -rf cfg
    fi

    rm -rf ~/.config/helix/runtime
    rm -f ~/.zshrc
    rm -f ~/.p10k.zsh
    ln -s ~/helix/runtime ~/.config/helix/runtime
    ln ~/.config/.zshrc ~/.zshrc
    ln ~/.config/.p10k.zsh ~/.p10k.zsh

    yay -S alacritty zellij ttf-meslo-nerd-font-powerlevel10k --noconfirm
}

programming