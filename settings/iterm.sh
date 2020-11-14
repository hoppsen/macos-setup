#!/usr/bin/env bash

#
# iTerm2
#

printf '\e[1;92mImporting iTerm settings\e[m\n'

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.macos-setup/iterm"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true