#!/usr/bin/env bash

#
# Command Line Tools for Xcode
#

if xcode-select --print-path &> /dev/null; then
    printf "\e[93mCommand Line Tools already installed!\e[m\n"
    exit -1
fi

# Prompt user to install the Command Line Tools for Xcode
xcode-select --install &> /dev/null

# Wait until the Command Line Tools for Xcode are installed
until xcode-select --print-path &> /dev/null; do
sleep 5
done

print_result $? 'Install Command Line Tools'

# Point the `xcode-select` developer directory to the appropriate directory from within `Xcode.app`
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
print_result $? 'Make "xcode-select" developer directory point to Xcode'

sudo xcodebuild -license accept