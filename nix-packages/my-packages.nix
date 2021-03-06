# default.nix
let
  pkgs = import <nixpkgs> {};

  # bashrc = …;
  # git = …;
  tmux = import ./tmux (with pkgs;
    { inherit
        makeWrapper
        symlinkJoin
        writeText
        ;
      tmux = pkgs.tmux;
    });
  # vim = …;

  homies =
    [
      # Customized packages
      # bashrc
      # git
      tmux
      # vim

      # Sourced directly from Nixpkgs
      pkgs.curl
      pkgs.htop
      pkgs.nix
      pkgs.httpie
      pkgs.git
      pkgs.emacs
      pkgs.neovim
      pkgs.tree
      pkgs.zsh
      pkgs.antibody
      pkgs.graphviz
      # pkgs.pandoc
      # ripgrep git-annex imgcat maven pandoc purescript  ruby tmux vim xdot
    ];

in homies
