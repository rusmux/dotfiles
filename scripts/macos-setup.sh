#!/usr/bin/env bash
# shellcheck disable=SC2317

# Settings: give terminal full disk access

sudo networksetup -setdnsservers Wi-Fi 45.90.28.20 45.90.30.20
sudo killall -HUP mDNSResponder

xcode-select --install
softwareupdate --install-rosetta --agree-to-license

curl -fsSL https://install.determinate.systems/nix | sh -s -- install --no-confirm
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

nix run home-manager/master -- switch --flake "github:rusmux/dotfiles?dir=home-manager#$USER-aarch64-darwin"
chezmoi init --apply rusmux

mkdir -p "$HOME/Documents/Wallpapers"
magick -size 480x270 xc:'rgb(246,246,246)' "$HOME/Documents/Wallpapers/light.jpg"
magick -size 480x270 xc:'rgb(234,234,234)' "$HOME/Documents/Wallpapers/light-gray.jpg"
magick -size 480x270 xc:'rgb(30,30,30)' "$HOME/Documents/Wallpapers/dark.jpg"
magick -size 480x270 xc:'rgb(56,56,56)' "$HOME/Documents/Wallpapers/dark-gray.jpg"

echo "$HOME/.nix-profile/bin/zsh" | sudo tee -a /etc/shells
chsh -s "$HOME/.nix-profile/bin/zsh"

launchctl bootstrap gui/"$(id -u)" "$HOME/Library/LaunchAgents/com.user.env.plist"
exit

sudo -i nix run nix-darwin/master#darwin-rebuild -- switch --flake "$HOME/.local/share/chezmoi/nix-darwin#$USER"
brew analytics off
brew autoupdate start --upgrade --cleanup --immediate

sudo mv "/Applications/Microsoft Word.app" /Applications/My
sudo mv "/Applications/Refined GitHub.app" /Applications/My/Programming

launchctl bootout gui/"$(id -u)"

curl -fsSL https://github.com/alsyundawy/Microsoft-Office-For-MacOS/raw/refs/heads/master/DATA/Microsoft_Office_LTSC_2024_VL_Serializer.pkg \
  -o /tmp/Microsoft_Office_LTSC_2024_VL_Serializer.pkg
sudo installer -pkg /tmp/Microsoft_Office_LTSC_2024_VL_Serializer.pkg -target /

sudo scripts/privacy-sexy.sh

mise install

rclone sync gd:Documents "$HOME/Documents"
