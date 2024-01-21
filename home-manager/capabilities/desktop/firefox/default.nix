{ pkgs, inputs, username, ... }: {

  # see some user configurations below for inspiration
  #  https://github.com/gvolpe/nix-config/blob/6feb7e4f47e74a8e3befd2efb423d9232f522ccd/home/programs/browsers/firefox.nix
  #  https://github.com/TLATER/dotfiles/blob/b39af91fbd13d338559a05d69f56c5a97f8c905d/home-config/config/graphical-applications/firefox.nix
  #  https://github.com/Misterio77/nix-config/blob/main/home/misterio/features/desktop/common/firefox.nix
  #  https://gitlab.com/usmcamp0811/dotfiles/-/blob/fb584a888680ff909319efdcbf33d863d0c00eaa/modules/home/apps/firefox/default.nix


  home.sessionVariables = { 
    MOZ_ENABLE_WAYLAND = "1"; 
  };

  programs.firefox = {
    enable = true;
    profiles.${username} = {
      id = 0; # default profile
      bookmarks = {};
      # https://discourse.nixos.org/t/firefox-extensions-with-home-manager/34108
      # https://gitlab.com/rycee/nur-expressions/blob/master/pkgs/firefox-addons/generated-firefox-addons.nix
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        privacy-badger
        i-dont-care-about-cookies # auto-accept cookies, use only with ublock-origin and provacy-badger
        fastforwardteam
        unpaywall
        keepassxc-browser
      ];
      settings = {
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.download.useDownloadDir" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","downloads-button","library-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":18,"newElementCount":4}'';
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.pocket.enabled" = false;
        "identity.fxaccounts.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "signon.rememberSignons" = false;
      };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };

  xdg.configFile."hypr/per-app/firefox.conf".text = ''
    bind = $mainMod, F, exec, firefox
    # bind = $mainMod, W, exec, firefox -p work
    exec-once = [workspace 2 silent] firefox
  '';

}