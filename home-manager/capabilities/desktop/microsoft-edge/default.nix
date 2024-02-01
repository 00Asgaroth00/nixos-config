{pkgs, ...}: {
  home.packages = with pkgs; [
    microsoft-edge-beta # ms edge browser
  ];

  xdg.configFile."hypr/per-app/microsoft-edge.conf".text = ''
    bind = $mainMod, M, exec, ${pkgs.microsoft-edge-beta}/opt/microsoft/msedge-beta/microsoft-edge
    exec-once = [workspace 8 silent] ${pkgs.microsoft-edge-beta}/opt/microsoft/msedge-beta/microsoft-edge
  '';
}
