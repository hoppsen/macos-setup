#!/usr/bin/env bash

#
# Sources for macOS settings
#
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh
# https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# https://github.com/kevinpapst/mac-os-setup/blob/master/settings/macos.sh
# https://github.com/hjuutilainen/dotfiles/tree/master/bin
#

# Ask for sudo password upfront
sudo -v

printf '\e[1;92mApplying macOS settings\e[m\n'

####################################
### System Preferences > General ###
####################################

# System Preferences > General > Appearance
defaults write -globalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# System Preferences > General > Sidebar icon size: Medium
defaults write -globalDomain NSTableViewDefaultSizeMode -int 2

###################################################
### System Preferences > Desktop & Screen Saver ###
###################################################

# System Preferences > Desktop & Screen Saver > Start after: Never
defaults -currentHost write com.apple.screensaver idleTime -int 0

#################################
### System Preferences > Dock ###
#################################

# System Preferences > Dock > Size:
defaults write com.apple.dock tilesize -int 29

# System Preferences > Dock > Magnification:
defaults write com.apple.dock magnification -bool false

# System Preferences > Dock > Position on screen: Left
defaults write com.apple.dock orientation left

# System Preferences > Dock > Minimize windows using: Genie effect
defaults write com.apple.dock mineffect genie

# System Preferences > Dock > Double-click a window's title bar to zoom
defaults write -globalDomain AppleActionOnDoubleClick Maximize

# System Preferences > Dock > Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# System Preferences > Dock > Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool false

# System Preferences > Dock > Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

############################################
### System Preferences > Mission Control ###
############################################

# System Preferences > Mission Control > Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

##############################################
### System Preferences > Language & Region ###
##############################################

# System Preferences > Language & Region > Preferred languages
defaults write -globalDomain AppleLanguages -array "en-DE" "de-DE"

# System Preferences > Language & Region > Primary language
defaults write -globalDomain AppleLocale "en_DE"

###########################################
### System Preferences > Users & Groups ###
###########################################

# System Preferences > Users & Groups > Disable guest user
sudo /usr/sbin/sysadminctl -guestAccount off
sudo /usr/sbin/sysadminctl -afpGuestAccess off
sudo /usr/sbin/sysadminctl -smbGuestAccess off

#####################################
### System Preferences > Keyboard ###
#####################################

# System Preferences > Keyboard > Text > Correct spelling automatically
defaults write -globalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# System Preferences > Keyboard > Text > Capitalise words automatically
defaults write -globalDomain NSAutomaticCapitalizationEnabled -bool false

# System Preferences > Keyboard > Text > Add full stop with double-space
defaults write -globalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# System Preferences > Keyboard > Text > Use smart quotes and dashes
defaults write -globalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -globalDomain NSAutomaticDashSubstitutionEnabled -bool false

#####################################
### System Preferences > Trackpad ###
#####################################

# System Preferences > Trackpad > Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# System Preferences > Trackpad > Tracking Speed (The maximum trackpad speed you can access from the System Preferences is 3.0)
defaults write -globalDomain com.apple.trackpad.scaling 3

##################################
### System Preferences > Mouse ###
##################################

# System Preferences > Mouse > Tracking Speed (The maximum mouse speed you can access from the System Preferences is 3.0)
defaults write -globalDomain com.apple.mouse.scaling 5

############
### Dock ###
############

# Remove all apps from dock
defaults delete com.apple.dock persistent-apps

# Add selected apps back to the dock
for app in 'file:///System/Applications/Launchpad.app/' \
            'file:///System/Applications/App%20Store.app/' \
            'file:///Applications/Safari.app/' \
            'file:///System/Applications/Messages.app/' \
            'file:///Applications/WhatsApp.app/' \
            'file:///Applications/Microsoft%20Teams.app/' \
            'file:///System/Applications/Notes.app/' \
            'file:///System/Applications/Reminders.app/' \
            'file:///Applications/Microsoft%20Outlook.app/' \
            'file:///System/Applications/Mail.app/' \
            'file:///System/Applications/Calendar.app/' \
            'file:///Applications/Developer.app/' \
            'file:///Applications/Xcode.app/' \
            'file:///Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/' \
            'file:///Applications/Visual%20Studio%20Code.app/' \
            'file:///Applications/Sublime%20Merge.app/' \
            'file:///System/Applications/Home.app/' \
            'file:///Applications/Affinity%20Photo.app/' \
            'file:///Applications/Affinity%20Designer.app/' \
            'file:///Applications/Affinity%20Publisher.app/' \
            'file:///Applications/Spotify.app/' \
            'file:///System/Applications/System%20Preferences.app/' \
            'file:///Applications/iTerm.app/' \
            'file:///Applications/Cisco/Cisco%20AnyConnect%20Secure%20Mobility%20Client.app/'
do
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${app}</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>"
done

##############
### Finder ###
##############

# Finder > Preferences > General > Hard disks
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

# Finder > Preferences > General > External disks
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Finder > Preferences > General > CDs, DVDs and iPods
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder > Preferences > General > Connected servers
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Finder > Preferences > Advanced > Show all filename extensions
defaults write -globalDomain AppleShowAllExtensions -bool true

# Finder > Preferences > Advanced > Show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder > Preferences > Advanced > Show warning before removing from iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Finder > View > As List
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Expand save panel by default
defaults write -globalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write -globalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write -globalDomain PMPrintingExpandedStateForPrint -bool true
defaults write -globalDomain PMPrintingExpandedStateForPrint2 -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist

# Show item info below icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

##############
### Safari ###
##############

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Enable the Develop menu
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Enable Safari’s Debug menu
# defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

#############
### Xcode ###
#############

# TODO: Use the initial setup to determine the changes needed
defaults read com.apple.dt.Xcode > defaults/xcode

##########################
### Kill affected apps ###
##########################

for app in 'Dock' \
            'Finder' \
            'Safari' \
            'SystemUIServer' \
            'Xcode'
do
    killall "${app}" > /dev/null 2>&1
done

printf "\e[93mNote that some of these changes require a logout/restart to take effect!\e[m\n"
