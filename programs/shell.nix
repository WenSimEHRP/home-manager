{ config, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    defaultCommand = "fd --type f";
  };
  programs.zsh = {
    enable = true;
    initExtraFirst = "fish"; # https://askubuntu.com/a/718668
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      source ${./../completions/lsss.fish}
    '';
    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
    shellAliases = {
      ls = "eza -l --git --icons=always --colour=always --time-style iso $argv";
    };
    functions = {
      lsss = builtins.readFile(./lsss.fish);
    };
  };
}
