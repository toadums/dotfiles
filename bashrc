export EDITOR=nvim

# Gimme all the files
ulimit -n 10000

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Load colors
source ~/.bash_prompt

# ALIASES
alias ac="cd ~/code/accio/web"
alias ai="cd ~/code/accio/rn"
alias al="cd ~/code/accio/lib"
alias aw="cd ~/code/games/awfultower"
alias code="cd ~/code"

alias api="cd ~/code/accio/api"
alias admin="cd ~/code/accio/admin"
alias oy="cd ~/code/oystr/rn"
alias cw="cd ~/code/craftt/web"
alias pc="cd ~/code/ruboss/dashcube"
alias beerfest="cd ~/code/beerfest"
alias assembly="cd ~/code/accio/consulting/assembly"

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
alias b="bundle exec"
alias tl="tmux list-sessions"
alias ngrok="/Applications/ngrok"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="/Users/diddy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(rbenv init -)"

HISTSIZE=10000
HISTFILESIZE=-1

export ANDROID_HOME=/usr/local/opt/android-sdk

export FZF_DEFAULT_COMMAND='ag -g ""'

export CODE_TSJS=1
export PATH="$PATH:$HOME/.yarn/bin"
export DISPLAY=

