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
    extraPackages = with pkgs; [
      docker-buildx
      docker-compose

      # nvidia-docker # inject this for main workstation, dont have nvidia gpu on laptop
    ];
    extraPackages = lib.mkIf (config.networking.hostName == "arakasi") [pkgs.nvidia-docker];
  };
}
