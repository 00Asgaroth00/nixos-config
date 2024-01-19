{ pkgs, ... }: {

  fonts = {
    fontconfig.defaultFonts.monospace = ["Hack Nerd Font Mono"];
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      material-design-icons
      inter
      material-symbols
      rubik
      ibm-plex
      nerdfonts
      hack-font
      (nerdfonts.override {fonts = ["Iosevka" "CascadiaCode" "JetBrainsMono" "FiraCode" "DroidSansMono"];})
    ];
  };

  # fontProfiles = {
  #   enable = true;
  #   monospace = {
  #     family = "FiraCode Nerd Font";
  #     package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
  #   };
  #   regular = {
  #     family = "Fira Sans";
  #     package = pkgs.fira;
  #   };
  # };

}