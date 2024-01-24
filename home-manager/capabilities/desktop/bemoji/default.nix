{ pkgs, ... }: {

  home.packages = with pkgs; [
    bemoji        # Emoji selector
    wtype         # xdotool for wayland
    wl-clipboard  # cli copy/paste tools for wayland
  ];

  home.sessionVariables = {
    BEMOJI_PICKER_CMD = "${pkgs.wofi}/bin/wofi";
    BEMOJI_CLIP_CMD = "${pkgs.wl-clipboard}/bin/wl-copy";
    BEMOJI_TYPE_CMD = "${pkgs.wtype}/bin/wtype";
  };
  
  xdg.configFile."hypr/per-app/bemoji.conf".text = ''
    bind = ALT, e, exec, ${pkgs.bemoji}/bin/bemoji -t
  '';

}