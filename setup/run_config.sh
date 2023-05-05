#! /bin/bash

RED="\e[31m"
GREEN="\e[32m"
NORMAL="\e[0m"
RED_BOLD="\e[1;31m"
GREEN_BOLD="\e[1;92m"
IMPORTANT="${RED_BOLD}"
CODE="\e[1;90;47m"

printf "\nConfiguring applications\n\n"
printf "Setting global ${GREEN_BOLD}.gitignore${NORMAL}..."
rm ~/.gitignore_global 2> /dev/null
ln -s $(pwd)/active/git/.gitignore_global ~/.gitignore_global
printf "Done.\n"

# printf "Setting up ${GREEN_BOLD}TMUX${NORMAL}..."
# rm ~/.tmux.conf 2> /dev/null
# ln -s $(pwd)/active/tmux/.tmux.conf ~/.tmux.conf
# printf "Done.\n"

printf "Setting up ${GREEN_BOLD}Zsh${NORMAL}..."
rm ~/.zshrc 2> /dev/null
ln -s $(pwd)/active/zsh/.zshrc ~/.zshrc
printf "Done.\n"

printf "Setting up ${GREEN_BOLD}Powerlevel 10k${NORMAL}..."
rm ~/.p10k.zsh 2> /dev/null
ln -s $(pwd)/active/powerlevel10k/.p10k.zsh ~/.p10k.zsh
printf "Done.\n"

printf "Setting up ${GREEN_BOLD}vim${NORMAL}..."
rm ~/.vimrc 2> /dev/null
ln -s $(pwd)/active/vim/.vimrc ~/.vimrc
rm -rf ~/.vim 2> /dev/null
mkdir ~/.vim
ln -s $(pwd)/active/vim/bundle/ ~/.vim/bundle
ln -s $(pwd)/active/vim/autoload/ ~/.vim/autoload
ln -s $(pwd)/active/vim/colors/ ~/.vim/colors
printf "Done.\n"

printf "Creating projects folder..."
mkdir -p ~/projects 2> /dev/null
printf "Done.\n"

printf "Installing Fira Code fonts..."
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
printf "Done.\n"

printf "${IMPORTANT}Important! ${NORMAL}Install powerline fonts inside dotfiles/../others/\n"
printf "run ${CODE}./active/other/powerline-fonts/install.sh${NORMAL}\n"

printf "${IMPORTANT}Important! ${NORMAL}Install nerd fonts inside dotfiles/../others/\n"
printf "run ${CODE}./active/other/nerd-fonts/install.sh${NORMAL}\n"

echo "Don't forget to restart the terminal for changes to take effect!"
