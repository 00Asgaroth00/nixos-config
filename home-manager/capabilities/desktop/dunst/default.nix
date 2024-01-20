{ pkgs, ... }: {

  import = [
    ./dunst_config.nix
  ];

  services.dunst.enable = true;

  home.packages = with pkgs; [ dunst ];

  home.file.".config/hypr/per-app/dunst.conf" = {
    text = ''
      bind = $mainMod, X, exec, ${pkgs.dunst}/bin/dunstctl history-pop
    '';
  };

}