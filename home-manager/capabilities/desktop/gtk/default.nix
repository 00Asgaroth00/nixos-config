{ pkgs, ... }: {

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = [ pkgs.catppuccin-gtk ];
    };
  };

}