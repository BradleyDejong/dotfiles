{ config, pkgs, ... }:

let
  tmux = import ~/.nixpkgs/tmux (with pkgs;
    { inherit
        makeWrapper
	symlinkJoin
	writeText
	;
      tmux = pkgs.tmux;
    });

in

{

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ pkgs.vim
      pkgs.httpie
      pkgs.neovim
      pkgs.git
      pkgs.zsh
      pkgs.antibody
      pkgs.oh-my-zsh
      pkgs.nodejs-10_x
      tmux
      pkgs.tmuxinator
      pkgs.wget
      pkgs.fd
      pkgs.fzf
      pkgs.ripgrep
      pkgs.tree
      pkgs.pandoc
      pkgs.pass
      pkgs.rig
      pkgs.lolcat
      pkgs.toilet
      pkgs.gnupg
      pkgs.sl
      pkgs.mono6
      # pkgs.dotnet-sdk
      pkgs.graphviz
      pkgs.editorconfig-core-c
      pkgs.cmake
      pkgs.libtool
      pkgs.alacritty
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # environment.allowUnsupportedSystem = true;

  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  # programs.bash.enable = true;
  programs.zsh.enable = true;
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 2;
  nix.buildCores = 2;
  # nixpkgs.config.allowUnsupportedSystem = true;
}
