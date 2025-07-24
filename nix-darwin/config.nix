{ configurationRevision, ... }:

{
  nix.enable = false; # DetSys Nix manages Nix itself
  nixpkgs.hostPlatform = "aarch64-darwin";
  security.pam.services.sudo_local.touchIdAuth = true;
  environment.systemPackages = [ ];

  system = {
    inherit configurationRevision;
    stateVersion = 6;
    primaryUser = "rusmux";
    defaults = import ./defaults.nix;
  };

  nix-homebrew = {
    enable = true;
    user = "rusmux";
  };
  homebrew = import ./homebrew.nix;
}
