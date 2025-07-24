{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.gc.automatic = true;
  news.display = "silent";
  programs.home-manager.enable = true;

  imports = [
    ./yazi.nix
  ];

  xdg.configFile = {
    "gitalias/gitalias.txt".source =
      pkgs.fetchFromGitHub {
        owner = "GitAlias";
        repo = "gitalias";
        rev = "b6980478e27e53baced06154ef86843bbf08b137";
        hash = "sha256-dJSAsdKaeCXZT0w4JVfYiVj0V1QNv5m01ajM3TbFvUY=";
      }
      + "/gitalias.txt";
  };

  home = {
    username = "rusmux";
    homeDirectory = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/rusmux" else "/home/rusmux";
    stateVersion = "25.05";
    packages = import ./packages.nix { inherit pkgs; };

    file.".zsh/.kubectl_aliases".source =
      pkgs.fetchFromGitHub {
        owner = "ahmetb";
        repo = "kubectl-aliases";
        rev = "7549fa45bbde7499b927c74cae13bfb9169c9497";
        hash = "sha256-NkprSk55aRVHiq9JXduQl6AGZv5pBLHznRToOdm9OUw=";
      }
      + "/.kubectl_aliases";
  };
}
