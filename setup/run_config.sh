#! /bin/bash

echo "Setting global .gitignore"
rm ~/.gitignore_global && n -s .git/.gitignore_global ~/.gitignore_global

echo "Adding dotfiles"
rm ~/.bash_profile && ln -s $(pwd)/active/bash/.bash_profile ~/.bash_profile
rm ~/.bashrc && ln -s $(pwd)/active/bash/.bashrc ~/.bashrc
# rm ~/.gitconfig && cp $(pwd)/active/git/.gitconfig ~/.gitconfig
echo -e "\e[31mImportant! Don't forget to add email to .gitconfig\e[0m"
rm ~/.zshrc && ln -s $(pwd)/active/zsh/.zshrc ~/.zshrc

echo "Setting up TMUX"
rm ~/.tmux.conf && ln -s $(pwd)/active/tmux/.tmux.conf ~/.tmux.conf

echo "Setting up vim"
rm ~/.vimrc && ln -s $(pwd)/active/vim/.vimrc ~/.vimrc
rm -rf ~/.vim && mkdir ~/.vim
ln -s $(pwd)/active/vim/bundle/ ~/.vim/bundle
ln -s $(pwd)/active/vim/autoload/ ~/.vim/autoload
ln -s $(pwd)/active/vim/colors/ ~/.vim/colors

echo -e "\e[31mImportant! Install powerline fonts inside dotfiles/../others/\e[0m"
