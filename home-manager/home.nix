{ pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;
  # nix.gc.automatic = true;
  news.display = "silent";
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  home.sessionVariables = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    FONTCONFIG_FILE = "${pkgs.fontconfig.out}/etc/fonts/fonts.conf";
  };

  home.stateVersion = "25.05";
}
