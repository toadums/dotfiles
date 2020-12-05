# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/toadums/.oh-my-zsh

ZSH_THEME="sobole"

plugins=(
	git
	zsh-syntax-highlighting
)

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

alias :q="exit"
alias b="bundle exec"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ag='ag --path-to-ignore ~/.agignore'

export FZF_DEFAULT_COMMAND='ag -g ""'

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

export PATH="/usr/local/bin:${PATH}"

eval "$(rbenv init -)"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/toadums/Library/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/toadums/Library/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/toadums/Library/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/toadums/Library/google-cloud-sdk/completion.zsh.inc'; fi
