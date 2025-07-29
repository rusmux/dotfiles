{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.gc.automatic = true;
  news.display = "silent";
  programs.home-manager.enable = true;
  targets.darwin.currentHostDefaults = {
    "com.apple.Spotlight" = {
      MenuItemHidden = true;
    };
    "com.apple.controlcenter" = {
      AirplayReceiverEnabled = false;
    };
  };

  imports = [
    ./yazi.nix
  ];

  programs.gh = {
    enable = true;
    extensions = [
      pkgs.gh-copilot
    ];
  };

  home = {
    username = "rusmux";
    homeDirectory = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/rusmux" else "/home/rusmux";
    stateVersion = "25.05";
    packages = import ./packages.nix { inherit pkgs; };
  };
}
