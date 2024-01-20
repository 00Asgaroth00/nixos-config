{ pkgs, ... }: {

  imports = [ 
    ./config.jsonc.nix
  ];

  home.packages = with pkgs; [
    brightnessctl # brightness control from waybar
    pavucontrol   # audio control from waybar
    pamixer       # cli audio control
    iwgtk         # wifi network management
    blueberry     # bluetooth management
  ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar.override ( oldAttrs: { pulseSupport = true; } );
  };

  home.file.".config/hypr/per-app/waybar.conf" = {
    text = ''
      exec-once = ${pkgs.waybar}/bin/waybar
    '';
  };

}