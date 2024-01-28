{
  pkgs,
  config,
  ...
}: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    displayManager.gdm = {
      enable = true;
      wayland = true;
      debug = false;
    };

    desktopManager.gnome.enable = true; # when enabled be sure to disable assiciated options in configuration.nix and home-manager base user
    # windowManager.awesome.enable = true;
  };
}
