{ pkgs, ... }: {

  programs.wofi = {
    enable = true;
    package = pkgs.wofi;
  };

  xdg.configFile."hypr/per-app/wofi.conf".text = ''
    bind = ALT, d, exec, ${pkgs.wofi}/bin/wofi --show drun -I
  '';

}