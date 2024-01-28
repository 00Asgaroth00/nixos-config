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

  # xdg = {
  #   portal = {
  #     enable = true;
  #     mime = {
  #       enable = true;
  #     };
  #     extraPortals = with pkgs; [
  #       xdg-desktop-portal-hyprland
  #       # xdg-desktop-portal-wlr
  #     ];
  #     configPackages = [ pkgs.hyprland ];
  #   };
  # };
}
