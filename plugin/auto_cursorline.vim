if exists('g:loaded_auto_cursorline')
  finish
endif
let g:loaded_auto_cursorline = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

let g:auto_cursorline_wait_ms = get(g:, 'auto_cursorline_wait_ms', 1000)

augroup auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call auto_cursorline#cursor_moved()
  autocmd WinEnter * call auto_cursorline#win_enter()
  autocmd WinLeave * call auto_cursorline#win_leave()
augroup END

let &cpoptions = s:save_cpo
unlet s:save_cpo
