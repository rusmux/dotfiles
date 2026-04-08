#!/usr/bin/env bash
# shellcheck disable=SC2317

# Settings: give terminal full disk access

sudo networksetup -setdnsservers Wi-Fi 45.90.28.20 45.90.30.20
sudo killall -HUP mDNSResponder

xcode-select --install
softwareupdate --install-rosetta --agree-to-license

curl -fsSL https://install.determinate.systems/determinate-pkg/stable/Universal -o /tmp/Determinate.pkg
sudo installer -pkg "/tmp/Determinate.pkg" -target /

nix run home-manager/master -- switch --flake "github:rusmux/dotfiles?dir=home-manager#$USER-aarch64-darwin"

echo "$HOME/.nix-profile/bin/zsh" | sudo tee -a /etc/shells
chsh -s "$HOME/.nix-profile/bin/zsh"

chezmoi init --apply rusmux
mise install

sudo mv /etc/nix/nix.custom.conf /etc/nix/nix.custom.conf.before-nix-darwin
sudo -i nix run nix-darwin/master#darwin-rebuild -- switch --flake "$HOME/.local/share/chezmoi/nix-darwin#$USER"
brew analytics off
brew autoupdate start --upgrade --cleanup --immediate

sudo scripts/privacy-sexy.sh

mkdir -p "$HOME/Documents/Wallpapers"
magick -size 480x270 xc:'rgb(246,246,246)' "$HOME/Documents/Wallpapers/light.jpg"
magick -size 480x270 xc:'rgb(234,234,234)' "$HOME/Documents/Wallpapers/light-gray.jpg"
magick -size 480x270 xc:'rgb(30,30,30)' "$HOME/Documents/Wallpapers/dark.jpg"
magick -size 480x270 xc:'rgb(56,56,56)' "$HOME/Documents/Wallpapers/dark-gray.jpg"

sudo mv "/Applications/Microsoft Word.app" /Applications/My
sudo mv "/Applications/Refined GitHub.app" /Applications/My/Programming

curl -fsSL https://github.com/alsyundawy/Microsoft-Office-For-MacOS/raw/refs/heads/master/DATA/Microsoft_Office_LTSC_2024_VL_Serializer.pkg \
  -o /tmp/Microsoft_Office_LTSC_2024_VL_Serializer.pkg
sudo installer -pkg /tmp/Microsoft_Office_LTSC_2024_VL_Serializer.pkg -target /

cat vscode-extensions.txt | xargs -L 1 code --install-extension

rclone sync gd:Documents "$HOME/Documents"
