{ pkgs, config, ... }: {
  
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };

    windowManager.awesome.enable = true;
  };

}