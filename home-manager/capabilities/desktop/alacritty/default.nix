{ pkgs, ... }: {

  home.packages = with pkgs; [
    alacritty-theme
  ];

  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
  };

  xdg.configFile."hypr/per-app/alacritty.conf".text = ''
    windowrulev2 = workspace 1,class:^(alacritty)$
    windowrulev2 = opacity 0.8 0.8, class:^(alacritty)$
    # windowrulev2 = size 700 300, class:^(kitty)$
    # windowrulev2 = center, class:^(kitty)$
    # TODO make above a single line :)
    # bind = $mainMod, Q, exec, kitty
    bind = ALT, Return, exec, kitty
    # bind = control, escape, exec, kitty -e btm
    # windowrule = float, title:zsh
  '';

}