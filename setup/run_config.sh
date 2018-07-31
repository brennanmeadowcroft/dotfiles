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

#printf "Adding dotfiles...\n"
#printf "${GREEN_BOLD}Bash${NORMAL}..."
#rm ~/.bash_profile 2> /dev/null
#ln -s $(pwd)/active/bash/.bash_profile ~/.bash_profile
#rm ~/.bashrc 2> /dev/null
#ln -s $(pwd)/active/bash/.bashrc ~/.bashrc
#printf "${GREEN_BOLD}Gitconfig${NORMAL}..."
# rm ~/.gitconfig 2> /dev/null && cp $(pwd)/active/git/.gitconfig ~/.gitconfig
# echo -e "\e[31mImportant! Don't forget to add email to .gitconfig\e[0m"
#printf "${GREEN_BOLD}zshell${NORMAL}..."
#rm ~/.zshrc 2> /dev/null
#ln -s $(pwd)/active/zsh/.zshrc ~/.zshrc
#printf "...Done.\n"

printf "Setting up ${GREEN_BOLD}TMUX${NORMAL}..."
rm ~/.tmux.conf 2> /dev/null
ln -s $(pwd)/active/tmux/.tmux.conf ~/.tmux.conf
printf "Done.\n"

printf "Setting up ${GREEN_BOLD}Zsh${NORMAL}..."
rm ~/.zshrc 2> /dev/null
ln -s $(pwd)/active/zsh/.zshrc ~/.zshrc
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

printf "Setting up ${GREEN_BOLD}NeoVim${NORMAL}..."
rm ~/.config/nvim/init.vim 2> /dev/null
ln -s $(pwd)/active/neovim/init.vim ~/.config/nvim/init.vim
printf "Done.\n"

printf "${IMPORTANT}Important! ${NORMAL}Install powerline fonts inside dotfiles/../others/\n"
printf "run ${CODE}./active/other/powerline-fonts/install.sh${NORMAL}\n"

echo "Don't forget to restart the terminal for changes to take effect!"
