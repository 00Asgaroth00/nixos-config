{ pkgs, ... }: {

  home.packages = with pkgs; [
    strawberry    # media player
  ];

  # xdg.configFile."hypr/per-app/bemoji.conf".text = ''
  #   # Media control
  #   bind = , XF86AudioPlay, exec, ${pkgs.strawberry}/bin/strawberry -t
  #   bind = , XF86AudioNext, exec, ${pkgs.strawberry}/bin/strawberry -f
  #   bind = , XF86AudioPrev, exec, ${pkgs.strawberry}/bin/strawberry -r
  #   bind = , XF86AudioStop, exec, ${pkgs.strawberry}/bin/strawberry -s
  # '';

}