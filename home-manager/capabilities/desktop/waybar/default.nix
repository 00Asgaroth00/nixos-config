{ pkgs, ... }: {

  imports = [ 
    ./config.jsonc.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    pavucontrol
    pamixer
    iwgtk
    blueberry
  ]

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