#! /bin/bash

echo "Setting global .gitignore"
rm ~/.gitignore_global && n -s .git/.gitignore_global ~/.gitignore_global

echo "Adding dotfiles"
rm ~/.bash_profile && ln -s $(pwd)/active/bash/.bash_profile ~/.bash_profile
rm ~/.bashrc && ln -s $(pwd)/active/bash/.bashrc ~/.bashrc
rm ~/.gitconfig && ln -s $(pwd)/active/git/.gitconfig ~/.gitconfig
echo -e "\e[31mImportant! Don't forget to add email to .gitconfig\e[0m"
rm ~/.zshrc && ln -s $(pwd)/active/zsh/.zshrc

if eval "apm"; then
  echo "Setting up Atom"
  apm install --silent --packages-file $(pwd)/active/atom/my-packages.txt
else
  echo "Atom Editor not set up.  Please install."
fi
