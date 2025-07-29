#!/usr/bin/env bash

# Settings: give terminal full disk access

sudo networksetup -setdnsservers Wi-Fi 1.1.1.1
sudo killall -HUP mDNSResponder

xcode-select --install
softwareupdate --install-rosetta --agree-to-license

curl -fsSL https://install.determinate.systems/nix | sh -s -- install --no-confirm
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

nix run home-manager/master -- switch --flake "github:rusmux/dotfiles?dir=home-manager#aarch64-darwin"
chezmoi init --apply rusmux

echo "$HOME/.nix-profile/bin/zsh" >/etc/shells
chsh -s "$HOME/.nix-profile/bin/zsh"

mkdir -p "$HOME/Documents/Wallpapers"
magick -size 256x256 xc:'#111111' "$HOME/Documents/Wallpapers/dark.jpg"

sudo -i nix run nix-darwin/master#darwin-rebuild -- switch --flake "$HOME/.local/share/chezmoi/nix-darwin#$(whoami)"
brew autoupdate start --upgrade --cleanup --immediate

sudo -v && nohup sudo "/Applications/My/Hiddify.app/Contents/MacOS/Hiddify" >/dev/null &

sudo mv "/Applications/Microsoft Word.app" /Applications/My
sudo mv "/Applications/Toggl Track.app" /Applications/My
sudo mv "/Applications/Refined GitHub.app" /Applications/My/Programming

curl -fsSL https://github.com/alsyundawy/Microsoft-Office-For-MacOS/raw/refs/heads/master/DATA/Microsoft_Office_LTSC_2024_VL_Serializer.pkg -o /tmp/Microsoft_Office_LTSC_2024_VL_Serializer.pkg
sudo installer -pkg /tmp/Microsoft_Office_LTSC_2024_VL_Serializer.pkg -target /
