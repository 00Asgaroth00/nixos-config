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
      lib.mkIf
      (config.networking.hostName == "arakasi")
      nvidia-docker
      # nvidia-docker # inject this for main workstation, dont have nvidia gpu on laptop
    ];
  };
}
