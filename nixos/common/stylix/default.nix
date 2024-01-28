{
  colour_scheme,
  config,
  pkgs,
  stylix,
  ...
}: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${colour_scheme}.yaml";

    image = ../../../home-manager/capabilities/desktop/wallpapers/zi2Bbda-anime-dragon-wallpaper.jpg;

    fonts = {
      serif = {
        package = pkgs.fira;
        name = "Fira Sans";
      };
      sansSerif = {
        package = pkgs.fira;
        name = "Fira Sans";
      };
      monospace = {
        package = pkgs.nerdfonts;
        name = "FiraCode Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
