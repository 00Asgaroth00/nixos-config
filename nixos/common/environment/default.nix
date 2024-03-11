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
      ouch # [de]compression tool - https://github.com/ouch-org/ouch

      # needed for kde plasman 6
      aha
      clinfo
      glxinfo
      vulkan-tools
      wayland-utils
    ];
  };
}
