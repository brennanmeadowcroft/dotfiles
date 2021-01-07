#1 /bin/bash

RED="31"
GREEN="32"
BOLD="1"
IMPORTANT="\e[${BOLD};${RED}m"
NOTICE="\e[${BOLD};${GREEN}m"
NORMAL="\e[0m"

if [[ -z ${PROFILE} ]]; then
  printf "Profile variable required! Try using: ${NOTICE}PROFILE={something} ./setup/install-software.sh${NORMAL}\n"
  exit 1
fi

printf "Installing ${NOTICE}Homebrew${NORMAL}..."
if eval "brew -v"; then
  printf "Homebrew ${IMPORTANT}detected${NORMAL}.  No install necessary... updating..."
  brew update 2> /dev/null
else
  printf "Homebrew ${IMPORTANT}NOT detected${NORMAL}... installing now..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 2> /dev/null
fi
printf "Done.\n"

CASK_FILE="brew-cask-${PROFILE}.txt"
COMMON_FILE="brew-cask-common.txt"
HOMEBREW_FILE="homebrew-software.txt"

printf "Installing common software from ${GREEN}${COMMON_FILE}${NORMAL}\n"
cat "$(pwd)/software-list/$COMMON_FILE" | xargs brew cask install

printf "Installing profile specific software from ${GREEN}${CASK_FILE}${NORMAL}\n"
cat "$(pwd)/software-list/$CASK_FILE" | xargs brew cask install

printf "Installing homebrew (non-GUI) applications from ${GREEN}${HOMEBREW_FILE}${NORMAL}\n"
cat "$(pwd)/software-list/$HOMEBREW_FILE" | xargs brew install

printf "Installing ruby and npm global packages\n"
cat "$(pwd)/software-list/gems-software.txt" | xargs gem install
cat "$(pwd)/software-list/npm-global-software.txt" | xargs npm install -g
