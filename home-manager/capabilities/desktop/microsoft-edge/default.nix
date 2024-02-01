{pkgs, ...}: {
  home.packages = with pkgs; [
    microsoft-edge-beta # ms edge browser
  ];

  xdg.configFile."hypr/per-app/firefox.conf".text = ''
    bind = $mainMod, /, exec, ${pkgs.microsoft-edge-beta}/opt/microsoft/msedge-beta/microsoft-edge
    exec-once = [workspace 2 silent] ${pkgs.microsoft-edge-beta}/opt/microsoft/msedge-beta/microsoft-edge
  '';
}
