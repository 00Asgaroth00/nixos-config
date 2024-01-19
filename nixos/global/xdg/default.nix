{ pkgs, config, ... }: {

  # Enable XDG integration
  xdg = {
    enable = true;
    mime.enable = true;
    portal = {
      enable = true;
      extraPortals = [ ];
      configPackages = [ ];
    };
  };

}