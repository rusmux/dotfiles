{
  enable = true;
  onActivation = {
    autoUpdate = true;
    upgrade = true;
    cleanup = "uninstall";
  };
  caskArgs = {
    appdir = "/Applications/My";
    no_quarantine = true;
  };

  taps = [
    "buo/cask-upgrade"
    "mikescher/tap"
    "Goooler/homebrew-repo"
  ];

  brews = [
    "mas"
    "mikescher/tap/dops"
  ];

  masApps = {
    refined-github = 1519867270;
    github-file-icons = 1631366167;
    toggl-track-hours-time-log = 1291898086;
  };

  casks = [
    # QuickLook
    {
      name = "syntax-highlight";
      args = {
        appdir = "/Applications/My/QuickLook";
      };
    }
    {
      name = "qlmarkdown";
      args = {
        appdir = "/Applications/My/QuickLook";
      };
    }
    {
      name = "betterzip";
      args = {
        appdir = "/Applications/My/QuickLook";
      };
    }
    {
      name = "qlvideo";
      args = {
        appdir = "/Applications/My/QuickLook";
      };
    }

    # General
    "Goooler/repo/hiddify"
    "telegram"
    "google-chrome"
    "qbittorrent@lt20"
    "yandex-music"
    "iina"
    "maccy"
    "microsoft-word"
    # "netnewswire"
    "obsidian"
    "syncthing-app"
    "skim"
    "maintenance"
    "logi-options+"

    "adguard"
    "android-platform-tools"

    # Programming
    {
      name = "visual-studio-code";
      args = {
        appdir = "/Applications/My/Programming";
      };
    }
    {
      name = "wezterm";
      args = {
        appdir = "/Applications/My/Programming";
      };
    }
    {
      name = "jetbrains-toolbox";
      args = {
        appdir = "/Applications/My/Programming/JetBrains";
      };
    }
    {
      name = "orbstack";
      args = {
        appdir = "/Applications/My/Programming";
      };
    }

    "font-jetbrains-mono-nerd-font"
  ];
}
