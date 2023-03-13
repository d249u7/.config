export ZSH="$HOME/.oh-my-zsh"
export VISUAL=hx
export EDITOR="$VISUAL"
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zellij setup --generate-auto-start zsh)"
