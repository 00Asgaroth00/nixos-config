{
  inputs,
  pkgs,
  config,
  ...
}: {
  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    packages = pkgs.hyprland
  };

  xdg = {
      mime = {
        enable = true;
      };
    portal = {
      enable = true;
      extraPortals = [
        # inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
	pkgs.xdg-desktop-portal-hyprland
	pkgs.xdg-desktop-portal-gtk # required for gdm
        # pkgs.xdg-desktop-portal-wlr
      ];
      # configPackages = [ pkgs.hyprland ];
    };
  };
}
