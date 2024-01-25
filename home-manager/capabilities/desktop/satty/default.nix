{ inputs, pkgs, ... }: {

  home.packages = with pkgs; [
    satty   # screenshot tool
    inputs.hyprland-contrib.packages.x86_64-linux.grimblast
    # hyprland-contrib.grimblast
  ];

  xdg.configFile."hypr/per-app/satty.conf".text = ''
    # Media control
    bind = , Print, exec, grim -g "$(slurp -o -r -c '#ff0000ff')" - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png
  '';

}