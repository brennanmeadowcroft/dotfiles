# Dotfiles
This contains all the configuration necessary to get a new development machine up and running.

## Running Setup
1. Clone this repository to the home directory (`~`)
2. Run the setup script to copy the configuration files
```
./setup_machine.sh
```
3. If necesary, run the setup script with additional flags to install packages for a particular use case

## Setup Script
The setup script will install and configure a new machine with necessary software and configuration.

It looks to the txt files in the root directory to identify which software to install via the script.  To add an extra program or package, simply add it to the bottom of the appropriate file.  The value you add to the bottom of the file needs to match what would be used for the install script.  For instance, if you wanted to use `brew install caskroom/cask/brew-cask` then you would append `caskroom/cask/brew-cask`.

| file                      | description                                                            |
|---------------------------|------------------------------------------------------------------------|
| `brew-software.txt`       | Packages installed via homebrew                                        |
| `gems-software.txt`       | Ruby gems to be installed beyond those associated with a given project |
| `npm-global-software.txt` | Global npm packages                                                    |

Beyond basic installation, packages and software can be installed for a particular use case such as development or data science using `setup_machine.sh` and the appropriate flag.

To see the commands available for installation, use `./setup_machine.sh --help`

## Configuration
Configuration files are available for:

- git
- zsh
- bash
- Atom text editor
