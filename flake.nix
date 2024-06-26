{
  description = "Your new nix config";

  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      "https://cache.nixos.org"
    ];
    extraSubstituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    # Nixpkgs
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    # home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    nixos-hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";

    stylix.url = "github:danth/stylix";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    home-manager,
    stylix,
    disko,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;

    # firefox-addons = pkgs.nur.repos.rycee.firefox-addons; # this not working
    username = "vzhsxn";
    colour_scheme = "tokyo-night-dark";
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # DELL XPS 13 7390
      thanos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs stylix username colour_scheme;};
        modules = [
          # > Our main nixos configuration file <
          stylix.nixosModules.stylix
          ./nixos/thanos/configuration.nix
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            # home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home-manager/users/${username}/thanos.nix;
            home-manager.extraSpecialArgs = {inherit inputs outputs stylix username colour_scheme;};
          }
        ];
      };
      arakasi = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs stylix username colour_scheme;};
        modules = [
          # > Our main nixos configuration file <
          stylix.nixosModules.stylix
          ./nixos/arakasi/configuration-hyprland.nix
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            # home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home-manager/users/${username}/arakasi-hyprland.nix;
            home-manager.extraSpecialArgs = {inherit inputs outputs stylix username colour_scheme;};
          }
        ];
      };
      pve-dswarm-01 = nixpkgs.lib.nixosSystem {
        # specialArgs = {inherit inputs outputs stylix username colour_scheme;};
        specialArgs = {inherit inputs outputs username colour_scheme;};
        modules = [
          # > Our main nixos configuration file <
          # stylix.nixosModules.stylix
          ./nixos/pve-dswarm-01/configuration.nix
          # disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            # home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home-manager/users/${username}/pve-dswarm.nix;
            home-manager.extraSpecialArgs = {inherit inputs outputs username colour_scheme;};
            # home-manager.extraSpecialArgs = {inherit inputs outputs stylix username colour_scheme;};
          }
        ];
      };
      pve-dswarm-02 = nixpkgs.lib.nixosSystem {
        # specialArgs = {inherit inputs outputs stylix username colour_scheme;};
        specialArgs = {inherit inputs outputs username colour_scheme;};
        modules = [
          # > Our main nixos configuration file <
          # stylix.nixosModules.stylix
          ./nixos/pve-dswarm-02/configuration.nix
          # disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            # home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home-manager/users/${username}/pve-dswarm.nix;
            home-manager.extraSpecialArgs = {inherit inputs outputs username colour_scheme;};
            # home-manager.extraSpecialArgs = {inherit inputs outputs stylix username colour_scheme;};
          }
        ];
      };
      pve-dswarm-03 = nixpkgs.lib.nixosSystem {
        # specialArgs = {inherit inputs outputs stylix username colour_scheme;};
        specialArgs = {inherit inputs outputs username colour_scheme;};
        modules = [
          # > Our main nixos configuration file <
          # stylix.nixosModules.stylix
          ./nixos/pve-dswarm-03/configuration.nix
          # disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            # home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home-manager/users/${username}/pve-dswarm.nix;
            home-manager.extraSpecialArgs = {inherit inputs outputs username colour_scheme;};
            # home-manager.extraSpecialArgs = {inherit inputs outputs stylix username colour_scheme;};
          }
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      # FIXME replace with your username@hostname
      "${username}@thanos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs username;};
        modules = [
          # > Our main home-manager configuration file <
          stylix.homeManagerModules.stylix
          ./home-manager/users/${username}/thanos.nix
        ];
      };
    };
  };
}
