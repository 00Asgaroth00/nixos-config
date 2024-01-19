{ pkgs, ... }: {

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  programs.hyprland.enable = true;

  # Hyprland specific xdg portal, augments ../xdg/default.nix
  xdg = {
    extraPortals = with pkgs; [ 
        xdg-desktop-portal-hyprland 
        xdg-desktop-portal-wlr
      ];
    configPackages = [ pkgs.hyprland ];
  };

}