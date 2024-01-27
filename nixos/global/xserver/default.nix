{
  pkgs,
  config,
  ...
}: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    displayManager.gdm = {
      enable = false;
      wayland = true;
      debug = false;
    };

    # windowManager.awesome.enable = true;
  };
}
