{ config, pkgs, ... }:

{
  home.username = "jeremyg";
  home.homeDirectory = "/home/jeremyg";
  home.stateVersion = "24.11"; # don't change

  home.packages = with pkgs; [
    # shell
    fzf
    fishPlugins.grc # colourized output
    grc
    fish # to replace bash/zsh
    trash-cli # safe delete
    nixfmt-rfc-style

    # games
    openrct2
    openloco

    # misc
    megacmd
  ];

  home.file = { };
  home.sessionVariables = {
    SUDO_EDITOR = "nano";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./programs/shell.nix
  ];

}
