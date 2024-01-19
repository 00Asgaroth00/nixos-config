{ pkgs, config, ... }: {

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  programs.hyprland.enable = true;

  # Hyprland specific xdg portals, augments ../xdg/default.nix
  xdg = {
    portal = {
      extraPortals = with pkgs; [ 
        xdg-desktop-portal-hyprland 
        xdg-desktop-portal-wlr
      ];
      configPackages = [ pkgs.hyprland ];
    };
  };

}