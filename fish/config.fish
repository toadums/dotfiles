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

alias tree-all="tree -I 'node_modules' -I  'dist'"

set -x ANDROID_SDK_ROOT $HOME/Library/Android/sdk

set PATH /usr/local/bin $PATH
set PATH /Applications/Postgres.app $PATH
set PATH $HOME/n/bin $PATH
set PATH $ANDROID_SDK_ROOT/emulator $PATH
set PATH $ANDROID_SDK_ROOT/platform-tools $PATH

set -Ux ANDROID_HOME $HOME/Library/Android/sdk
set -Ux JAVA_HOME $(/usr/libexec/java_home)

set -Ux N_PREFIX $HOME/n/

status --is-interactive; and rbenv init - fish | source

alias repo="set url $(git remote get-url origin 2>/dev/null | sed 's/git@/https:\/\//' | sed 's/com:/com\//');[ -z \"\$url\" ] && set url 'https://github.com'; open \"\$url\""
