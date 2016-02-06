#! /bin/bash

if eval "brew -v"; then
  echo "Homebrew detected"
  brew update
else
  echo "Homebrew not detected... installing now"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Bootstrapping computer setup.  This could take a while..."
echo "Installing basic components"
# Install RVM
if eval "rvm -v"; then
  echo "RVM installed"
else
  curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

# Install NVM and node
if eval "nvm --version"; then
  echo "NVM installed"
else
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
  nvm install stable
  nvm alias default stable
fi

# Install base software
cat $(pwd)/software-list/homebrew-software.txt | xargs brew install
cat $(pwd)/software-list/gems-software.txt | xargs gem install
cat $(pwd)/software-list/npm-global-software.txt | xargs npm install -g

echo "Installing OSX Xcode Command Line Tools"
if eval "xcode-select -v"; then
  echo "Xcode tools already installed"
else
  echo "Xcode Tools not detected... installing now"
  xcode-select --install
fi

source setup/install_brew_cask.sh
source setup/run_config.sh

echo "Preparing for projects"
# mkdir ~/projects
