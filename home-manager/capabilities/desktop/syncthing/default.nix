{
  lib,
  pkgs,
  ...
}: {
  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
    };
  };

  # tray starts before hyprland tray is available
  # see: https://github.com/nix-community/home-manager/issues/3416
  systemd.user.services = {
    syncthingtray.Service = {
      ExecStart = lib.mkForce "${pkgs.syncthingtray}/bin/syncthingtray --wait";
    };
  };
}
