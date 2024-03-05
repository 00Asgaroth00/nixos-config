# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  stylix,
  username,
  osConfig,
  colour_scheme,
  ...
}: {
  # You can import other home-manager modules here
  imports =
    [
      # If you want to use modules your own flake exports (from modules/home-manager):
      # outputs.homeManagerModules.example

      # Or modules exported from other flakes (such as nix-colors):
      # inputs.nix-colors.homeManagerModules.default

      # You can also split up your configuration and import pieces of it here:
      # ./nvim.nix

      # nix-colors.homeManagerModule
      (./. + "/kanshi_${osConfig.networking.hostName}.nix")
      ../../capabilities/common
      ../../capabilities/cli
      ../../capabilities/desktop
      ../../capabilities/font_profiles
      # ../../capabilities/git
      # ../../capabilities/shell.nix
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # fonts.fontconfig.enable = true;

  # xdg.enable = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;
  # programs.git.enable = true;

  # create gdm monitors.xml
  # xdg.configFile."monitors.xml".source = ./. + "/${osConfig.networking.hostName}_monitors_gdm.xml";

  # configure with nwg-displays
  monitors = [
    {
      name = "HDMI-A-1";
      width = 2560;
      height = 1440;
      refreshRate = 120;
      x = 1440;
      y = 180;
      scale = "1";
      workspaces = ["1" "2" "3" "4"];
    }
    {
      name = "DP-1";
      width = 3840;
      height = 2160;
      refreshRate = 60;
      x = 0;
      y = 0;
      scale = "1.50";
      transform = 3;
      workspaces = ["5" "6"];
    }
    {
      name = "HDMI-A-2";
      width = 3840;
      height = 2160;
      refreshRate = 60;
      x = 4000;
      y = 180;
      scale = "1.50";
      workspaces = ["7" "8"];
    }
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
