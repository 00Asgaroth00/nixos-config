{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
  };

  xdg = {
    mime = {
      enable = true;
    };
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk # required for gdm
        # pkgs.xdg-desktop-portal-wlr
      ];
      # configPackages = [ pkgs.hyprland ];
    };
  };
}
