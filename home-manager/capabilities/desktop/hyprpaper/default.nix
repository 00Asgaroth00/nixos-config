{
  osConfig,
  pkgs,
  ...
}: {
  imports = [
    (./. + "/${osConfig.networking.hostName}.nix")
  ];

  # wallpaper manager

  home.packages = with pkgs; [hyprpaper];

  xdg.configFile."hypr/per-app/hyprpaper.conf".text = ''
    exec-once = ${pkgs.hyprpaper}/bin/hyprpaper
  '';
}
