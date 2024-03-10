{
  pkgs,
  lib,
  ...
}: let
  custom-extensions = {
    kamailio-syntax = pkgs.vscode-utils.extensionFromVscodeMarketplace {
      publisher = "miconda";
      name = "kamailio-syntax";
      version = "1.0.8";
      sha256 = "sha256-8wGof/ESIjWk31U4iIl+oYoGD8B+ToTVucqnGK0RYGM=";
    };
    tokyo-night = pkgs.vscode-utils.extensionFromVscodeMarketplace {
      publisher = "enkia";
      name = "tokyo-night";
      version = "1.0.6";
      sha256 = "sha256-VWdUAU6SC7/dNDIOJmSGuIeffbwmcfeGhuSDmUE7Dig=";
    };
  };
in {
  home.packages = with pkgs; [
    golangci-lint
  ];

  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    userSettings = {
      "[nix]"."editor.tabSize" = 2;
      "[nix]"."editor.defaultFormatter" = "kamadorueda.alejandra";
      "[nix]"."editor.formatOnPaste" = true;
      "[nix]"."editor.formatOnSave" = true;
      "[nix]"."editor.formatOnType" = false;
      "alejandra.program" = "${pkgs.alejandra}/bin/alejandra";
      "[go]"."editor.tabSize" = 2; # go fmt has an 8 tab size
      "[go]"."editor.defaultFormatter" = "golang.go";
      "[go]"."editor.formatOnPaste" = true;
      "[go]"."editor.formatOnSave" = true;
      "[go]"."editor.formatOnType" = false;
      "go.lintTool" = "golangci-lint";
      "go.lintFlags" = ["--fast"];

      "editor.formatOnSave" = true;
      "files.insertFinalNewline" = true; # Make sure to have a final new line at end of files
      "files.trimFinalNewlines" = true; # Trim superfluous new lines at end of files
      "files.trimTrailingWhitespace" = true; # Trim whitespace at end of lines on save
      "telemetry.telemetryLevel" = "off";
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = lib.mkForce "Tokyo Night";
    };
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      # enkia.tokyo-night
      golang.go
      kamadorueda.alejandra
      mkhl.direnv
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
      timonwong.shellcheck
      yzhang.markdown-all-in-one
      custom-extensions.kamailio-syntax
      custom-extensions.tokyo-night
    ];
  };

  # xdg.configFile."hypr/per-app/vscodium.conf".text = ''
  #   windowrule = tile, title:VSCodium
  #   bind = $mainMod, K, exec, codium
  # '';
}
