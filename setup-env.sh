# make development directory
mkdir ~/Development

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install vim
brew install vim --with-lua

# install nvm
brew install nvm

# install fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# install yadr
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`" -s ask
