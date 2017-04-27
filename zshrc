# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/pauldemchuk/.oh-my-zsh

ZSH_THEME=steeef

plugins=(git)

source $ZSH/oh-my-zsh.sh
#
# User configuration

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

ulimit -n 10000

# postgres
export PGDATA=~/pgdb

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases
alias code="cd ~/code"

alias rn="cd ~/code/accio/rn"
alias api="cd ~/code/accio/api"
alias admin="cd ~/code/accio/admin"

alias asm="cd ~/code/consulting/upwords/assembly"
alias coar="cd ~/code/consulting/ruboss/coar"

alias :q="exit"

alias gs="git status -s"
alias gb="git branch"
alias gd="git diff"
alias ga="git add -ip"
alias gc="git checkout"
alias gl="git log --oneline --decorate"
alias gt="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gn="git rev-list --left-right --count"

alias gpull='git pull --rebase origin `git rev-parse --abbrev-ref HEAD`'
alias gp='git push origin HEAD'

alias ls="ls -F1aG"
alias vi="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
