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

    shells = with pkgs; [
      zsh
      bash
    ];
  };
}
