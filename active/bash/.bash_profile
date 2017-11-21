# Set up version managers
export NVM_DIR="/Users/$USER/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s /home/$USER/.nvm/nvm.sh ]] && . /home/$USER/.nvm/nvm.sh

# Source work based bash profile - see README
[[ -s /Users/$USER/.bash_profile-work ]] && . /Users/$USER/.bash_profile-work

# Aliases
alias ls="gls -lthAGF --color --group-directories-first"
alias tree="tree -FCpuh -L 2 --dirsfirst"
alias ps="ps u -c"

alias docker-clear-all="docker rm $(docker ps -a -q)"
alias docker-clean-all="docker rmi -f $(docker images -a -q)"

alias findfile="find . -type f -name"

# Terminal colors
export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91"

# Setup android development
export ANDROID_HOME=/usr/local/opt/android-sdk

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by Anaconda3 4.2.0 installer
export PATH="/Users/A777967/anaconda/bin:$PATH"

# added by Anaconda3 4.2.0 installer
export PATH="/Users/A777967/anaconda/bin:$PATH"

function monitor-process {
  if [ $# -eq 1 ]; then
    watch "ps u -c | grep $1"
  else
    watch "ps u -c"
  fi
}

# Start tmux
tmux
