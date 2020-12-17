# Delete the following plugins provided by YADR
# ---------------------------------------------
# Make NerdTree a singleton tab
sed -i -e '/jistr\/vim-nerdtree-tabs.git/d' ~/.yadr/vim/vundles/project.vundle

# Add new plugins
# ---------------
# Syntax highlighting for .vue files
yadr vim-add-plugin -u posva/vim-vue
# Rename vim tabs
yadr vim-add-plugin -u gcmt/taboo.vim
# Additional Syntaxes for common Javascript libraries
# yadr vim-add-plugin -u othree/javascript-libraries-syntax.vim


