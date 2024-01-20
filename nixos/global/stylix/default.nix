{ pkgs, config, colour_scheme, ... }: {

  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${colour_scheme}.yaml";
    
    wallpaper = config.lib.stylix.mkAnimation {
      animation = ../../../home-manager/capabilities/desktop/wallpapers/lofi-cafe.gif;
      polarity = "dark";
    };
    
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
        # package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
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