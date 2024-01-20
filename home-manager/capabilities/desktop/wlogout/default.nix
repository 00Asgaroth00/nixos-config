{ pkgs, ... }: {

  imports = [
    ./layout.nix
  ];

  programs.wlogout.enable = true;

  home.packages = with pkgs; [
    swaylock-effects
    dunst
  ];

  home.file.".config/hypr/per-app/wlogout.conf" = {
    text = ''
      bind = $mainMod, L, exec, ${pkgs.wlogout}/bin/wlogout -p layer-shell
      windowrulev2 = animation snappy, float, fullscreen, class:^(wlogout)$
    '';
  };

}