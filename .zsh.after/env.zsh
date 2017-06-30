export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

if which jenv > /dev/null; then eval "$(jenv init -)"; fi

PATH=$PATH:~/Library/Android/sdk/platform-tools

echo 'Moving to Development folder';
cd ~/Development
