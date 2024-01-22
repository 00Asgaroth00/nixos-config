{ pkgs, ... }: {

  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    sensibleOnTop = true;
    keyMode = "emacs";
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    historyLimit = 10000;
    secureSocket = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";
    plugins = with pkgs.tmuxPlugins; [
      pain-control
    ];
    extraConfig = ''
      set -ga terminal-overrides ",xterm-256color:Tc"
    '';
  };

}