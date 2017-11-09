function! smartcl#enable() abort
  call s:enter()
endfunction

function! smartcl#disable() abort
  setlocal nocursorline
  augroup smartcl
    autocmd!
  augroup END
endfunction

function! s:enter(...) abort
  setlocal cursorline
  augroup smartcl
    autocmd!
    autocmd CursorMoved,WinLeave * call s:leave()
  augroup END
endfunction

" NOTE:
" 'timer_start' is used to prevent 'CursorMoved' event called after
" 'WinEnter' when the line has changed.
" http://thinca.hatenablog.com/entry/20090530/1243615055
function! s:leave() abort
  setlocal nocursorline
  augroup smartcl
    autocmd!
    autocmd CursorHold * call s:enter()
    autocmd WinEnter * call timer_start(0, function('s:enter'))
  augroup END
endfunction
