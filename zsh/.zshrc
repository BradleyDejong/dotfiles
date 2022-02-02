source /etc/static/bashrc

updatezsh() {
 antibody bundle < ~/.zsh/plugins.txt > ~/.zsh/plugins.sh
 antibody update
}

source ~/.zsh/plugins.sh

if [ -e /Users/m161475/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/m161475/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

alias g='git'
TERM=xterm-256color

# alias em="~/scripts/em.sh"
# alias emt="emacsclient -nw"

export PATH=$PATH:`npm config get prefix`/bin
export PATH=$PATH:$HOME/.psvm/current/bin

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Library/Python/3.6/lib/python/site-packages:$PATH"
export PATH="$VIMCONFIG/pack/bundle/start/fzf/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH=/Applications/Racket\ v7.3/bin:$PATH

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim

alias vim=nvim
alias down='docker-compose down'
alias up='docker-compose up'

export FZF_DEFAULT_COMMAND='rg --files'

set -o vi

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

alias shipit='git add . && git commit -m "SHIP IT NOW" && git push --force'

alias nixre="darwin-rebuild switch"
alias nixgc="nix-collect-garbage -d"
alias nixq="nix-env -qaP"
alias nixupgrade="sudo -i sh -c 'nix-channel --update && nix-env -iA nixpkgs.nix && launchctl remove org.nixos.nix-daemon && launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist'"
alias nixup="nix-env -u"
alias nixcfg="nvim ~/.nixpkgs/darwin-configuration.nix"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export JAVA_HOME="/usr/local/opt/openjdk@11"

bindkey -s '^F' "tmux-session-finder\n"

