{ pkgs, ... }: {

  fonts = {
    fontconfig.defaultFonts = {
      monospace = [ "FiraCode Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
    fontDir.enable = true;
    packages = with pkgs; [
      nerdfonts
      noto-fonts
      noto-fonts-color-emoji
      inter
      
      # noto-fonts
      # noto-fonts-cjk
      # noto-fonts-emoji
      # liberation_ttf
      # fira-code
      # fira-code-symbols
      # mplus-outline-fonts.githubRelease
      # dina-font
      # proggyfonts
      # material-design-icons
      # inter
      # material-symbols
      # rubik
      # ibm-plex
      # nerdfonts
      # hack-font
      # (nerdfonts.override {fonts = ["Iosevka" "CascadiaCode" "JetBrainsMono" "FiraCode" "DroidSansMono"];})

    ];
  };

}