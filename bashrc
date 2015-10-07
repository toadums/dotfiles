export EDITOR=vim

# Gimme all the files
ulimit -n 10000

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Load colors
source ~/.bash_prompt

# ALIASES
alias ac="cd ~/code/accio"
alias aw="cd ~/code/games/awfultower"
alias code="cd ~/code"
alias v="mvim"

alias :q="exit"

alias gs="git status -s"
alias gb="git branch"
alias gd="git diff"
alias ga="git add -ip"
alias chom="git checkout origin master"
alias gp="git pull origin $( git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')"
alias gl="git log --oneline --decorate"
alias gt="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias pc="cd ~/code/ruboss/dashcube"

alias ls="ls -F1aG"
alias vi="vim"
alias aw="cd ~/code/awfultower"

alias b="bundle exec"

alias tu="cd ~/code/turnip"
alias tus="cd ~/code/turnip/turnip-server"
alias tui="cd ~/code/turnip/iOs"

alias emacs="open -a Emacs ."


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="/Users/diddy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(rbenv init -)"
