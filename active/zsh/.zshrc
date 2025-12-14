# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
source $(brew --prefix)/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme

# Download Znap, if it's not there yet. - Znap is a plugin manager for Zsh
[[ -r ~/dotfiles/active/zsh/plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/dotfiles/active/zsh/plugins/znap
source ~/dotfiles/active/zsh/plugins/znap/znap.zsh  # Start Znap

## Update PATH
export PATH="/usr/local/go/bin:$PATH" # Golang
export PATH="$PATH:$HOME/bin" # warrensbox/tfswitch

## Set up 1Password SSH to work with GitKraken
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Load language version managers
eval "$(rbenv init - zsh)"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## Configure Shell
export BAT_CONFIG_PATH="${HOME}/.bat.conf"
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-autosuggestions

znap source marlonrichert/zsh-autocomplete
# https://thevaluable.dev/zsh-completion-guide-examples/
# https://github.com/marlonrichert/zsh-snap/blob/main/.zshrc
zstyle ':autocomplete:history-search-backward:*' list-lines 16
zstyle ':completion:*' menu select
zstyle ':completion:*' file-list all
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

znap source marlonrichert/zcolors
znap eval marlonrichert/zcolors "zcolors ${(q)LS_COLORS}"

bindkey -v # Add vim keybindings in zsh

alias cat="bat"
alias rm="trash"
alias ls="exa -l -a --long --header --git"
alias tf="terraform"
alias tree="exa --header --long --tree --level=2"
alias glog="git log --oneline --decorate --all --graph"



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
