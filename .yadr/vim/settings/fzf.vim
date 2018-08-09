" Enable fzf
set rtp+=/usr/local/opt/fzf

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
nnoremap <silent> ,t :FZF<CR>

" Additional mapping for buffer search
nnoremap <silent> ,b :Buffer<CR>

" Search Git commits
" nnoremap <silent> ,c :Commits<CR>
" Search commits for the file in the current buffer
nnoremap <silent> ,c :BCommits<CR>

" Search Vim command history
nnoremap <silent> ,h :History<CR>
