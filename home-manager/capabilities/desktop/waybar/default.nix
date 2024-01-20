{ pkgs, ... }: {

  imports = [ 
    ./config.jsonc.nix
  ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar.override ( oldAttrs: { pulseSupport = true; } );
  };

  home.file.".config/hypr/per-app/waybar.conf" = {
    text = ''
      exec-once = ${pkgs.waybar}
    '';
  };

}