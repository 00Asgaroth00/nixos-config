{ pkgs, config, ... }: {

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

}