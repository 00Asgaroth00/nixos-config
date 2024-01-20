{config, ... }: {
  stylix = {
    wallpaper = config.lib.stylix.mkAnimation {
      animation = ../wallpapers/lofi-cafe.gif;
      polarity = "dark";
    };
  };
}