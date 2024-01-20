{ config, username, ... }: {

  home.file.".config/hypr/hyprpaper.conf" = {
    text = ''
      preload = ~/git_repos/nixos-config/home-manager/capabilities/desktop/wallpapers/lofi-cafe.gif

      wallpaper = eDP-1, ~/git_repos/nixos-config/home-manager/capabilities/desktop/wallpapers/lofi-cafe.gif
    '';
  };

}