
# Delete the following plugins provided by YADR
# ---------------------------------------------
# Make NerdTree a singleton tab
sed -i .bak -e '/jistr\/vim-nerdtree-tabs.git/d' ~/.yadr/vim/vundles/project.vundle

# Broken jsx plugin
sed -i .bak -e '/mxw\/vim-jsx/d' ~/.yadr/vim/vundles/languages.vundle

# Broken as of vim 8.1
sed -i .bak -e '/Shougo\/neocomplete.git/d' ~/.yadr/vim/vundles/vim-improvements.vundle


# Refresh plugins.
yadr init-plugins
# Force an install of any plugin to get everything updated.
yadr vim-add-plugin -u 'gcmt/taboo.vim'
