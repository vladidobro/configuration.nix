{ config, pkgs, ... }:

{
  nixpkgs.overlays = ../../overlays/nushell.nix;

  home.username = "vladidobro";
  home.homeDirectory = "/home/vladidobro";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    ripgrep
    brave
    dmenu-rs
    alacritty
    lf
  ];

  programs.git = {
    enable = true;
    userName = "Vladislav Wohlrath";
    userEmail = "vladislav@wohlrath.cz";
  };

  programs.ssh = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
  };

  programs.nushell = {
    enable = true;
    package = pkgs.nushell-dfr;
  };

  programs.atuin = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.helix = {
    enable = true;
  };
}
