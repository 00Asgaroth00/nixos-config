{ pkgs, ... }: {

  # Enable XDG integration
  xdg = {
    mime.enable = true;
    portal = {
      enable = true;
      extraPortals = [ ];
      configPackages = [ ];
    };
  };

}