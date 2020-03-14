#!/bin/sh


# setup folder structure
mkdir -p ~/bin
mkdir -p ~/workspace
mkdir -p ~/repos

# bin will need to be added to $PATH manually here in order have nave ready later on
export PATH=$HOME/bin:/usr/local/bin:$PATH

# brew setup
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# Core utils
brew install coreutils
brew install findutils

# Dependencies
brew install jpeg-turbo
brew install optipng
brew install readline

# Apps
brew install the_silver_searcher
brew install git
brew install python3
brew install unrar
brew install trash
brew install tree
brew install wget
brew install ffind
brew install wifi-password
brew install github/gh/gh
brew install asciinema
brew install neovim
brew install tmux
brew install fd

# setup nave
cd ~/repos
git clone https://github.com/isaacs/nave.git
ln -s ~/repos/nave/nave.sh ~/bin/nave

# setup node
nave install latest
nave use latest


function installcask() {
    brew cask install "${@}" 2> /dev/null
}

# dev-related programs
installcask google-chrome
installcask firefox
installcask iterm2

# utils
installcask spotify
installcask vlc
installcask slack
installcask kap
installcask dash


# npm dependencies that I'm not likely to live without
npm install -g jsonlint
npm install -g eslint
npm install -g eslint_d
npm install -g eslintme

# vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p ~/.config/nvim/autoload
ln -s ~/.vim/autoload/pathogen.vim ~/.config/nvim/autoload/pathogen.vim

# Go to bundle folder
cd ~/.vim/bundle/
ln -s ~/.vim/bundle ~/.config/nvim/bundle

# setup python support for neovim
pip2 install --user neovim
pip3 install --user neovim


## Get dotfiles repo
cd ~/Documents/repos/
git clone https://github.com/csalomons/dotfiles.git


## Setup symlinks
cd ~/
mkdir -p .config/nvim
ln -s repos/dotfiles/vimrc .vimrc
ln -s repos/dotfiles/vimrc .config/nvim/init.vim
ln -s repos/dotfiles/tmux.conf .tmux.conf


## tmux setup
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux start-server
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh

