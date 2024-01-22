{ pkgs, ... }: {

  programs.tmux = {
    enable = true;
    # package = with pkgs; [ tmux ];
    keyMode = "vi";
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    historyLimit = 10000;
    secureSocket = true;
    shell = "\${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";
    extraConfig = ''
      set -ga terminal-overrides ",xterm-256color:Tc"
    '';
  };

}