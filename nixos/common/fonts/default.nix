{pkgs, ...}: {
  fonts = {
    fontconfig.defaultFonts = {
      monospace = ["FiraCode Nerd Font"];
      emoji = ["Noto Color Emoji"];
    };
    fontDir.enable = true;
    packages = with pkgs; [
      nerdfonts
      noto-fonts
      noto-fonts-color-emoji
      inter
      hack-font
    ];
  };
}
