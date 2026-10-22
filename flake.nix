{
  description = "April Hall's NixOS & Home Manager Flake Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-hardware,
      ...
    }@inputs:
    let
      # Home manager config lives here so i dont need to redefine it for all device configs
      sharedHomeManager = {
        imports = [ home-manager.nixosModules.home-manager ];
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "bak";
          extraSpecialArgs = { inherit inputs; };
          users.ari = import ./home.nix;
        };
      };
    in
    {
      nixosConfigurations = {
        # General configuration for hardware that dosen't need
        # specific drivers and stuff
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            sharedHomeManager

            (
              { config, pkgs, ... }:
              {
                networking.hostName = "nixos";
              }
            )
          ];
        };

        # Configuration for my Framework 12 13th Gen
        framework = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            sharedHomeManager

            (
              { config, pkgs, ... }:
              {
                networking.hostName = "framework";
              }
            )

            # framework 12 specific hardware stuff:
            nixos-hardware.nixosModules.framework-12-13th-gen-intel
            {
              boot.initrd.kernelModules = [ "pinctrl_tigerlake" ];
              hardware.sensor.iio.enable = true;
            }
          ];
        };
      };
    };
}