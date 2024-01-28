{...}: {

  # see this for an alternative implementation 
  #    https://discord.com/channels/568306982717751326/741347063077535874/1125784739618496562

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/Git/nixos-config/home-manager/capabilities/desktop/wallpapers/zi2Bbda-anime-dragon-wallpaper.jpg
    wallpaper = HDMI-A-1, ~/Git/nixos-config/home-manager/capabilities/desktop/wallpapers/zi2Bbda-anime-dragon-wallpaper.jpg
    wallpaper = HDMI-A-2, ~/Git/nixos-config/home-manager/capabilities/desktop/wallpapers/zi2Bbda-anime-dragon-wallpaper.jpg
    wallpaper = DP-1, ~/Git/nixos-config/home-manager/capabilities/desktop/wallpapers/zi2Bbda-anime-dragon-wallpaper.jpg
  '';
}
