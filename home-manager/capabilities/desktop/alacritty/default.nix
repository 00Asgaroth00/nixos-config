{ pkgs, ... }: {

  home.packages = with pkgs; [
    alacritty-theme
  ];

  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      import = [ "~/.config/alacritty/themes/tokyo-night.toml" ];
    };
  };

}