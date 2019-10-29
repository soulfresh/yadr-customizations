#!/bin/sh

echo 'moving files...'
cp .tmux.conf.user ~/
cp .vimrc.after ~/
cp .zsh.after/* ~/.zsh.after/
cp .zsh.prompts/* ~/.zsh.prompts/
cp .yadr/vim/.vundles.local ~/.yadr/vim/
cp -rf .yadr/vim/* ~/.yadr/vim/
cp .my.cnf ~/
echo 'complete'

