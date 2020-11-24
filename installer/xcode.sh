#!/usr/bin/env bash

#
# Command Line Tools for Xcode
#

if defaults read com.apple.dt.Xcode &> /dev/null; then
    printf "\e[93mCommand Line Tools license already accepted!\e[m\n"
    exit -1
fi

# Accept Command Line Tools license
sudo xcodebuild -license accept