{ pkgs, ... }: 
{

  # application launcher
  #
  # see 
  #   https://youtu.be/dvMsYCGzWaM 
  # for more tweaks

  home.packages = with pkgs; [ ulauncher ];

  home.file.".config/hypr/per-app/ulauncher.conf" = {
    text = ''
      exec-once = sleep 1 && ulauncher --hide-window
      windowrulev2 = noborder, class:^(ulauncher)$
      windowrulev2 = noshadow, class:^(ulauncher)$
      windowrulev2 = noblur, class:^(ulauncher)$
      bind = $mainMod, R, exec, ulauncher-toggle
    '';
  };

}