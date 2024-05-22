
alias g='git'
TERM=xterm-256color
TERM=screen-256color-bce

# export PATH=$PATH:`npm config get prefix`/bin

export PATH="/run/current-system/sw/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$VIMCONFIG/pack/bundle/start/fzf/bin:$PATH"

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim

alias vim=nvim

export FZF_DEFAULT_COMMAND='rg --files'

set -o vi
source ~/.bashrc
