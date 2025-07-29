{ ... }:

{
  targets.darwin.currentHostDefaults = {
    "com.apple.Spotlight" = {
      MenuItemHidden = true;
    };
    "com.apple.controlcenter" = {
      AirplayReceiverEnabled = false;
    };
    NSGlobalDomain = {
      "com.apple.mouse.tapBehavior" = 1;
    };
  };
}
