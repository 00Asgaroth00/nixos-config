{ ... }: {

  programs.kitty = {
    enable = true;
    settings = {
      repaint_delay = "12";
      sync_to_monitor = "yes";
      # background_opacity = "1.0";
      background_blur = "1";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      # font_family = "Hack Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = "10.0";
      cursor_shape = "beam";
      cursor_beam_thickness = "2.0";
      cursor_blink_interval = "0.5";
      strip_trailing_spaces = "always";
    };
    keybindings = {
      "ctrl+alt+l" = "set_background_opacity +0.05";
      "ctrl+alt+h" = "set_background_opacity -0.05";
      "ctrl+alt+enter" = "set_background_opacity default";
      "ctrl+alt+k" = "change_font_size current +2.0";
      "ctrl+alt+j" = "change_font_size current -2.0";
      "ctrl+alt+z" = "change_font_size current 18.0";
      "ctrl+alt+u" = "change_font_size current 12.0";
      "ctrl+alt+backspace" = "change_font_size all 0";
      # "ctrl+alt+period" = "send_text current pass fzf\r";
      # "ctrl+alt+p" = "send_text all rally.sh\\r";
      # "ctrl+alt+t" = "send_text all sudo nixos-rebuild switch\\r";
      # "ctrl+alt+r" = "send_text all zk runbooks\r";
      # "ctrl+alt+c" = "send_text all zk cast\u0020";
    };
  };

  xdg.configFile."hypr/per-app/kitty.conf".text = ''
    windowrulev2 = workspace 1,class:^(kitty)$
    windowrulev2 = opacity 0.8 0.8, class:^(kitty)$
    # windowrulev2 = size 700 300, class:^(kitty)$
    # windowrulev2 = center, class:^(kitty)$
    # TODO make above a single line :)
    # bind = $mainMod, Q, exec, kitty
    bind = ALT, Return, exec, kitty
    # bind = control, escape, exec, kitty -e btm
    # windowrule = float, title:zsh
  '';

}