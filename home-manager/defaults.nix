{ pkgs, lib, ... }:

lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
  targets.darwin.currentHostDefaults = {
    "com.apple.Spotlight" = {
      MenuItemHidden = true;
    };
    "com.apple.controlcenter" = {
      AirplayReceiverEnabled = false;
    };
    "com.apple.coreservices.useractivityd" = {
      ActivityAdvertisingAllowed = 0;
      ActivityReceivingAllowed = 0;
    };
  };
}
