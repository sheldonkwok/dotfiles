alias .f 'source ~/.config/fish/config.fish'

export EDITOR=nvim
# source (brew --prefix asdf)/libexec/asdf.fish

export PNPM_HOME=$HOME/Library/pnpm
set --universal nvm_default_version 18

fish_add_path -p $HOME/.bin $HOME/.local/bin $HOME/.local/ssi $HOME/.ssi/bin /opt/homebrew/bin /opt/homebrew/sbin /opt/homebrew/opt/openjdk/bin $PNPM_HOME $HOME/.cargo/bin

starship init fish | source

# aws cli
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'


alias ...='cd ../../'

alias g='git'
alias gc='git commit'
alias vi='nvim'
alias curl='curlie'
alias f='find'
alias m='make'
alias k='kubectl'
alias watch='viddy'
alias lg='lazygit'
alias ag='rg'
alias cat='bat'
alias ping='prettyping'
alias n='npm'
alias p='pnpm'
alias jwt='jq -R \'split(".") | .[0],.[1] | @base64d | fromjson\''

alias cls='clear && ls'
alias l='exa -lh --color always'
alias psg='ps aux | grep'
alias ping8='ping 8.8.8.8'
alias tgs='tig status'
alias dc='docker-compose'
alias dig8='dig @8.8.8.8'
alias gpr='git pull --rebase -p --progress'
alias kks='kubectl -n kube-system'
alias git-clean-merged='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias gcnv='git commit --no-verify'
alias t='terraform'
alias t12='terraform-0.12'
alias t13='terraform-0.13'
alias t14='terraform-0.14'
alias t1='terraform-1'
alias dr='docker run --rm'
alias nr='npm run'
alias v='vault'
alias suvi='sudo nvim'
alias weather='curl wttr.in'
alias dus='du -hs * | sort -h'
alias rmnm='mv node_modules/ old && rm -rf old'
alias vstmux='tmux new -s (basename $PWD)'
