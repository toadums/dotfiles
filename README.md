# .dotfiles
Customizes vim and zsh

### Install
`git clone https://github.com/toadums/dotfiles.git ~/.dotfiles`

To set up your .zshrc via zprezto, run:

```
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

Install CommandT (Vim plugin)

`https://github.com/wincent/Command-T`


