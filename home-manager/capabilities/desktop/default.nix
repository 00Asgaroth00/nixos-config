{
  pkgs,
  home-manager,
  ...
}: {
  imports = [
    ./hyprland
    ./gtk
  ];

  home.packages = with pkgs; [
    slack
    # teams-for-linux # micrsoft teams unofficial wrapper
    # webcord
    # zoom-us
    xfce.thunar
    xfce.thunar-archive-plugin
    gnome.nautilus
    lxappearance
    arandr
    # gnucash
    # morgen
    mpv
    # tidal-hifi
    font-manager
    wireshark # network anaylyzer
    twinkle # voip soft phone
    linphone # voip softphone
    openlens # kubernetes ide
    discord # cross platform voice/text chat
    nwg-displays # gui for configuring screen layouts
    wlr-randr # needed for nwg-displays
    zapzap # whatsapp linux tool
    signal-desktop # signal messanger
    element-desktop # matrix collaboration client
    calibre # e-book software
    notepadqq # notepad++ like editor for linux
  ];

  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     color-scheme = "prefer-dark";
  #     gtk-theme = "Catppuccin-Frappe-Standard-Blue-light";
  #     gtk-theme = "Catppuccin-Mocha-Standard-Blue-Dark";
  #     cursor-theme = "Bibata-Modern-Ice";
  #     icon-theme = "Fluent-dark";
  #   };
  # };

  gtk = {
    enable = true;
    # theme = {
    #   name = "Catppuccin-Mocha-Standard-Blue-Dark";
    #   # name = "Catppuccin-Frappe-Standard-Blue-light";
    #   package = pkgs.catppuccin-gtk.override {
    #     accents = [ "blue" ];
    #     size = "standard"; # compact
    #     tweaks = [ ];
    #     variant = "mocha";
    #   };
    # };

    # cursorTheme = {
    #   name = "Bibata-Modern-Ice";
    #   package = pkgs.bibata-cursors;
    # };

    # iconTheme = {
    #   name = "Fluent-dark";
    #   package = pkgs.fluent-icon-theme;
    # };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    # style.name = "adwaita-gtk";
  };

  # home.sessionVariables.GTK_THEME = "Catppuccin-Frappe-Standard-Blue-light";
  # home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
}
