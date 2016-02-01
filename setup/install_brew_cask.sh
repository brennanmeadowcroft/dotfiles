#! /bin/bash

echo "Installing Brew Cask for GUI Apps"
cat brew-cask-software.txt | brew cask install
