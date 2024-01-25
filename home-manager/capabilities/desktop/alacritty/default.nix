{ pkgs, ... }: {

  home.packages = with pkgs; [
    alacritty-theme
  ];

  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      window = {
        opacity = 0.8;
      };
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = [ "-l" ];
      };
    };
  };

  xdg.configFile."hypr/per-app/alacritty.conf".text = ''
    windowrulev2 = workspace 1,class:^(alacritty)$
    windowrulev2 = opacity 0.8 0.8, class:^(alacritty)$
    bind = ALT, Return, exec, alacritty
  '';

}