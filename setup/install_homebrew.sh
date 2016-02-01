#! /bin/bash

if eval "brew --help"; then
  echo "Homebrew detected"
else
  echo "Homebrew not detected... installing now"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cat ../software-list/brew-software.txt | brew install
