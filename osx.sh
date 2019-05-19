#!/usr/bin/env bash

set -eu

# Configure clock
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  h:mm:ss a"

# Show volume in memu bar (FIXME: how to apply?)
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -int 1
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Clock.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Displays.menu" "/System/Library/CoreServices/Menu Extras/Volume.menu"

# Always show scroll bars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Expand "save" dialog
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand "print" dialog
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Configure keyboard
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSAutomaticQuoteSubstitutionEnabled -int 0
defaults write NSAutomaticDashSubstitutionEnabled -int 0

# Disable touch bar
defaults write com.apple.touchbar.agent PresentationModeGlobal functionKeys
killall ControlStrip || true

# Configure dock
defaults write com.apple.dock tilesize -int 32
defaults write com.apple.dock show-recents -int 0
defaults delete com.apple.dock persistent-apps || true
for app in "/Applications/Firefox.app" "/Applications/Mail.app" "/Applications/Sublime Text.app" "/Applications/iTerm.app"; do
  defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done

# Enable hot corner (start screen saver in bottom left)
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Apply dock changes
killall Dock

# Configure finder
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXDefaultSearchScope -string SCcf
defaults write com.apple.finder FXEnableExtensionChangeWarning -int 0
defaults write com.apple.finder NewWindowTarget -string PfHm
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME"

# Apply Finder changes
killall Finder

# Configure screen saver
defaults write com.apple.screensaver "askForPassword" -int 1
defaults write com.apple.screensaver "askForPasswordDelay" -int 5
defaults -currentHost write com.apple.screensaver "idleTime" -int 300
defaults -currentHost write com.apple.screensaver "moduleDict" -dict-add "moduleName" -string "Computer Name"
defaults -currentHost write com.apple.screensaver "moduleDict" -dict-add "path" -string "/System/Library/Frameworks/ScreenSaver.framework/Resources/Computer Name.saver"
defaults -currentHost write com.apple.ScreenSaver.Basic "MESSAGE" -string "Hey kid, I'm a computer."

# Disable growl notifications from Cyberduck
defaults write ch.sudo.cyberduck growl.enable false

# Configure Mail
defaults write com.apple.mail RichMessageList -int 0
