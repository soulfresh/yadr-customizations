#!/bin/sh

echo 'moving files...'
cp .gitconfig.user ~/
cp .my.cnf ~/
cp .tmux.conf.user ~/
cp .vimrc.after ~/
cp .agignore ~/
cp .zsh.after/* ~/.zsh.after/
cp .zsh.prompts/* ~/.zsh.prompts/
cp .yadr/vim/.vundles.local ~/.yadr/vim/
cp -rf .yadr/vim/* ~/.yadr/vim/
./update-vim-plugins.sh
echo 'complete'

