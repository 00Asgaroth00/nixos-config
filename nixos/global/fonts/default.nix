{ pkgs, ... }: {

  fonts = {
    fontconfig.defaultFonts.monospace = ["Hack Nerd Font Mono"];
    fontDir.enable = true;
    packages = with pkgs; [
      material-design-icons
      inter
      material-symbols
      rubik
      ibm-plex
      nerdfonts
      hack-font
      (nerdfonts.override {fonts = ["Iosevka" "CascadiaCode" "JetBrainsMono"];})
    ];
  };

  fontProfiles = {
    enable = true;
    monospace = {
      family = "FiraCode Nerd Font";
      package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
    };
    regular = {
      family = "Fira Sans";
      package = pkgs.fira;
    };
  };

}