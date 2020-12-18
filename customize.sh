#!/bin/sh

# Args:
# -p Skip plugin install.

while getopts p flag
do
  case "${flag}" in
    p) skip_plugins=true;;
  esac
done

echo 'Customizing YADR...'
echo '-------------------'

echo 'Git configs ✔'
cp .gitconfig.user ~/

echo 'MySQL configs ✔'
cp .my.cnf ~/

echo 'TMUX configs ✔'
cp .tmux.conf.user ~/

echo 'AG configs ✔'
cp .agignore ~/

echo 'ZSH configs ✔'
cp .zsh.after/* ~/.zsh.after/
cp .zsh.prompts/* ~/.zsh.prompts/

echo 'VIM configs ✔'
cp .vimrc.after ~/
cp .yadr/vim/.vundles.local ~/.yadr/vim/
cp -rf .yadr/vim/* ~/.yadr/vim/

if [ ! -n "$skip_plugins" ]
then
  echo 'Update VIM plugins ✔'
  ./update-vim-plugins.sh
fi

echo 'DONE 🏆'

