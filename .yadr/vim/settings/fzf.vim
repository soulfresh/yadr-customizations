" " Enable fzf
" set rtp+=/usr/local/opt/fzf
"
" " Function to find files in the closest git project root folder
" function! s:find_git_root()
"   return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
" endfunction
"
" command! ProjectFiles execute 'Files' s:find_git_root()
"
" " We don't want to use Ctrl-p as the mapping because
" " it interferes with YankRing (paste, then hit ctrl-p)
" nnoremap <silent> ,t :ProjectFiles<CR>
"
" " Additional mapping for buffer search
" nnoremap <silent> ,b :Buffer<CR>
"
" " Search Git commits
" " nnoremap <silent> ,c :Commits<CR>
" " Search commits for the file in the current buffer
" nnoremap <silent> ,g :BCommits<CR>
"
" " Search Vim command history
" nnoremap <silent> ,h :History<CR>
