{
  lib,
  config,
  pkgs,
  username,
  ...
}: {
  users.users.${username}.extraGroups = ["docker" "libvirtd"];

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
      logDriver = "journald";
      storageDriver = "zfs";
      # extraPackages = with pkgs; [
      #   docker-buildx
      #   docker-compose
      # ];
      extraOptions = "--insecure-registry harbor.home.ie";
      extraPackages = lib.mkMerge [
        [pkgs.docker-buildx pkgs.docker-compose]
        (lib.mkIf (config.networking.hostName == "arakasi") [pkgs.nvidia-docker])
      ];
    };
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  services.spice-vdagentd.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
  ];

  # virtualisation.vmware = {
  #   host = {
  #     enable = true;
  #     package = pkgs.vmware-workstation;
  #   };
  # };
}
