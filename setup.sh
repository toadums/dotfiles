###################
# homebrew
###################
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

###################
# fzf
###################
brew install fzf

###################
# fish
###################
brew install fish

## remove old fish config
rm ~/.config/fish/config.fish
ln -s `pwd`/fish/config.fish $HOME/.config/fish/config.fish

## install omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

## install omf pure theme
omf update
omf install pure
omf theme pure

###################
# neovim
###################
brew install neovim

mkdir -p ~/.config/nvim

ln -s `pwd`/vim/init.vim $HOME/.config/nvim/init.vim
ln -s `pwd`/vim/vimrc $HOME/.vimrc

## vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

###################
# node
###################
brew install node

## enable yarn
corepack enable

## Because we are setting the N_PREFIX in our config.fish our node versions will be installed
## in ~/n to get around any permission issues
npm install -g n
mkdir ~/n

###################
# git
###################
ln -s `pwd`/gitconfig $HOME/.gitconfig
