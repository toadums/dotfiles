export EDITOR=vim

# Gimme all the files
ulimit -n 10000

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Set up some environments
source ~/.nvm/nvm.sh

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


