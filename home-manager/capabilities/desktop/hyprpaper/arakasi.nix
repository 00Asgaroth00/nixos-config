{...}: {
  # wallpaper manager

  #   home.packages = with pkgs; [hyprpaper];

  #   xdg.configFile."hypr/per-app/hyprpaper.conf".text = ''
  #     exec-once = ${pkgs.hyprpaper}/bin/hyprpaper
  #   '';

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/Git/nixos-config/home-manager/capabilities/desktop/wallpapers/zi2Bbda-anime-dragon-wallpaper.jpg
    wallpaper = HDMI-A-1, ~/Git/nixos-config/home-manager/capabilities/desktop/wallpapers/zi2Bbda-anime-dragon-wallpaper.jpg
  '';
}
