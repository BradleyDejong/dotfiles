export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
export EDITOR=nvim
TERM=xterm-256color
TERM=screen-256color-bce

eval "$(starship init bash)"
eval "$(direnv hook bash)"

set -o vi

alias vim=nvim
alias vi=nvim
alias g='git'
