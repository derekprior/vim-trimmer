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
    if exists(g:trimmer_repeated_empty_lines)
      %s/\n\{3,}/\r\r/e
    endif
    if exists(g:trimmer_trailing_empty_lines)
      %s#\($\n\s*\)\+\%$##e
    endif
    call setpos(".", l:pos)
  endif
endfunction
