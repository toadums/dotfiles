if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias :q="exit"
alias b="bundle exec"

alias gs="git status -s"
alias gb="git branch"
alias gd="git diff"
alias ga="git add -ip"
alias gc="git checkout"
alias gl="git log --oneline --decorate"

alias gpull='git pull --rebase origin (git rev-parse --abbrev-ref HEAD)'

alias ls="ls -F1aG"
fish_add_path /opt/homebrew/opt/ruby/bin

alias vi="nvim"
