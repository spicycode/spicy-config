" Anti aliased monaco 13
"set anti enc=utf-8 gfn=Monaco:h13

" rubyfile ~/.gvim.rb

"#<apple-t> : New Tab
"<apple-]>: Next Tab
"<apple-]>: Previous Tab

"custom tab stuff
" tab navigation like safari
" idea adopted from: http://www.vim.org/tips/tip.php?tip_id=1221
:nmap <D-[> :tabprevious<cr>
:nmap <D-]> :tabnext<cr>
:map <D-[> :tabprevious<cr>
:map <D-]> :tabnext<cr>
:imap <D-[> <ESC>:tabprevious<cr>i
:imap <D-]> <ESC>:tabnext<cr>i
:nmap <D-t> :tabnew<cr>
:imap <D-t> <ESC>:tabnew<cr>

"set tabline=%!MyTabLine()

"set showtabline=2 " 2=always
"autocmd GUIEnter * hi! TabLineFill term=underline cterm=underline gui=underline
"autocmd GUIEnter * hi! TabLineSel term=bold,reverse,underline
"\ ctermfg=11 ctermbg=12 guifg=#ffff00 guibg=#0000ff gui=underline

" make backspace always work
"set backspace=indent,eol,start

" make project list persist across restarts
"set viminfo^=!
