{
  lib,
  config,
  pkgs,
  username,
  ...
}: {
  users.users.${username}.extraGroups = ["docker"];

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    logDriver = "journald";
    storageDriver = "zfs";
    # extraPackages = with pkgs; [
    #   docker-buildx
    #   docker-compose
    # ];
    extraPackages = lib.mkMerge [
      [pkgs.docker-buildx pkgs.docker-compose]
      (lib.mkIf (config.networking.hostName == "arakasi") [pkgs.nvidia-docker])
    ];
  };
}