export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

plugins=(git)

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zellij setup --generate-auto-start zsh)"
