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

# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Workaround for ARM Macs
arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# sudo mkdir -p /opt/homebrew
# sudo chown -R $(whoami):staff /opt/homebrew
# cd /opt
# curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

# Make sure we’re using the latest Homebrew
brew update
brew upgrade

# Install Brew cask for standalone software installations
brew tap homebrew/cask
brew tap homebrew/cask-versions

# Be able to use the Brewfile to install all software
# see https://github.com/Homebrew/homebrew-bundle
brew tap homebrew/bundle

# Remove outdated versions from the cellar
brew cleanup

# deactivate google analytics, see https://docs.brew.sh/Analytics
brew analytics off
