#! /bin/bash

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

./setup/install_base.sh
./setup/install_software.sh
./setup/run_config.sh
