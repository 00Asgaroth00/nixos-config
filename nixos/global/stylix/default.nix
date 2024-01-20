{ pkgs, config, stylix, colour_scheme, ... }: {

  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${colour_scheme}.yaml";
    
    image = ../../../home-manager/capabilities/desktop/wallpapers/lofi-cafe.gif;
        
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