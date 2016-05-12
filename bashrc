export EDITOR=vim

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

# tmuxp projects
alias accio="tmuxp load accio.yaml"
alias craftt="tmuxp load craftt.yaml"
alias oystr="tmuxp load oystr.yaml"
alias timer="tmuxp load timer.yaml"

alias oy="cd ~/code/oystr/rn"

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
alias vi="nvim"
alias vim="nvim"

alias b="bundle exec"

alias cw="cd ~/code/craftt/web"

alias tl="tmux list-sessions"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="/Users/diddy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(rbenv init -)"

HISTSIZE=10000
HISTFILESIZE=-1

source ~/venv/bin/activate

export ANDROID_HOME=/usr/local/opt/android-sdk
export FZF_DEFAULT_COMMAND='ag -g ""'

source tmuxp.bash

