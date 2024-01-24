# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

# https://www.reddit.com/r/linuxhardware/comments/f56wr6/xps_13_7390_late_2019_sixweek_review_tips_and/

{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  stylix,
  username,
  colour_scheme,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration

    inputs.nixos-hardware.nixosModules.dell-xps-13-7390
    ./hardware-configuration.nix
    ./disko-config.nix

    ../global/locale
    ../global/pipewire
    ../global/xserver
    ../global/xdg
    ../global/hyprland
    ../global/gtk
    ../global/qt
    ../global/fonts
    ../global/stylix
    ../global/virtualisation
    ../global/neovim # Managed by home manager as well
    
  ];

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
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    # Keep the last 3 generations
    options = "--delete-older-than +3";
  };

  # FIXME: Add the rest of your current configuration

  networking.hostName = "thanos";
  networking.hostId = "a4e287fe";
  networking.useDHCP = lib.mkForce true;
  # networking.wireless.iwd.enable = true;
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd"; # default is "wpa_supplicant"
  networking.wireless.iwd = {
    enable = true;
    settings = {
      Network = {
        EnableIPv6 = false; # default true
      };
      Settings = {
        AutoConnect = true;
      };
    };
  };

  # TODO: This is just an example, be sure to use whatever bootloader you prefer
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;

  # configure nixos with the specified devices
  # should be true if the system is booted with those devices
  # should be false on an installer image etc.
  disko.enableConfig = true; 

  hardware.enableRedistributableFirmware = true;

  console = {
    font = "Lat2-Terminus16";
    # keyMap = "uk";
    useXkbConfig = true;
  };

  # systemd.sleep.extraConfig = "SuspendState=freeze";

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    root = {
      hashedPassword = "$y$j9T$MWL7ZiI04tv19poUTs./e1$DnFUJwg.lHgoypCyyl8s/NxVsQseq16KLFQajBpmMIB";
    };
    ${username} = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      # run 'mkpasswd -m yescrypt'
      # initialPassword = "correcthorsebatterystaple";
      hashedPassword = "$y$j9T$LOW.UUJZdl94Miro2rPYi0$X7HGYuYWgrG87fGU9F31lElzJSrXC3rwYozqYbc0fZ6";
      isNormalUser = true;
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = ["wheel" "networkmanager" "systemd-journal" ];
      packages = [ pkgs.home-manager ];
    };
  };

  environment.shells = [ pkgs.zsh pkgs.bash ];
  environment.systemPackages = with pkgs; [
    # neovim
    git
    wget
    # yubikey-personalization
    # yubikey-manager
    # pavucontrol
    pulseaudio
    # jack2
    libcamera
    # qmk
    pciutils
    hwloc
    usbutils
    # thermald
  ];

  environment.shellAliases.rebuild = "sudo nixos-rebuild switch --flake /home/${username}/git_repos/nixos-config/\\#thanos --show-trace";

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # fonts.fontDir.enable = true;

  
  programs.zsh.enable = true;

  # settings specific to this machine, augments ../global/xserver/default.nix
  services.xserver = {
    videoDrivers = [ "i915" ];
    # Dell XPS 13 7390 Fn key shortcuts
    # Fn + esc = Toggle Fn-key lock
    # Fn + b = Pause/Break
    # Fn + s = Toggle scroll lock
    # Fn + r = System request
    xkb = {
      layout = "gb";
      model = "pc104";
      variant = "";
      options = "terminate:ctrl_alt_bksp";
    };
  };

  services.geoclue2.enable = true;

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      # PasswordAuthentication = false;
    };
  };

  services.gnome.gnome-keyring.enable = true;

  security.pam.services = {
    gdm.enableGnomeKeyring = true; # unlock keyring with gdm / gdm support for keyring
    swaylock = {}; # enables pam for swaylock, otherwise cannot unlock system TODO swaylock ./home
  };

  # services.dbus.packages = [ pkgs.gcr ];

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  programs.dconf.enable = true;

  # services.auto-cpufreq.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  # xdg.portal = {
  #   extraPortals = [ 
  #     pkgs.xdg-desktop-portal-gtk 
  #     pkgs.xdg-desktop-portal-wlr 
  #   ];
  # };
  
  # programs.hyprland.enable = true;
  # xdg = {
  #   mime.enable = true;
  #   portal = {
  #     extraPortals = [ 
  #       pkgs.xdg-desktop-portal-hyprland 
  #       pkgs.xdg-desktop-portal-wlr
  #     ];
  #     configPackages = [ pkgs.hyprland ];
  #   };
    
  # };

  # Ensure that we can find stuff with `man -k`
  documentation.man.generateCaches = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
