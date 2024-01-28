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

    desktopManager.gnome.enable = true; # used for testing only
    # windowManager.awesome.enable = true;
  };
}
