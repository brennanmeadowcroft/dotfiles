# Dotfiles
This contains all the configuration necessary to get a new development machine up and running.

## Running Setup
1. Clone this repository to the home directory (`~`)
2. Make the setup script executable for your user
```
chmod 755 setup_machine.sh
```
3. Run the setup machine script... this should take care of installing most of the necessary software and linking all the dotfiles appropriately.
```
PROFILE={work|personal} ./setup_machine.sh
```

### Brand new, personal computers
If the computer is a personal one and is being set up for the very first time, install the admin applications in a admin account as the first order of business.

Follow the steps above but replace step 3 with: `./setup/setup_admin.sh`.  No profile is necessary when running this command.

## Additional Software
Some software is unable to be installed via a script and either needs to be downloaded directly or through the app store.  At time of writing, this included:
| App | Source |
|-----|--------|
| Wireguard | App Store |

### App Specific Configuration
#### VS Code
Settings for Visual Studio are synced via Github. To turn this on, open VS Code and click the gear icon in the bottom left. Select "Settings Sync" and sign in with the `brennanmeadowcroft` account.

#### iTerm
For iTerm to show up as expected, the Powerline and Nerd Fonts both need to be installed. Setup scripts should automatically clone the repos but you will need to run the install script:
```
source active/fonts/nerd-fonts/install.sh
```

```
source active/fonts/powerline-fonts/install.sh
```

Once installed, update the font in iTerm by going to Settings > Profiles > "Default" > Text.  Choose one associated with Powerline. "Fira Code" is recommended but "Source Code Pro" is also nice.

## Setup Script
The setup script will install and configure a new machine with necessary software and configuration.

It looks to the txt files in the root directory to identify which software to install via the script.  To add an extra program or package, simply add it to the bottom of the appropriate file.  The value you add to the bottom of the file needs to match what would be used for the install script.  For instance, if you wanted to use `brew install caskroom/cask/brew-cask` then you would append `caskroom/cask/brew-cask`.

## Configuration
Active configurations are in the `active/` folder. Unused configurations are stored for archival purposes in `inactive/`.
