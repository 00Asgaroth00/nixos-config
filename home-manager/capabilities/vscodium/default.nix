{ pkgs, config, ... }: {

  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "terminal.integrated.fontFamily" = config.fontProfiles.monospace.family;
      "editor.fontFamily" = config.fontProfiles.regular.family;
    };
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      enkia.tokyo-night
      yzhang.markdown-all-in-one
      kamadorueda.alejandra
      bbenoist.nix
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
    ];
  };

  home.file.".config/hypr/per-app/vscodium.conf" = {
    text = ''
      windowrule = tile, title:VSCodium
      bind = $mainMod, K, exec, codium
    '';
  };

}