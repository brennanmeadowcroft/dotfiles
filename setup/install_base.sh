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

printf "Cloning fonts"
git clone https://github.com/ryanoasis/nerd-fonts.git active/fonts/nerd-fonts

git clone https://github.com/powerline/fonts.git active/fonts/powerline-fonts
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

## OSX Command Line
printf "Installing ${NOTICE}OSX Xcode Command Line Tools${NORMAL}..."
if eval "xcode-select -v"; then
  printf "${IMPORTANT}Already Installed.${NORMAL}\n"
else
  xcode-select --install 2> /dev/null
  printf "Done.\n"
fi

## Programming Language Support
# Install NVM and node
printf "Installing ${NOTICE}NVM${NORMAL}..."
if eval "nvm --version"; then
  echo "${IMPORTANT}Already Installed.${NORMAL}\n"
else
  mkdir -p $NVM_DIR 2> /dev/null
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash 2> /dev/null
  nvm install stable 2> /dev/null
  nvm alias default stable 2> /dev/null
  printf "Done.\n"
fi

## Python
if eval "pip --version"; then
  echo "Pip is currently installed."
  printf "Updating pip to latest version (if needed)..."
  pip install --upgrade --user pip
  pip3 install --upgrade --user pip
  printf "Done.\n"

  printf "Installing virtualenv..."
  pip install virtualenv
  pip3 install virtualenv
  printf "Done.\n"
else
  printf "${IMPORTANT}pip not available on this system!!!!${NORMAL}"
fi

if eval "pip3 --version"; then
  printf "Updating pip to latest version (if needed)..."
  pip3 install --upgrade --user pip
  printf "Done.\n"

  printf "Installing virtualenv..."
  pip3 install virtualenv
  printf "Done.\n"
else
  printf "${IMPORTANT}pip3 not available on this system!!!!${NORMAL}"
fi
