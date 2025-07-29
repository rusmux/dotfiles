{ configurationRevision, ... }:

let
  user = "rusmux";
in
{
  nix = {
    enable = true;
    gc.automatic = true;
    optimize.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [ "@admin" ];
    };

    linux-builder = {
      enable = true;
      ephemeral = true;
      config = {
        virtualisation = {
          cores = 6;
          darwin-builder = {
            diskSize = 40 * 1024;
            memorySize = 6 * 1024;
          };
        };
      };
    };
  };
  nixpkgs.hostPlatform = "aarch64-darwin";

  networking.hostName = "${user}";
  system = {
    inherit configurationRevision;
    stateVersion = 6;
    primaryUser = "${user}";
    defaults = import ./defaults.nix;
  };

  nix-homebrew = {
    enable = true;
    user = "${user}";
  };
  homebrew = import ./homebrew.nix;
}
