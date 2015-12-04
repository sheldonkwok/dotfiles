plugins=(git)
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="idisagree" # custom
source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color
export EDITOR=vim

# OS X clang
export CC=clang
export CXX=clang++

# PATH
# zsh specific but it looks nice
path=(
  $path
  $HOME/Library/Python/2.7/bin
  $HOME/.bin
  /usr/local/opt/rabbitmq/sbin
  /usr/local/packer
)

export PYTHONPATH=/lib/python2.7/site-packages # $HOME/Library/Python/2.7/lib/python/site-packages

# I just use the os x keychain manager now
# eval `keychain --eval id_rsa`


# NVM
export NVM_DIR=$HOME/.nvm
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

# RVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# GoVM
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

# Work
source ~/.work.sh

# Personal
source ~/.private.sh

# Aliases
source ~/.bash_aliases

# AWS Tab Complete
# source /bin/aws_zsh_completer.sh

# NPM Tab complete
eval "`npm completion`"

# Docker VM
eval "$(docker-machine env local)"
