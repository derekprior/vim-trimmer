if !exists('g:trimmer_blacklist')
  let g:trimmer_blacklist = []
endif

augroup vimTrimmer
  autocmd!
  autocmd BufWritePre * call s:TrimTrailingWhitespace(g:trimmer_blacklist)
augroup END

function! s:TrimTrailingWhitespace(blacklist)
  if index(a:blacklist, &filetype) < 0
    let l:pos = getpos('.')
    %s/\s\+$//e
    call histdel('search', -1)
    call setpos('.', l:pos)
  endif
endfunction
