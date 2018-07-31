#! /bin/bash

RED="31"
GREEN="32"
BOLD="1"
IMPORTANT="\e[${BOLD};${RED}m"
NOTICE="\e[${BOLD};${GREEN}m"
NORMAL="\e[0m"

printf "Initializing submodules\n"
git submodule init && git submodule update
printf "Done.\n"

printf "Installing ${NOTICE}Oh My Zsh${NORMAL}..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussel/oh-my-zsh/master/tools/install.sh)" 2> /dev/null
printf "Done.\n"

printf "Installing ${NOTICE}Homebrew${NORMAL}..."
if eval "brew -v"; then
  printf "Homebrew ${IMPORTANT}detected${NORMAL}.  No install necessary... updating..."
  brew update 2> /dev/null
else
  printf "Homebrew ${IMPORTANT}NOT detected${NORMAL}... installing now..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 2> /dev/null
fi
printf "Done.\n"

printf "Bootstrapping computer setup.  This could take a while...\n"
printf "Installing basic components \n"
# Install RVM
printf "Installing ${NOTICE}RVM${NORMAL}..."
if eval "rvm -v"; then
  echo "${IMPORTANT}Already Installed.${NORMAL}\n"
else
  curl -sSL https://get.rvm.io | bash -s stable --ruby 2> /dev/null
  printf "Done.\n"
fi

# Install NVM and node
printf "Installing ${NOTICE}NVM${NORMAL}..."
if eval "nvm --version"; then
  echo "${IMPORTANT}Already Installed.${NORMAL}\n"
else
  mkdir -p $NVM_DIR 2> /dev/null
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash 2> /dev/null
  nvm install stable 2> /dev/null
  nvm alias default stable 2> /dev/null
  printf "Done.\n"
fi

## Install base software
#cat $(pwd)/software-list/homebrew-software.txt | xargs brew install
#cat $(pwd)/software-list/gems-software.txt | xargs gem install
#cat $(pwd)/software-list/npm-global-software.txt | xargs npm install -g
#cat $(pwd)/software-list/brew-cask-software.txt | xargs brew cask install

printf "Installing ${NOTICE}OSX Xcode Command Line Tools${NORMAL}..."
if eval "xcode-select -v"; then
  printf "${IMPORTANT}Already Installed.${NORMAL}\n"
else
  xcode-select --install 2> /dev/null
  printf "Done.\n"
fi

source setup/run_config.sh

printf "Creating projects folder..."
mkdir -p ~/projects 2> /dev/null
printf "Done.\n"
