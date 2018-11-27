" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" Enable completion where available.
let g:ale_completion_enabled = 1

" Linter list
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint']
\}

" Fixes issue where autocomplete automatically selects the
" first autocomplete result without manually selecting it from
" the autocomplete list.
" https://github.com/w0rp/ale/issues/1700
set completeopt=menu,menuone,preview,noselect,noinsert
