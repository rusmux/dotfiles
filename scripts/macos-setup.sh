#!/usr/bin/env bash

xcode-select --install
softwareupdate --install-rosetta --agree-to-license

curl -fsSL https://install.determinate.systems/nix | sh -s -- install --no-confirm
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

USER=$(whoami)
nix run home-manager/master -- switch --flake "github:$USER/dotfiles?dir=home-manager#aarch64-darwin"
chezmoi init --apply "$USER"

which zsh | sudo tee -a /etc/shells
chsh -s "$(which zsh)"

magick -size 256x256 xc:'#111111' "$HOME/Documents/Wallpapers/dark.png"

sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake "$HOME/.local/share/chezmoi/nix-darwin#$USER"

xattr -dr com.apple.quarantine /Applications/My/Hiddify.app
sudo -v && nohup sudo "/Applications/My/Hiddify.app/Contents/MacOS/Hiddify" > /dev/null &

sudo mv "/Applications/Microsoft Word.app" /Applications/My
sudo mv "/Applications/Toggl Track.app" /Applications/My
sudo mv "/Applications/Refined GitHub.app" /Applications/My/Programming

curl -fsSL https://github.com/alsyundawy/Microsoft-Office-For-MacOS/blob/master/DATA/Microsoft_Office_LTSC_2024_VL_Serializer.pkg -o /tmp/Microsoft_Office_LTSC_2024_VL_Serializer.pkg
sudo installer -pkg /tmp/Microsoft_Office_LTSC_2024_VL_Serializer.pkg -target /
