{
  config,
  pkgs,
  ...
}: {
  environment = {
    shells = with pkgs; [
      zsh
      bash
    ];

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/Git/nixos-config/\\#${config.networking.hostName} --show-trace";
    };

    systemPackages = with pkgs; [
      # dbus
      # wmctrl
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
      cpufrequtils
    ];
  };
}
