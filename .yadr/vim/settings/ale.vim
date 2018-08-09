" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" Enable completion where available.
let g:ale_completion_enabled = 1

" Linter list
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint']
\}
