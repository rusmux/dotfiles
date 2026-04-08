{
  enable = true;
  onActivation = {
    autoUpdate = true;
    upgrade = true;
    # cleanup = "uninstall";
  };
  global = {
    brewfile = true;
  };
  caskArgs = {
    appdir = "/Applications/My";
  };

  taps = [
    "domt4/autoupdate"
    "buo/cask-upgrade"
    "Goooler/homebrew-repo"
  ];

  brews = [
    "mas"
    "opencode"
    "rtk"
    "yt-dlp"
    # fail to build Swift 5.10.1 on Nix:
    "jackett"
  ];

  masApps = {
    # mas installation failed on Nix:
    # refined-github = 1519867270;
    # wireguard = 1451685025;

    # github-file-icons = 1631366167;
    # toggl-track-hours-time-log = 1291898086;
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
      name = "quicklook-video";
      args = {
        appdir = "/Applications/My/QuickLook";
      };
    }

    # General
    "adguard"
    "adguard-vpn"
    "telegram"
    "google-chrome"
    "qbittorrent@lt20"
    "iina"
    "maccy"
    "microsoft-word"
    "microsoft-auto-update"
    "obsidian"
    "skim"
    "logi-options+"
    "mos"
    "monitorcontrol"
    "nvidia-geforce-now"
    "steam"
    "clash-verge-rev"

    "android-platform-tools"
    # "macfuse@dev"

    # Programming
    # update cycle is too slow on Nix:
    "yandex-cloud-cli"
    "claude-code@latest"
    "codex"
    "copilot-cli"

    {
      name = "visual-studio-code";
      args = {
        appdir = "/Applications/My/Programming";
      };
    }
    {
      name = "ghostty";
      args = {
        appdir = "/Applications/My/Programming";
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
