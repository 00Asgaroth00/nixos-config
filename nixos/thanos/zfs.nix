{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "ef08dd92";
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  boot.zfs.devNodes = "/dev/disk/by-partlabel";
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.generationsDir.copyKernels = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.copyKernels = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.zfsSupport = true;

  boot.loader.grub.extraPrepareConfig = ''
    mkdir -p /boot/efis
    for i in  /boot/efis/*; do mount $i ; done

    mkdir -p /boot/efi
    mount /boot/efi
  '';

  boot.loader.grub.extraInstallCommands = ''
    CMD_MKTEMP=$(command -v mktemp)
    if [[ -n "$CMD_MKTEMP" ]]; then
      echo "mktemp not found, please install it";
      exit 1
    else
      ESP_MIRROR=$($CMD_MKTEMP -d)
      cp -r /boot/efi/EFI $ESP_MIRROR
      for i in /boot/efis/*; do
        cp -r $ESP_MIRROR/EFI $i
      done
      rm -rf $ESP_MIRROR
    fi
  '';

  boot.loader.grub.devices = [
    "/dev/nvme0n1"
  ];

  # users.users.root.initialHashedPassword = "$6$JwCXs8pAVWXO.7fH$3aQlsAFgeDnw9N0n.bIG5ZMW1/krpx42HX3PADsrydhB1y0gYO8Cam/RotEQW9I8izxzngdKuvBNQbJfnaWGm1";

}
