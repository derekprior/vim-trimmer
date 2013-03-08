let g:trimmer_blacklist = []
au BufWritePre * :call <SID>TrimTrailingWhitespace()

function! <SID>TrimTrailingWhitespace()
  if index(g:trimmer_blacklist, &ft) < 0
    let l:pos = getpos(".")
    %s/\s\+$//e
    call setpos(".", l:pos)
  endif
endfunction
