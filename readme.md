# .dotfiles

- Neovim
- Fish
- iTerm2
- Git

# Setup
I decided to post steps here instead of creating a setup file.

## Get XCode downloading
Start the download from the App Store. You can do this while you continue with the rest of the steps, they don't depend on having XCode installed.

## Install xcode tools
```sh
xcode-select --install
```

## homebrew
https://brew.sh

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## fzf
```sh
brew install fzf
```

## fish
```sh
brew install fish

# remove old fish config
rm ~/.config/fish/config.fish
ln -s `pwd`/fish/config.fish $HOME/.config/fish/config.fish

# install omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# install omf pure theme
omf update
omf install pure
omf theme pure
```

## neovim

```sh
brew install neovim

mkdir -p ~/.config/nvim

ln -s ~/.dotfiles/nvim ~/.config/nvim

# Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install language servers
brew install lua-language-server
npm install -g typescript typescript-language-server
npm install -g @tailwindcss/language-server

# Install ripgrep (used by telescope)
brew install ripgrep

# Install font for telescope
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Install eslint_d
npm install -g eslint_d
```

## node
```sh
brew install node

# enable yarn

## If on node 16.10+
corepack enable

## Otherwise
npm install --global yarn

## Install n with sudo. But since we're setting N_PREFIX node versions will be
## installed in ~/n to get around any permission errors
sudo npm install -g n

## Make the ~/n directory which matches our N_PREFIX env var
mkdir ~/n
```

## git
```sh
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
```

## Manually install apps
- Install XCode
- Install XCode CLI tools:
  - Preferences
  - Locations
  - Install most recent CLI Tool
- Install [iTerm2](https://iterm2.com)
  - Enable setting sync - see ./iterm2/readme.md
- Install [postgres.app](hrttps://postgresapp.com/downloads.html)
- Install [VsCode](https://code.visualstudio.com)
  - Enable settings sync from VsCode command palette

## VSCode

```sh
## Enable fast key repeat

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```
