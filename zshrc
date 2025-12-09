# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Use starship theme (`$ brew install starship`)
eval "$(starship init zsh)"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL=nvim

ulimit -n 10000

alias :q="exit"
alias b="bundle exec"

alias gs="git status -s"
alias gb="git branch --sort='-authordate'"
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
alias p="pnpm"

export N_PREFIX=$HOME/n
export PATH=$N_PREFIX/bin:$PATH

# Android stuff

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# pnpm
export PNPM_HOME="/Users/toadums/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Secrets
if [[ -f ~/.zsh_secrets ]]; then
    source ~/.zsh_secrets
fi
