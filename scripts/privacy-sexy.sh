#!/usr/bin/env bash
# https://privacy.sexy — v0.13.8

echo '--- Disable Microsoft Office telemetry'
defaults write com.microsoft.office DiagnosticDataTypePreference -string ZeroDiagnosticData

echo '--- Disable remote management service'
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop

echo '--- Remove Apple Remote Desktop Settings'
sudo rm -rf /var/db/RemoteManagement
sudo defaults delete /Library/Preferences/com.apple.RemoteDesktop.plist
defaults delete ~/Library/Preferences/com.apple.RemoteDesktop.plist
sudo rm -rf /Library/Application\ Support/Apple/Remote\ Desktop/
rm -r ~/Library/Application\ Support/Remote\ Desktop/
rm -r ~/Library/Containers/com.apple.RemoteDesktop

echo '--- Disable "Ask Siri"'
defaults write com.apple.assistant.support 'Assistant Enabled' -bool false

echo '--- Disable Siri voice feedback'
defaults write com.apple.assistant.backedup 'Use device speaker for TTS' -int 3

echo '--- Disable Siri services (Siri and assistantd)'
launchctl disable "user/$UID/com.apple.assistantd"
launchctl disable "gui/$UID/com.apple.assistantd"
sudo launchctl disable 'system/com.apple.assistantd'
launchctl disable "user/$UID/com.apple.Siri.agent"
launchctl disable "gui/$UID/com.apple.Siri.agent"
sudo launchctl disable 'system/com.apple.Siri.agent'
if [[ $(/usr/bin/csrutil status | awk '/status/ {print $5}' | sed 's/\.$//') == "enabled" ]]; then
  echo >&2 'This script requires SIP to be disabled. Read more: https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection'
fi

echo '--- Disable "Do you want to enable Siri?" pop-up'
defaults write com.apple.SetupAssistant 'DidSeeSiriSetup' -bool True

echo '--- Remove Siri from menu bar'
defaults write com.apple.systemuiserver 'NSStatusItem Visible Siri' 0

echo '--- Remove Siri from status menu'
defaults write com.apple.Siri 'StatusMenuVisible' -bool false
defaults write com.apple.Siri 'UserHasDeclinedEnable' -bool true

echo '--- Disable participation in Siri data collection'
defaults write com.apple.assistant.support 'Siri Data Sharing Opt-In Status' -int 2

echo '--- Disable remote Apple events'
sudo systemsetup -setremoteappleevents off

echo '--- Disable AirDrop file sharing'
defaults write com.apple.NetworkBrowser DisableAirDrop -bool true

echo '--- Disable automatic incoming connections for signed apps'
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool false

echo '--- Disable automatic incoming connections for downloaded signed apps'
sudo defaults write /Library/Preferences/com.apple.alf allowdownloadsignedenabled -bool false

echo '--- Enable application firewall'
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo defaults write /Library/Preferences/com.apple.alf globalstate -bool true
defaults write com.apple.security.firewall EnableFirewall -bool true

echo '--- Enable stealth mode'
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true
defaults write com.apple.security.firewall EnableStealthMode -bool true

echo '--- Disable incoming SSH and SFTP remote logins'
echo 'yes' | sudo systemsetup -setremotelogin off

echo '--- Disable the insecure TFTP service'
sudo launchctl disable 'system/com.apple.tftpd'

echo '--- Disable insecure telnet protocol'
sudo launchctl disable system/com.apple.telnetd

echo '--- Disable local printer sharing with other computers'
cupsctl --no-share-printers

echo '--- Disable printing from external addresses, including the internet'
cupsctl --no-remote-any

echo '--- Disable remote printer administration'
cupsctl --no-remote-admin
