# This file gets called automatically when you run `./customize.sh`

# Update the following plugins provided by YADR
# ---------------------------------------------
# Make NerdTree a singleton tab
sed -I '' '/jistr\/vim-nerdtree-tabs.git/d' ~/.yadr/vim/vundles/project.vundle
# Broken jsx plugin
sed -I '' '/mxw\/vim-jsx/d' ~/.yadr/vim/vundles/languages.vundle
# Conflicts with coc-snippets
sed -I '' '/garbas\/vim-snipmate.git/d' ~/.yadr/vim/vundles/languages.vundle
sed -I '' '/honza\/vim-snippets/d' ~/.yadr/vim/vundles/languages.vundle
# Broken as of vim 8.1
sed -I '' '/Shougo\/neocomplete.git/d' ~/.yadr/vim/vundles/vim-improvements.vundle


# Refresh plugins.
# Force an install of any plugin to get everything updated.
yadr vim-add-plugin -u 'gcmt/taboo.vim'
# Not sure that this actually does anything...
yadr vim-delete-plugin -u "Shougo/neocomplete"
yadr vim-delete-plugin -u "mxw/vim-jsx"
yadr vim-delete-plugin -u "jistr/vim-nerdtree-tabs"
yadr vim-delete-plugin -u "garbas/vim-snipmate"
yadr vim-delete-plugin -u "honza/vim-snippets"

# CoC setup
echo "CoC Setup..."
cd ~/.yadr/vim/bundle/coc.nvim

echo ""
echo "Node Version:"
which node
node -v
echo ""
echo "NPM Version:"
which npm
npm -v

echo ""
echo "Cleaning Coc node_modules..."
# Clean node_modules incase we previously ran an install
rm -rf node_modules

echo ""
echo "If the following install fails, you'll need to set the default node used by this command. You can do that 'nvm alias default XX.XX.XX' and then 'nvm use default'"
# Coc.nvim requires a specific version of node to be installed in the system;
# it doesn't play nicely with NVM.
# Install the Coc node requirements
yarn install --frozen-lockfile
