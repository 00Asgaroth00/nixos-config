{ lib, pkgs, ... }: {

  # home.packages = with pkgs; [
  #   catppuccin-gtk
  # ];

  gtk = {
    enable = true;
    font = {
      size = 12;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = lib.mkDefault "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk
      # package = pkgs.catppuccin-gtk.override {
      #   accents = [ "pink" ];
      #   size = "compact";
      #   tweaks = [ "rimless" "black" ];
      #   variant = "macchiato";
      # };
    };
  };

}