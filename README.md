# macOS setup - Setting up a new Mac automated

Everybody knows the feeling of receiving a new Mac, be it at work or personal, and you are basically blocked for half a day, until everything is set up in a way where you are most productive. :100:

This repository is here to fix exactly this... well, at least for myself :nerd_face:. From now on it should be enough to follow the steps below, to set up a new Mac the way I'm used to and productive.

Furthermore, I hope that you will use it as an inspiration or even a starting point for your own environment automation script. :bulb:

## Installation

> :warning: **WARNING!** Don't use this setup process blindly, unless you know what that entails. I would suggest to review the code, maybe even fork and adapt to your own needs. But definitely backup your existing files before installing.

1. Checkout the Git repository
    ```bash
    git clone https://github.com/hoppsen/macos-setup.git ~/.macos-setup
    ```
2. Navigate to the folder and run `setup.sh`
    ```bash
    cd ~/.macos-setup
    sh setup.sh
    ```

### Update / Re-running

Start from step 2 of the [installation](#installation) process.

## Manual steps

* [ ] Enable `Accessibility` for `Divvy.app` and `iTerm.app`
* [ ] Enable `Full Disk Access` for `iTerm.app`
* [ ] Create SSH key and add public key to `GitHub`, etc.
* [ ] Copy over large files (Final Cut library, Raw photo files, etc.)

## Inspired by:

* [dotfiles](http://dotfiles.github.io/) - Your unofficial guide to dotfiles on GitHub.
* [Kevin Pabst](https://github.com/kevinpapst/mac-os-setup) and his setup repository
* [Felix Krause](https://github.com/KrauseFx/new-mac) and his new mac repository
* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) and his dotfiles repository
* [tutsplus tutorial](http://net.tutsplus.com/tutorials/tools-and-tips/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles/) on how to setup a mac with dotfiles