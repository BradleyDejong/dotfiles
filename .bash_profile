
alias g='git'
TERM=xterm-256color

export PATH=$PATH:`npm config get prefix`/bin

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Library/Python/3.6/lib/python/site-packages:$PATH"
export PATH="$VIMCONFIG/pack/bundle/start/fzf/bin:$PATH"

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim

alias vim=nvim

export FZF_DEFAULT_COMMAND='rg --files'

set -o vi
