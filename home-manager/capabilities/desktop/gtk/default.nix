{ lib, pkgs, ... }: {

  home.packages = with pkgs; [
    catppuccin-gtk
  ];

  gtk = {
    enable = true;
    theme = {
      name = lib.mkDefault "Catppuccin-Macchiato-Compact-Pink-Dark";
      # package = pkgs.catppuccin-gtk.override {
      #   accents = [ "pink" ];
      #   size = "compact";
      #   tweaks = [ "rimless" "black" ];
      #   variant = "macchiato";
      # };
    };
  };

}