{pkgs, ...}: {
  home.packages = with pkgs; [
    microsoft-edge-beta # ms edge browser
  ];

  xdg.configFile."hypr/per-app/firefox.conf".text = ''
    bind = $mainMod, E, exec, ${pkgs.micrsoft-edge-beta}/opt/microsoft/msedge-beta/microsoft-edge
    exec-once = [workspace 2 silent] ${pkgs.micrsoft-edge-beta}/opt/microsoft/msedge-beta/microsoft-edge
  '';
}
