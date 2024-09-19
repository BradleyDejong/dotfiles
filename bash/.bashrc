export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"
TERM=xterm-256color
TERM=screen-256color-bce

eval "$(starship init bash)"
eval "$(direnv hook bash)"

set -o vi

alias vim=nvim
alias g='git'

export GPG_TTY=$(tty)
