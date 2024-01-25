{ pkgs, ... }: {

  home.programs = with pkgs; [
    alacritty-theme
  ];

  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      import = [ ${xdg.configFile}/alacritty/themes/tokyo-night.toml ];
    };
  };

}