# Dotfiles
This contains all the configuration necessary to get a new development machine up and running.

## Cheatsheets
Keyboard shortcuts and cheatsheets for these dotfiles are available on Cheatography

* Vim: [https://s3.amazonaws.com/bmeadowcroft/cheatsheets/vim-cheatsheet.pdf](https://s3.amazonaws.com/bmeadowcroft/cheatsheets/vim-cheatsheet.pdf)
* TMUX/Bash: [https://s3.amazonaws.com/bmeadowcroft/cheatsheets/bash-cheatsheet.pdf](https://s3.amazonaws.com/bmeadowcroft/cheatsheets/bash-cheatsheet.pdf)

## Running Setup
1. Clone this repository to the home directory (`~`)
2. Download the submodules
```
git submodule init
git submodule update
```
3. If not already completed, run `/setup/create_db_connections.sh` to create the sample dbext.vim config files.

## Additional Software
Some software is unable to be installed via a script.  At time of writing, this included XCode, Airmail and personal versions of MS Office.  These will need to be installed either through a downloaded installer or the App Store.

## Setup Script
The setup script will install and configure a new machine with necessary software and configuration.

It looks to the txt files in the root directory to identify which software to install via the script.  To add an extra program or package, simply add it to the bottom of the appropriate file.  The value you add to the bottom of the file needs to match what would be used for the install script.  For instance, if you wanted to use `brew install caskroom/cask/brew-cask` then you would append `caskroom/cask/brew-cask`.

| file                      | description                                                            |
|---------------------------|------------------------------------------------------------------------|
| `brew-software.txt`       | Packages installed via homebrew                                        |
| `gems-software.txt`       | Ruby gems to be installed beyond those associated with a given project |
| `npm-global-software.txt` | Global npm packages                                                    |

## Bash profiles for work
The current version of `.bash_profile` will check for a "work" specific bash preferences.  This is for things like work-specific command line tools and aliases that aren't applicable for personal applications and side projects.  To enable this
functionality, create `~/bash_profile-work` and add commands as necessary.

## Configuration
Configuration files are available for:

- git
- zsh
- bash
- tmux
- vim
- ag
- atom
- iterm2


# Vim
### dbext.vim
This plugin allows for querying databases from inside vim.  However, to keep database connections secure, the credentials are not kept in source control.  `/setup/create_db_connections.sh` will create sample connection and password files in the home directory.  This allows for SQL connections to remain on the machine.

`.vimrc` will attempt to source the connection files on load.  Directions for connecting and switching database profiles are available in the cheatsheet.
