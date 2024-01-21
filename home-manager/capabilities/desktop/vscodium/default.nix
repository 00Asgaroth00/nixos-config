{ pkgs, lib, ... }: {

  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = lib.mkForce "Tokyo Night";
    };
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      enkia.tokyo-night
      yzhang.markdown-all-in-one
      kamadorueda.alejandra
      bbenoist.nix
      mkhl.direnv
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
    ];
  };

  xdg.configFile."hypr/per-app/vscodium.conf".text = ''
    windowrule = tile, title:VSCodium
    bind = $mainMod, K, exec, codium
  '';

}