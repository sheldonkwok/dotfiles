export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "/home/sheldon/.gvm/scripts/gvm" ]] && source "/home/sheldon/.gvm/scripts/gvm"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$HOME/.bin:$HOME/.local/bin:$HOME/.local/ssi:$HOME/.ssi/bin:$PATH
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/nvim-linux64/bin

source $HOME/.local/aws/bin/aws_zsh_completer.sh
source <(kops completion zsh)

# change wallpaper
xset r rate 300 100 # keyboard repeat
change-wallpaper

# Use gitignore with fzf
export FZF_DEFAULT_COMMAND='rg --files'

# aliases
alias vi='nvim'
alias cls='clear && ls'
alias l='exa -lh --color always'
alias m='make'
alias psg='ps aux | grep'
alias ping8='ping 8.8.8.8'
alias tgs='tig status'
alias pbcopy='xsel --clipboard --input'
alias dc='docker-compose'
alias fuckresolved='sudo systemctl stop systemd-resolved.service && sudo systemctl stop systemd-resolved.service'
alias dig8='dig @8.8.8.8'
alias gpr='git pull --rebase -p --progress'
alias gpf='git push --force-with-lease'
alias grim='git rebase -i origin/master'
alias k='kubectl'
alias kp='kubectl -n prod'
alias kks='kubectl -n kube-system'
alias y='yarn'
alias git-clean-merged='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias gcnv='git commit --no-verify'
alias ip='ip -c'
alias ipb='ip -brief'
alias code='code -n'
alias t='terraform'
