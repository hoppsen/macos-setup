#!/usr/bin/env bash

#
# Oh My Zsh is an open source, community-driven framework for managing your Zsh configuration.
#
# For more details, see https://ohmyz.sh/
#

if [ -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
    printf "\e[93moh-my-zsh already installed!\e[m\n"
    exit -1
fi

printf '\e[1;92mInstalling oh-my-zsh\e[m\n'

sh -c "env() {
    echo 'Dont want to stop installing by changing the environment to zsh'
}
$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k