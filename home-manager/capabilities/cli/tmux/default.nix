{pkgs, ...}:
# https://github.com/fabioluciano/tmux-tokyo-night
# https://github.com/tmux-plugins/tmux-sensible
# https://github.com/tmux-plugins/tmux-pain-control
# https://github.com/ryanoasis/vim-devicons
# https://github.com/dense-analysis/ale
let
  tmux-tokyo-night = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-tokyo-night";
    version = "unstable-2024-01-22";
    rtpFilePath = "tmux-tokyo-night.tmux";
    src = pkgs.fetchFromGitHub {
      owner = "fabioluciano";
      repo = "tmux-tokyo-night";
      rev = "ee73d4a9ba6222d7d51492a4e0e797c9249a879c";
      sha256 = "sha256-wWWxO6XNcfKO1TRxBhxd8lJLn7wIxyX4Fm1Nd2Rhbkw=";
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
          set -g @theme_enable_icons 1
          set -g @theme_variation 'night'
          set -g @theme_left_separator ''
          set -g @theme_right_separator ''
        '';
      }
    ];
    extraConfig = ''
      # Enable true colour support
      set -ga terminal-overrides ",xterm-256color:Tc"

      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window

      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Enable vim style splitting
      bind-key v split-window -h
      bind-key s split-window -v

      # Bind Ctl-B Ctl-Y to toggle broadcast to all panes
      bind C-Y set-window-option synchronize-panes

      # Enable yazi image preview to work correctly
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
    '';
  };
}
