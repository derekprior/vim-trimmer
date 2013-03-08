if !exists("g:trimmer_blacklist")
  let g:trimmer_blacklist = []
endif

autocmd BufWritePre *
  \ if exists("g:trimmer_autocommand") |
  \   call s:TrimTrailingWhitespace(g:trimmer_blacklist) |
  \ endif

function! s:TrimTrailingWhitespace(blacklist)
  if index(a:blacklist, &ft) < 0
    let l:pos = getpos(".")
    %s/\s\+$//e
    call setpos(".", l:pos)
  endif
endfunction

command! TrimTrailingWhitespace call s:TrimTrailingWhitespace([])
