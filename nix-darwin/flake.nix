{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-rosetta-builder.url = "github:cpick/nix-rosetta-builder";
    nix-rosetta-builder.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      determinate,
      nixpkgs,
      nix-darwin,
      nix-homebrew,
      nix-rosetta-builder,
      ...
    }:

    {
      darwinConfigurations."rusmux" = nix-darwin.lib.darwinSystem {
        modules = [
          determinate.darwinModules.default
          nix-homebrew.darwinModules.nix-homebrew
          # nix-rosetta-builder.darwinModules.default
          ./config.nix
        ];
        specialArgs = {
          configurationRevision = self.rev or self.dirtyRev or null;
        };
      };
    };
}
