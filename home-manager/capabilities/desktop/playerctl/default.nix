{ pkgs, ... }: {

  services.playerctld = {
    enable = true;
    package = pkgs.playerctl;
  };

  xdg.configFile."hypr/per-app/playerctl.conf".text = ''
    # Media control
    bind = , XF86AudioPrev, exec, playerctl previous
    bind = , XF86AudioNext, exec, playerctl next
    bind = , XF86AudioPlay, exec, playerctl play-pause
  '';

}