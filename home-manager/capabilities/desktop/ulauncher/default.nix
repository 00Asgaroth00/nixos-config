{ pkgs, home-manager, username, ... }: 
let
  hm = home-manager.nixosModules.home-manager.home-manager;
in {

  users.users.${username}.packages = with pkgs; [ ulauncher ];

  hm.users.${username}.home.file.".config/hypr/per-app/ulauncher.conf" = {
    text = ''
      exec-once = sleep 1 && ulauncher --hide-window
      windowrulev2 = noborder, class:^(ulauncher)$
      windowrulev2 = noshadow, class:^(ulauncher)$
      windowrulev2 = noblur, class:^(ulauncher)$
      bind = $mainMod, R, exec, ulauncher-toggle
    '';
  };

}