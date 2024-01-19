{ config, pkgs, ... }:
let
  color = config.lib.stylix.colors;
in {
  programs.kitty = {
    enable = true;

    # font = {
    #   name = config.fontProfiles.monospace.family;
    #   size = 12;
    # };

    settings = {
      # UI and Window Behavior
      window_padding_width = "4 8";
      remember_window_size = "no";
      hide_window_decorations = "yes";
      dynamic_background_opacity = "yes";
      # background_opacity = 1;
      cursor_shape = "beam";

      # font_family = "Berkeley Mono";
      # bold_font = "Berkeley Mono Bold";
      # bold_italic_font = "Berkeley Mono Bold Italic";
      # italic_font = "Operator Mono Book Italic";
      # font_size = "13.0";

      # Terminal Settings
      allow_remote_control = "yes";
      listen_on = "unix:@mykitty";
      confirm_os_window_close = 0;
      copy_on_select = "clipboard";
      clipboard_control = "write-clipboard write-primary no-append";

      # foreground = "#${color.base05}";
      # background = "#${color.base00}";
      # selection_background = "#${color.base05}";
      # selection_foreground = "#${color.base00}";
      # url_color = "#${color.base04}";
      # cursor = "#${color.base05}";
      # active_border_color = "#${color.base03}";
      # inactive_border_color = "#${color.base01}";
      # active_tab_background = "#${color.base00}";
      # active_tab_foreground = "#${color.base05}";
      # inactive_tab_background = "#${color.base01}";
      # inactive_tab_foreground = "#${color.base04}";
      # tab_bar_background = "#${color.base01}";
      # color0 = "#${color.base00}";
      # color1 = "#${color.base08}";
      # color2 = "#${color.base0B}";
      # color3 = "#${color.base0A}";
      # color4 = "#${color.base0D}";
      # color5 = "#${color.base0E}";
      # color6 = "#${color.base0C}";
      # color7 = "#${color.base05}";
      # color8 = "#${color.base03}";
      # color9 = "#${color.base08}";
      # color10 = "#${color.base0B}";
      # color11 = "#${color.base0A}";
      # color12 = "#${color.base0D}";
      # color13 = "#${color.base0E}";
      # color14 = "#${color.base0C}";
      # color15 = "#${color.base07}";
      # color16 = "#${color.base09}";
      # color17 = "#${color.base0F}";
      # color18 = "#${color.base01}";
      # color19 = "#${color.base02}";
      # color20 = "#${color.base04}";
      # color21 = "#${color.base06}";

    };

    # environment = {
    #   THEME = "embark";
    #   TMUX_STATUSLINE = "neoline-embark";
    #   NVIM_STATUSLINE = "neoline";
    # };

    keybindings = {
      "ctrl+alt+l" = "set_background_opacity +0.05";
      "ctrl+alt+h" = "set_background_opacity -0.05";
      "ctrl+alt+enter" = "set_background_opacity default";
      "ctrl+alt+k" = "change_font_size current +2.0";
      "ctrl+alt+j" = "change_font_size current -2.0";
      "ctrl+alt+z" = "change_font_size current 18.0";
      "ctrl+alt+u" = "change_font_size current 12.0";
      "ctrl+alt+backspace" = "change_font_size all 0";
      "ctrl+alt+period" = "send_text current pass fzf\r";
      "ctrl+alt+p" = "send_text all rally.sh\\r";
      "ctrl+alt+t" = "send_text all sudo nixos-rebuild switch\\r";
      "ctrl+alt+r" = "send_text all zk runbooks\r";
      "ctrl+alt+c" = "send_text all zk cast\u0020";
    };

    # extraConfig = ''
    #   include ./themes/embark.conf
    #   # Seti
    #   symbol_map U+E5FA-U+E6B1 RobotoMono Nerd Font
    #   # Devicons
    #   symbol_map U+E700-U+E7C5 RobotoMono Nerd Font
    #   # Font Awesome
    #   symbol_map U+F000-U+F2E0 RobotoMono Nerd Font
    #   # Font Awesome Extension
    #   symbol_map U+E200-U+E2A9 RobotoMono Nerd Font
    #   # Material Design
    #   symbol_map U+F0001-U+F1AF0 RobotoMono Nerd Font
    #   # Weather
    #   symbol_map U+E300-U+E3E3 RobotoMono Nerd Font
    #   # Octicons
    #   symbol_map U+F400-U+F532,U+2665-U+26A1 RobotoMono Nerd Font
    #   # Powerline
    #   symbol_map U+E0A0-U+E0A2,U+E0B0-U+E0B3 RobotoMono Nerd Font
    #   # Powerline Extras
    #   symbol_map U+E0A3,U+E0B4-U+E0C8,U+E0CA-U+E0D4 RobotoMono Nerd Font
    #   # IEC Power
    #   symbol_map U+23FB-U+23FE,U+2B58 RobotoMono Nerd Font
    #   # Font Logos
    #   symbol_map U+F300-U+F372 RobotoMono Nerd Font
    #   # Pomicons
    #   symbol_map U+E000-U+E00A RobotoMono Nerd Font
    #   # Codeicons
    #   symbol_map U+EA60-U+EBEB RobotoMono Nerd Font

    #   # symbol_map U+EA76 VictorMono Nerd Font
    #   symbol_map U+f101-U+f25c nonicons
    # '';

  };

  # xdg.configFile."kitty/themes" = {
  #   source = ./themes;
  #   recursive = true;
  # };

  # xdg.configFile."kitty/kitty-light.conf".text = ''
  #   include ./kitty.conf
  #   env THEME=tantric
  #   env TMUX_STATUSLINE=cleanline
  #   env NVIM_STATUSLINE=rocket-line
  #   include ./themes/tantric.conf
  # '';

  # xdg.dataFile."fonts/Lilex" = {
  #   source = ./Lilex;
  #   recursive = true;
  # };
}