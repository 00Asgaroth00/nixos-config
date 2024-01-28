{
  inputs,
  pkgs,
  config,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    # packages = pkgs.hyprland
  };

  xdg = {
    portal = {
      enable = true;
      mime = {
        enable = true;
      };
      extraPortals = [
        inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
	inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-gtk # required for gdm
        # xdg-desktop-portal-wlr
      ];
      # configPackages = [ pkgs.hyprland ];
    };
  };
}
