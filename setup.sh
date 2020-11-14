#!/bin/bash

# Ask the user a Yes/No question
function ask_question() {
  read -p "${1} (y/N) " choice
  case "$choice" in
      Y | y | Yes | YES | yes ) return 0; exit;;
      N | n | No | NO | no ) return 1; exit;;
      * ) return 2;;
  esac
}

# Create a header (similar to the UI.header() from ruby)
function header() {
  string="--- Step: $1 ---"
  printf '\e[1;92m'
  printf %${#string}s |tr ' ' '-'
  printf "\n$string\n"
  printf %${#string}s |tr ' ' '-'
  printf '\n\e[m'
}

# Get the dotfiles directory's absolute path
DOTFILES_DIR="$(cd "$(dirname "$0")"; pwd -P)"

# Pull latest changes from GitHub
header check_for_updates
cd $DOTFILES_DIR
git pull origin master
git submodule update --init --recursive
git submodule foreach git pull origin master

# --------------------------------------------------------------------

# Install all software not bundled in homebrew
header software
if ask_question 'Do you want to install un-brewed software?'; then
  printf '\e[1;92mInstalling software\e[m\n'
  for i in ./installer/*; do
    echo "Executing '$i':"
    sh $i
  done
fi

# --------------------------------------------------------------------

# Install all homebrew supported software
header homebrew
if ask_question 'Do you want to install homebrew software?'; then
  printf '\e[1;92mInstalling brews\e[m\n'
  brew bundle
fi

# --------------------------------------------------------------------

# Install application settings
header settings
if ask_question 'Do you want to install application and macOS settings?'; then
  printf '\e[1;Applying settings\e[m\n'
  for s in ./settings/*; do
    echo "Apply settings from '$s':"
    sh $s
  done
fi

# --------------------------------------------------------------------

# Synchronize .dotfiles from repository
header dotfiles
if ask_question 'Do you want to synchronize .dotfiles?'; then
  printf '\e[1;Synchronizing dotfiles\e[m\n'
  rsync -av --no-perms --exclude="LICENSE" --exclude="README.md" --exclude=".git" ./dotfiles/ ~
  source ~/.zshrc
fi

# --------------------------------------------------------------------

# Now ask for a reboot, which is highly recommended after installing and configuring everything
header reboot
if ask_question 'Do you want to reboot your computer now?'; then
  printf '\e[91mRebooting ...\e[m'
  sudo reboot
  exit 0
fi

unset DOTFILES_DIR
unset -f ask_question
exit 1
