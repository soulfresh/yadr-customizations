#!/bin/sh

# Install NVM if it doesn't already exist.
if ! command -v nvm &> /dev/null
then
  # install nvm (Homebrew is unsupported)
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  exit
fi

# install the latest node
nvm install --lts
nvm use --lts

# upgrade to the latest system node for tsserver
brew upgrade node
