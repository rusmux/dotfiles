{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:

    {
      homeConfigurations."rusmux-aarch64-darwin" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-darwin";
        modules = [
          ./home.nix
          (
            { pkgs, lib, ... }:
            {
              home.username = "rusmux";
              home.homeDirectory = "/Users/rusmux";
              home.packages = lib.concatLists [
                (import ./packages/base.nix { inherit pkgs; })
                (import ./packages/extra.nix { inherit pkgs; })
              ];
            }
          )
        ];
      };

      homeConfigurations."root-aarch64-linux" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-linux";
        modules = [
          ./home.nix
          (
            { pkgs, ... }:
            {
              home.username = "root";
              home.homeDirectory = "/root";
              home.packages = import ./packages/base.nix { inherit pkgs; };
            }
          )
        ];
      };

      homeConfigurations."root-x86_64-linux" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [
          ./home.nix
          (
            { pkgs, ... }:
            {
              home.username = "root";
              home.homeDirectory = "/root";
              home.packages = import ./packages/base.nix { inherit pkgs; };
            }
          )
        ];
      };

      homeConfigurations."mukhametshin-x86_64-linux" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [
          ./home.nix
          (
            { pkgs, lib, ... }:
            {
              home.username = "mukhametshin";
              home.homeDirectory = "/home/mukhametshin";
              home.packages = lib.concatLists [
                (import ./packages/base.nix { inherit pkgs; })
                (import ./packages/extra.nix { inherit pkgs; })
              ];
            }
          )
        ];
      };
    };
}
