{ pkgs, ... }: {

  # imports = [
  #   ./layout.nix
  # ];

  home.packages = with pkgs; [
    swaylock-effects
    dunst
  ];

  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;
    layout = [
      {
        label = "lock";
        action = "sleep 0.4 && swaylock --screenshots --effect-blur 3x5 --fade-in 1 --effect-vignette 0.1:0.8";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit 0";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "reboot";
        action = "dunstify -a wlogout 'rebooting in 5, please wait' -u 2 && sleep 5 && systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "󱖒";
        keybind = "u";
      }
    ];
  };

  home.file.".config/hypr/per-app/wlogout.conf" = {
    text = ''
      bind = $mainMod, L, exec, ${pkgs.wlogout}/bin/wlogout -p layer-shell
      windowrulev2 = animation snappy, float, fullscreen, class:^(wlogout)$
    '';
  };

}