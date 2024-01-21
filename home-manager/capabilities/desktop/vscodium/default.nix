{ pkgs, lib, ... }: {

  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = lib.mkForce "Tokyo Night";
    };
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      enkia.tokyo-night
      kamadorueda.alejandra
      mkhl.direnv
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
      timonwong.shellcheck
      yzhang.markdown-all-in-one
    ];
  };

  xdg.configFile."hypr/per-app/vscodium.conf".text = ''
    windowrule = tile, title:VSCodium
    bind = $mainMod, K, exec, codium
  '';

}