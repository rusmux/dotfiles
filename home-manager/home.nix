{ ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.gc.automatic = true;
  news.display = "silent";
  programs.home-manager.enable = true;

  imports = [
    ./defaults.nix
  ];

  home.stateVersion = "25.05";
}
