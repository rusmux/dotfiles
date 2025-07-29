{
  LaunchServices.LSQuarantine = false;
  NSGlobalDomain = {
    _HIHideMenuBar = true;
    AppleICUForce24HourTime = true;
    AppleMeasurementUnits = "Centimeters";
    AppleMetricUnits = 1;
    AppleTemperatureUnit = "Celsius";
  };
  dock = {
    tilesize = 80;
    autohide = true;
    static-only = true;
    show-recents = false;
    mru-spaces = false;
    minimize-to-application = true;
  };
  finder = {
    ShowPathbar = true;
    AppleShowAllFiles = true;
    _FXSortFoldersFirst = true;
    FXRemoveOldTrashItems = true;
    FXDefaultSearchScope = "SCcf";
    FXEnableExtensionChangeWarning = false;
    ShowMountedServersOnDesktop = true;
    NewWindowTarget = "Home";
  };
  screencapture.target = "clipboard";
  CustomUserPreferences = {
    "com.apple.controlcenter" = {
      "NSStatusItem Visible WiFi" = true;
    };
  };
}
