#1 /bin/bash

RED="31"
GREEN="32"
BOLD="1"
IMPORTANT="\e[${BOLD};${RED}m"
NOTICE="\e[${BOLD};${GREEN}m"
NORMAL="\e[0m"

printf "Installing ${NOTICE}Homebrew${NORMAL}..."
if eval "brew -v"; then
  printf "Homebrew ${IMPORTANT}detected${NORMAL}.  No install necessary... updating..."
  brew update 2> /dev/null
else
  printf "Homebrew ${IMPORTANT}NOT detected${NORMAL}... installing now..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 2> /dev/null
fi
printf "Done.\n"

CASK_FILE="admin-brew-cask.txt"
printf "Installing admin software from ${IMPORTANT}${CASK_FILE}${NORMAL}\n"
cat "$(pwd)/software-list/$CASK_FILE" | xargs brew cask install
