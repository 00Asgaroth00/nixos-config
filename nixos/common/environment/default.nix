{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      neovim
      git
      wget
      neofetch
      # yubikey-personalization
      # yubikey-manager
      # pavucontrol
      pulseaudio
      # jack2
      libcamera
      pciutils
      hwloc
      usbutils
    ];

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/Git/nixos-config/\\#${networking.hostName} --show-trace";
    };

    shells = with pkgs; [
      zsh
      bash
    ];
  };
}
