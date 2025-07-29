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
    NewWindowTarget = "Home";
  };
  screencapture.target = "clipboard";
  CustomUserPreferences = {
    ### ? APPLE ###
    NSGlobalDomain = {
      AppleFirstWeekday = {
        gregorian = 2;
      };
      AppleICUDateFormatStrings = {
        "1" = "dd.MM.y";
      };
      AppleWindowTabbingMode = "always";
    };
    "com.apple.AppleMultitouchTrackpad" = {
      ActuationStrength = 0;
      Clicking = 1;
    };
    "com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
      Clicking = 1;
    };
    "com.apple.controlcenter" = {
      "NSStatusItem Visible WiFi" = 0;
    };
    "com.apple.WindowManager" = {
      EnableStandardClickToShowDesktop = 0;
    };
    "com.apple.LaunchServices" = {
      showAppExposeGestureEnabled = 1;
      showLaunchpadGestureEnabled = 0;
    };
    "com.apple.Safari" = {
      AlwaysRestoreSessionAtLaunch = 1;
      AutoOpenSafeDownloads = 0;
      AutoShowToolbarInFullScreen = 1;
      HistoryAgeInDaysLimit = 7;
      HomePage = "";
      IncludeDevelopMenu = 1;
      ShowStandaloneTabBar = 0;
    };
    ### ? APPS ###
    "org.p0deje.Maccy" = {
      SUEnableAutomaticChecks = 1;
      searchMode = "fuzzy";
      searchVisibility = "duringSearch";
      showFooter = 0;
      showInStatusBar = 0;
      showTitle = 0;
      windowSize = "[450,210]";
    };
    "com.adguard.mac.adguard" = {
      ActivateFiltersAutomaticEnabled = 1;
      ExtraEnabled = 1;
      FilterHttps = 1;
      HideMenubarIcon = 1;
      SafebrowsingEnabled = 1;
      StartAtLogin = 1;
      StealthBlockTrackers = 1;
      UsefulAdsEnabled = 0;
    };
    "com.colliderli.iina" = {
      autoSearchOnlineSub = 1;
      fullScreenWhenOpen = 1;
      pauseWhenOpen = 1;
      playlistAutoPlayNext = 0;
      quitWhenNoOpenedWindow = 1;
      screenshotCopyToClipboard = 1;
      screenshotSaveToFile = 0;
      subLang = "en";
    };
    "app.hiddify.com" = {
      "flutter.region" = "other";
    };
    "ru.keepcoder.Telegram" = {
      AutomaticSpellingCorrectionEnabledTGGrowingTextView = 1;
      ContinuousSpellCheckingEnabledTGGrowingTextView = 1;
      GrammarCheckingEnabledTGGrowingTextView = 1;
      kArchiveIsHidden = 1;
      kAutomaticConvertEmojiesType2 = 1;
    };
    "net.sourceforge.skim-app.skim" = {
      SKReopenLastOpenFiles = 1;
    };
  };
}
