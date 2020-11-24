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

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install fonts
cp -a ~/.macos-setup/fonts/. ~/Library/Fonts

# cd ~/Library/Fonts && { 
#     curl -o 'MesloLGS NF Regular.ttf' 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
#     curl -o 'MesloLGS NF Bold.ttf' 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf'
#     curl -o 'MesloLGS NF Italic.ttf' 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf'
#     curl -o 'MesloLGS NF Bold Italic.ttf' 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf'
#     cd -; }