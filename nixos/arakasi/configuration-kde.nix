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
}: let
  monitorsXmlContent = builtins.readFile (./. + "/../../home-manager/users/${username}/${config.networking.hostName}_monitors_gdm_gnome_generated.xml");
  monitorsConfig = pkgs.writeText "gdm_monitors.xml" monitorsXmlContent;
in {
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

    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ./disko-config.nix

    # ../common
    # ../common/programs
    # ../common/services
    ../common/documentation
    ../common/environment
    ../common/fonts
    ../common/locale
    ../common/nix
    ../common/pipewire
    ../common/programs/gnupg
    ../common/programs/neovim
    ../common/programs/zsh
    ../common/services/fwupd
    ../common/services/openssh
    ../common/services/zfs
    ../common/stylix
    ../common/users
    ../common/virtualisation

    # ../global/locale
    # ../global/pipewire
    # ../global/greetd
    # ../global/xserver
    # ../global/xdg
    # ../global/hyprland
    # ../global/gtk
    # ../global/qt
    # ../global/fonts
    # ../global/stylix
    # ../global/virtualisation
    # ../global/neovim # Managed by home manager as well
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

  # FIXME: Add the rest of your current configuration

  boot = {
    kernelModules = [
      "tcp_bbr"
    ];
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    kernelParams = [
      "ipv6.disable=1"
      "pcie_port_pm=off" # see https://www.reddit.com/r/buildapc/comments/xypn1m/network_card_intel_ethernet_controller_i225v_igc/
      "pcie_aspm.policy=performance" # see https://www.reddit.com/r/buildapc/comments/xypn1m/network_card_intel_ethernet_controller_i225v_igc/
    ];
    kernel = {
      sysctl = {
        "net.ipv4.tcp_congestion_control" = "bbr";
        "net.core.default_qdisc" = "fq"; # see https://news.ycombinator.com/item?id=14814530
      };
    };
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };

      systemd-boot = {
        enable = true;
      };
    };
  };

  console = {
    font = "Lat2-Terminus16";
    # keyMap = "uk";
    useXkbConfig = true;
  };

  disko.enableConfig = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  hardware = {
    bluetooth = {
      enable = false;
      powerOnBoot = true;
    };

    enableRedistributableFirmware = true;

    # look here - https://discourse.nixos.org/t/nvidia-gpu-video-acceleration-with-firefox/20098/6
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      open = false;
      modesetting.enable = true;
      nvidiaSettings = true;
      prime.offload.enable = false;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        # nvidia-vaapi-driver
        libGL
        # libvdpau-va-gl
        vulkan-tools
        # vaapiVdpau
        mesa.drivers
      ];
      setLdLibraryPath = true;
    };
  };

  networking = {
    hostId = "a5569f6b";
    hostName = "arakasi";
    enableIPv6 = false; # IPv4 at home
    tempAddresses = "disabled";
    useDHCP = lib.mkForce true;
    # useNetworkd = true;
    domain = "home.ie";
    search = ["home.ie"];
    # resolvconf = {
    #   enable = true;
    #   useLocalResolver = false;
    #   dnsSingleRequest = true; # stop sending AAA as part of the same A request
    #   dnsExtensionMechanism = false; # disable edns0, my upstream dns server doesnt support DNSSEC
    # };
    networkmanager = {
      enable = true;
      #   # dns = "systemd-resolved";
      #   wifi = {
      #     backend = "iwd";
      #   };
      # };
      # wireless = {
      #   iwd = {
      #     enable = true;
      #     settings = {
      #       Network = {
      #         EnableIPv6 = false; # default true
      #       };
      #       Settings = {
      #         AutoConnect = true;
      #       };
      #     };
      #   };
    };
  };

  # powerManagement = {
  #   cpuFreqGovernor = "performance"; # ondemand/powersave/performance/schedutil
  # };

  # fonts.fontDir.enable = true;

  # programs.zsh.enable = true;

  #services.resolved = {
  #  enable = true;
  #  llmnr = "false";
  #  # domains = ["home.ie"];
  #  dnssec = "false";
  #  dnsovertls = "false";
  #  fallbackDns = ["172.16.17.1"];
  #};

  # settings specific to this machine, augments ../global/xserver/default.nix
  services.xserver = {
    enable = true;
    displayManager.defaultSession = "plasma"; # plasma or plasmax11
    displayManager.gdm = {
      enable = true;
      wayland = true;
      debug = false;
    };
    desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = true;
    };
    videoDrivers = ["nvidia"];
    xkb = {
      layout = "gb";
      model = "pc104";
      variant = "extd";
      options = "terminate:ctrl_alt_bksp";
    };
  };

  # services.geoclue2.enable = true;

  # services.gnome.gnome-keyring.enable = true;

  # security.pam.services = {
  #   gdm.enableGnomeKeyring = true; # unlock keyring with gdm / gdm support for keyring
  #   swaylock = {}; # enables pam for swaylock, otherwise cannot unlock system TODO swaylock ./home
  # };

  # services.dbus.packages = [ pkgs.gcr ];

  # programs = {
  #   gnupg.agent = {
  #     enable = true;
  #     enableSSHSupport = true;
  #   };
  # };

  # not sure about this one
  # programs.dconf.enable = true;

  # services.auto-cpufreq.enable = true;

  # services.blueman.enable = true;

  # services.fwupd.enable = true;

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

  # systemd.tmpfiles.rules = [
  #   "L+ /run/gdm/.config/monitors.xml - - - - /home/${username}/Git/nixos-config/home-manager/users/${username}/arakasi_monitors_gdm_gnome_generated.xml"
  # ];

  # systemd.tmpfiles.rules = [
  #   "L+ /run/gdm/.config/monitors.xml - - - - ${monitorsConfig}"
  # ];

  # systemd.packages = [
  #   (pkgs.writeTextFile {
  #     name = "monitors.conf";
  #     destination = "/etc/systemd/system/gdm.service.d/monitors.conf";
  #     text = ''
  #       [Service]
  #       ExecStartPre=cp /home/${username}/Git/nixos-config/home-manager/users/${username}/arakasi_monitors_gdm.xml /run/gdm/.config/monitors.xml
  #     '';
  #   })
  # ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
