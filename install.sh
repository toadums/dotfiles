echo "Installing git, git bash completion, and vim"
brew install git bash-completion
brew install vim

echo "Update / install nvm"
npm install -g npm

echo "Installing vim plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Copying over config files"
ln -s ./.dotfiles/vimrc             ~/.vimrc
ln -s ./.dotfiles/bash_prompt       ~/.bash_prompt
ln -s ./.dotfiles/bashrc            ~/.bashrc
ln -s ./.dotfiles/bash_profile      ~/.bash_profile

ln -s ./.dotfiles/gitconfig         ~/.gitconfig
ln -s ./.dotfiles/agignore          ~/.agignore
ln -s ./.dotfiles/scss-lint.yml     ~/.scss-lint.yml
