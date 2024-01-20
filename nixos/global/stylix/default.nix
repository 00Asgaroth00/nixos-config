{ pkgs, config, colour_scheme, ... }: {

  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${colour_scheme}.yaml";
    
    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
      sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
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