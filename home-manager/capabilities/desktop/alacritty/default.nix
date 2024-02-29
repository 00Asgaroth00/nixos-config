{
  lib,
  pkgs,
  ...
}: {
  # https://alacritty.org/config-alacritty.html

  home.packages = with pkgs; [
    alacritty-theme
  ];

  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      window = {
        opacity = lib.mkForce 0.8;
      };
      shell = {
        # program = "${pkgs.zsh}/bin/zsh";
        program = "${pkgs.tmux}/bin/tmux";
        args = ["-2" "-l"];
      };
      scrolling = {
        history = 100000;
        multiplier = 3;
      };
      selection = {
        save_to_clipboard = true;
      };
      cursor = {
        style = {
          shape = "block";
          blinking = "on";
        };
        unfocused_hollow = true;
      };
    };
  };

  # xdg.configFile."hypr/per-app/alacritty.conf".text = ''
  #   exec-once = ${pkgs.alacritty}/bin/alacritty
  #   windowrulev2 = workspace 1,class:^(alacritty)$
  #   windowrulev2 = opacity 0.8 0.8, class:^(alacritty)$
  #   bind = ALT, Return, exec, alacritty
  # '';
}
