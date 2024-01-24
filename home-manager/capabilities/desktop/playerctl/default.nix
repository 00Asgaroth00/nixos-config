{ pkgs, ... }: {

  services.playerctld = {
    enable = true;
    package = pkgs.playerctl;
  };

  xdg.configFile."hypr/per-app/playerctl.conf".text = ''
    # Media control
    bind = , XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous
    bind = , XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next
    bind = , XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause
    bind = , XF86AudioPause, exec, ${pkgs.playerctl}/bin/playerctl play-pause
  '';

}