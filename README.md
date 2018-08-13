# yadr-customizations
My personal customizations on top of YADR

# Usage
1. Make sure you've got Brew installed
1. Install https://github.com/skwp/dotfiles
1. `brew install vim --with-lua`
1. `brew install nvm`
1. `brew install fzf`
1. `$(brew --prefix)/opt/fzf/install`
1. `npm install -g import-js`
1. Set iTerm Solarized Dark under profiles
1. Install one of the Powerline fonts that came with YADR and set that as the iTerm font (Profiles > Text > Change Font)
1. Apply customizations in this repo:
  - `cd yadr-customizations && install.sh`
1. Run the osx setup script in ./bin (not YADRs version)
1. Setup SSH Keys
1. Install other useful tools:
  - Spectacle
  - Slack
  - Chrome
  - Vimium
1. Resart
1. Customize aliases
  - Change `gst` to `gstsh`

## Setup Java
1. `brew install jenv`
1. `brew cask install java`
1. `jenv add /Library/Java/JavaVirtualMachines/jdk-9.0.4.jdk/Contents/Home/`

### If you want any older versions of java...
1. `brew tap caskroom/versions`
1. `brew cask install java8`
1. `jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home/`

# VIM

## shortcuts

1. `,,f` EasyMotion move forwards
1. `,,b` EasyMotion move backwards
