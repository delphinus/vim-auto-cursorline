let s:disabled = 0
let s:cursor = 1
let s:window = 2
let s:status = s:disabled
let s:timer_id = 0

function! auto_cursorline#cursor_moved() abort
  if s:status == s:window
    let s:status = s:cursor
    return
  endif
  call auto_cursorline#timer_stop()
  call auto_cursorline#timer_start()
  if s:status == s:cursor
    setlocal nocursorline
    let s:status = s:disabled
  endif
endfunction

function! auto_cursorline#win_enter() abort
  setlocal cursorline
  let s:status = s:window
  call auto_cursorline#timer_stop()
endfunction

function! auto_cursorline#win_leave() abort
  setlocal nocursorline
  call auto_cursorline#timer_stop()
endfunction

function! auto_cursorline#timer_start() abort
  let s:timer_id = timer_start(g:auto_cursorline_wait_ms, 'auto_cursorline#enable')
endfunction

function! auto_cursorline#timer_stop() abort
  if s:timer_id
    call timer_stop(s:timer_id)
    let s:timer_id = 0
  endif
endfunction

function! auto_cursorline#enable(timer_id) abort
  setlocal cursorline
  let s:status = s:cursor
  let s:timer_id = 0
endfunction
