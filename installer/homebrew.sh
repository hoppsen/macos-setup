#!/usr/bin/env bash

#
# The missing package manager for macOS
#
# For more details, see https://brew.sh/
#

if [ $(which brew) ]; then
    printf "\e[93mHomebrew already installed!\e[m\n"
    exit -1
fi

printf '\e[1;92mInstalling homebrew\e[m\n'

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew
brew update
brew upgrade --all

# Install Brew cask for standalone software installations
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Be able to use the Brewfile to install all software
# see https://github.com/Homebrew/homebrew-bundle
brew tap homebrew/bundle

# Remove outdated versions from the cellar
brew cleanup

# deactivate google analytics, see https://docs.brew.sh/Analytics
brew analytics off