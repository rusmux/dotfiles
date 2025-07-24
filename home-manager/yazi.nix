{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    plugins = with pkgs; {
      git = yaziPlugins.git;
      "no-status" = yaziPlugins.no-status;
      ouch = yaziPlugins.ouch;
    };
  };
}
