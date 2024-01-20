{ pkgs, ... }: {

  # wallpaper manager

  home.packages = with pkgs; [ hyprpaper ];

  xdg.configFile."hypr/per-app/hyprpaper.conf".text = ''
    exec-once = ${pkgs.hyprpaper}/bin/hyprpaper
  '';


  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/git_repos/nixos-config/home-manager/capabilities/desktop/wallpapers/zi2Bbda-anime-dragon-wallpaper.jpg
    wallpaper = eDP-1, ~/git_repos/nixos-config/home-manager/capabilities/desktop/wallpapers/zi2Bbda-anime-dragon-wallpaper.jpg
  '';

}