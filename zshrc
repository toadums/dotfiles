# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/pauldemchuk/.oh-my-zsh

ZSH_THEME="sobole"

plugins=(git)

source $ZSH/oh-my-zsh.sh
#
# User configuration

export EDITOR='nvim'

ulimit -n 10000

# postgres
export PGDATA=~/pgdb

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases
alias rn="cd ~/code/accio/rn"
alias ac="cd ~/code/accio"

alias asm="cd ~/code/consulting/upwords/assembly"
alias coar="cd ~/code/ruboss/coar"

alias :q="exit"

alias gs="git status -s"
alias gb="git branch"
alias gd="git diff"
alias ga="git add -ip"
alias gc="git checkout"
alias gcb='git checkout $(git branch | fzf)'
alias gl="git log --oneline --decorate"
alias gt="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gn="git rev-list --left-right --count"

alias gpull='git pull --rebase origin `git rev-parse --abbrev-ref HEAD`'
alias gp='git push origin HEAD'

alias ls="ls -F1aG"
alias vi="nvim"

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

alias opta="cd ~/code/metalab/optavia"
alias metablog="cd ~/go/src/github.com/metalabdesign/metablog"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

alias ag='ag --path-to-ignore ~/.agignore'

export FZF_DEFAULT_COMMAND='ag -g ""'
export WORKON_HOME=~/envs

export ANDROID_HOME=~/Library/Android/sdk/
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export ANDROID_NDK=/Users/pauldemchuk/android-ndk

# CTRL-G - Paste the selected git modified file path(s) into the command line
# Copy paste from the oracle
__fzf_git_file() {
  local cmd="${FZF_CTRL_G_COMMAND:-command git ls-files -m}"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_G_OPTS" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

fzf-git-file-widget() {
  emulate -L zsh
  LBUFFER="${LBUFFER}$(__fzf_git_file)"
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle     -N   fzf-git-file-widget
bindkey "^G" fzf-git-file-widget

# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
# source /usr/local/bin/virtualenvwrapper.sh
# source ~/envs/default/bin/activate

# for tmuxp
export DISABLE_AUTO_TITLE='true'


export PATH="/usr/local/bin:${PATH}"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/flutter/flutter/bin
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export GO111MODULE=on
export PATH=$PATH:/Library/Frameworks/GStreamer.framework/Commands

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Homebrew ruby will be used if we don't use rbenv
# export PATH="/usr/local/opt/ruby/bin:$PATH"

export PATH="/usr/local/bin/rubocop-daemon-wrapper:$PATH"
export RUBOCOP_DAEMON_USE_BUNDLER=true

eval "$(rbenv init -)"
