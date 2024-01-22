{ pkgs, ... }: 

  # https://github.com/tmux-plugins/tmux-sensible
  # https://github.com/tmux-plugins/tmux-pain-control

  let
    tmux-tokyo-night = pkgs.tmuxPlugins.mkTmuxPlugin {
      pluginName = "tmux-tokyo-night";
      version = "unstable-2024-01-22";
      rtpFilePath = "tmux-tokyo-night.tmux";
      src = pkgs.fetchFromGitHub {
        owner = "fabioluciano";
        repo = "tmux-tokyo-night";
        rev = "ee73d4a9ba6222d7d51492a4e0e797c9249a879c";
        # sha256 = "sha256-HN0hJeB31MvkD12dbnF2SjefkAVgtUmhah598zAlhQs=";
      };
    };

  in {
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    sensibleOnTop = true;
    keyMode = "emacs";
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    historyLimit = 50000;
    secureSocket = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";
    plugins = with pkgs.tmuxPlugins; [
      pain-control
      better-mouse-mode
      {
        plugin = tmux-tokyo-night;
        extraConfig = ''
          set -g @theme_variation 'moon'
          set -g @theme_left_separator ''
          set -g @theme_right_separator ''
        '';
      }
    ];
    extraConfig = ''
      set -ga terminal-overrides ",xterm-256color:Tc"
    '';
  };

}