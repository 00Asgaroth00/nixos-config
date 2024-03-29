{ pkgs, ... }: {

  # to test, 'notify-send test "test message"'

  imports = [
    ./dunst_config.nix
  ];

  services.dunst.enable = true;

  home.packages = with pkgs; [ 
    libnotify
    dunst 
  ];

  xdg.configFile."hypr/per-app/dunst.conf".text = ''
    bind = $mainMod, X, exec, ${pkgs.dunst}/bin/dunstctl history-pop
  '';


}