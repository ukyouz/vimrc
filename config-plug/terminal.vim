" " Terminal
" " open termianl on the 80px-width vertical split
" nnoremap <silent> <C-`> :80vs \| terminal<CR>
" nnoremap <silent> <C-`> :10split term://ipython<CR>
" " open ipython on the 10px-height horizontal split
" nnoremap <silent> <M-`> :10sp \| terminal<CR>ipython<CR>
if has("nvim")
augroup fzfesc
"     autocmd!
"     " only apply setting to cmd terminal
"     autocmd TermOpen,TermEnter  term://.//*cmd* tnoremap <Esc> <C-\><C-n>
      autocmd TermOpen            * startinsert
      autocmd TermOpen,TermEnter  * if @% == 'Monkey_Terminal' | tnoremap <Esc> <C-\><C-n>:q<CR> | endif
      autocmd TermLeave,TermClose * tnoremap <Esc> <Esc>
      "     autocmd TermLeave,TermClose term://.//*cmd* tunmap <Esc>
augroup END
endif

" https://gist.github.com/ram535/b1b7af6cd7769ec0481eb2eed549ea23
" With this function you can reuse the same terminal in neovim.
" You can toggle the terminal and also send a command to the same terminal.

let s:monkey_terminal_window = -1
let s:monkey_terminal_buffer = -1
let s:monkey_terminal_job_id = -1

let $PYTHON = g:python3_host_prog

function! MonkeyTerminalOpen()
  " Check if buffer exists, if not create a window and a buffer
  if !bufexists(s:monkey_terminal_buffer)
    " Creates a window call monkey_terminal
    new monkey_terminal
    " Moves to the window the below the current one
    wincmd J
    let s:monkey_terminal_job_id = termopen($PYTHON, { 'detach': 0 })

    " Change the name of the buffer to Monkey_Terminal
    silent file Monkey_Terminal
    " Gets the id of the terminal window
    let s:monkey_terminal_window = win_getid()
    let s:monkey_terminal_buffer = bufnr('%')

    " The buffer of the terminal won't appear in the list of the buffers
    " when calling :buffers command
    set nobuflisted
  else
    if !win_gotoid(s:monkey_terminal_window)
    sp
    " Moves to the window below the current one
    wincmd J
    buffer Monkey_Terminal
     " Gets the id of the terminal window
     let s:monkey_terminal_window = win_getid()
    endif
  endif
  resize 10
  startinsert
endfunction

function! MonkeyTerminalToggle()
  if win_gotoid(s:monkey_terminal_window)
    call MonkeyTerminalClose()
  else
    call MonkeyTerminalOpen()
  endif
endfunction

function! MonkeyTerminalClose()
  if win_gotoid(s:monkey_terminal_window)
    " close the current window
    hide
  endif
endfunction

function! MonkeyTerminalExec(cmd)
  if !win_gotoid(s:monkey_terminal_window)
    call MonkeyTerminalOpen()
  endif

  " clear current input
  call jobsend(s:monkey_terminal_job_id, "clear\n")

  " run cmd
  call jobsend(s:monkey_terminal_job_id, a:cmd . "\n")
  normal! G
  wincmd p
endfunction

" With this maps you can now toggle the terminal
nnoremap <F7> :call MonkeyTerminalToggle()<cr>
tnoremap <F7> <C-\><C-n>:call MonkeyTerminalToggle()<cr>

" This an example on how specify command with different types of files.
    augroup go
        autocmd!
        autocmd BufRead,BufNewFile *.go set filetype=go
        autocmd FileType go nnoremap <F5> :call MonkeyTerminalExec('go run ' . expand('%'))<cr>
    augroup END
