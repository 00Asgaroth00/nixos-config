{ pkgs, ... }: {

  home.packages = with pkgs; [
    strawberry    # media player
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    # gst_all_1.gst-plugins-bad
    # gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
    vlc
  ];

  # xdg.configFile."hypr/per-app/bemoji.conf".text = ''
  #   # Media control
  #   bind = , XF86AudioPlay, exec, ${pkgs.strawberry}/bin/strawberry -t
  #   bind = , XF86AudioNext, exec, ${pkgs.strawberry}/bin/strawberry -f
  #   bind = , XF86AudioPrev, exec, ${pkgs.strawberry}/bin/strawberry -r
  #   bind = , XF86AudioStop, exec, ${pkgs.strawberry}/bin/strawberry -s
  # '';

}