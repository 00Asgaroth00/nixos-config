{pkgs, ...}: {
  home.packages = with pkgs; [
    nwg-panel
    nwg-menu
    gopsuinfo
  ];
}
