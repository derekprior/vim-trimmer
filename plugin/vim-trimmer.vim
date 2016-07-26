if !exists("g:trimmer_blacklist")
  let g:trimmer_blacklist = []
endif

augroup vimTrimmer
  autocmd!
  autocmd BufWritePre * call s:TrimTrailingWhitespace(g:trimmer_blacklist)
augroup END

function! s:TrimTrailingWhitespace(blacklist)
  if index(a:blacklist, &ft) < 0
    let l:pos = getpos(".")
    %s/\s\+$//e
    %s/\n\{4,}/\r\r\r/e
    %s#\($\n\s*\)\+\%$##e
    call setpos(".", l:pos)
  endif
endfunction
