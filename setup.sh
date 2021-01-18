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

# Get the directory's absolute path
ABSOLUTE_DIR="$(cd "$(dirname "$0")"; pwd -P)"

# Pull latest changes from GitHub
header check_for_updates
cd $ABSOLUTE_DIR
git pull origin master
git submodule update --init --recursive
git submodule foreach git pull origin master

# Read the initial macOS defaults for later comparison
header defaults
if [ ! -d 'defaults' ]; then
  printf '\e[1;92mStoring macOS defaults\e[m\n'
  mkdir defaults
  defaults read > defaults/macos
else
  printf '\e[1;93mmacOS defaults already existing\e[m\n'
fi

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
  printf '\e[1;91mEnsure you are logged into the Mac App Store. Consider installing Xcode manually. Press enter to continue ...\e[m\n'; read -s -p $''
  arch -x86_64 brew bundle
fi

# --------------------------------------------------------------------

# Install application settings
header settings
if ask_question 'Do you want to install application and macOS settings?'; then
  printf '\e[1;92mApplying settings\e[m\n'
  for s in ./settings/*; do
    echo "Apply settings from '$s':"
    sh $s
  done
fi

# --------------------------------------------------------------------

# Synchronize .dotfiles from repository
header dotfiles
if ask_question 'Do you want to synchronize .dotfiles?'; then
  printf '\e[1;92mSynchronizing dotfiles\e[m\n'
  rsync -av --no-perms --exclude="LICENSE" --exclude="README.md" --exclude=".git" ./dotfiles/ ~
  source ~/.zshrc
fi

# --------------------------------------------------------------------

# Copy hosts file over to /etc/hosts
header etc_hosts
if ask_question 'Do you want to overwrite the hosts?'; then
  printf '\e[1;92mOverwriting hosts\e[m\n'
  sudo cp hosts /etc/hosts
fi

# --------------------------------------------------------------------

# Read the current defaults into a file
header current_defaults
if ask_question 'Do you want to store the current defaults?'; then
  printf '\e[1;92mStoring current defaults\e[m\n'
  defaults read > defaults/current
fi

# --------------------------------------------------------------------

# Now ask for a reboot, which is highly recommended after installing and configuring everything
header reboot
if ask_question 'Do you want to reboot your computer now?'; then
  printf '\e[1;91mRebooting ...\e[m\n'
  sudo reboot
  exit 0
fi

unset DOTFILES_DIR
unset -f ask_question
exit 1
