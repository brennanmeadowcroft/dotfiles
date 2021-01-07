if [ -z ${USER+x} ]; then
  echo "USER was not previously set... setting now"
  USER=`whoami`
fi

# Set up version managers
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s /home/$USER/.nvm/nvm.sh ]] && . /home/$USER/.nvm/nvm.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/anaconda3/bin"

function monitor-process {
  if [ $# -eq 1 ]; then
    watch "ps u -c | grep $1"
  else
    watch "ps u -c"
  fi
}

# Start tmux
 # If script is run inside tmux, exit without doing anything
if [[ -n $TMUX ]]; then
  echo "Nested tmux sessions not supported!"
  exit 0
else
  # tmux
  tmux source-file ~/.tmux.conf
fi
