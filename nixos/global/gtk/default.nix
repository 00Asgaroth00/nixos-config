{ pkgs, config, ... }: {

  gtk = {
    enable = true;
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

}