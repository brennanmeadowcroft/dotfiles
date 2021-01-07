# Aliases
alias ls="gls -lthAGF --color --group-directories-first"
alias tree="tree -FCpuh -L 2 --dirsfirst"
alias ps="ps u -c"
alias graph="git log --oneline --decorate --all --graph"

if [[ -n docker ]]; then
  echo "Docker not currently running! Start Docker and restart terminal to get Docker aliases."
else
  alias docker-clear-all="docker rm $(docker ps -a -q)"
  alias docker-clean-all="docker rmi -f $(docker images -a -q)"
fi

alias findfile="find . -type f -name"

# Terminal colors
export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91"
