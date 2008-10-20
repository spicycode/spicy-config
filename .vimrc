  scriptencoding utf-8

" Set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

" Set grep to ack
  set grepprg=ack\ --noenv\ -a

" These two enable syntax highlighting
  set nocompatible
  syntax on
  
" have one hundred lines of command-line (etc) history:
  set history=100

" Show us the command we're typing
  set showcmd

" Highlight matching parens
  set showmatch

  set completeopt=menu,preview
  
" Use the tab complete menu
  set wildmenu 
  set wildmode=list:longest,full

" have the mouse enabled all the time:
  set mouse=a

" * Text Formatting -- General

" don't make it look like there are line breaks where there aren't:
  set nowrap

" use indents of 2 spaces, and have them copied down lines:
  set expandtab
  set tabstop=2
  set softtabstop=2 
  set shiftwidth=2

  set autoindent
  set smartindent
  
""Set to auto read when a file is changed from the outside
  set autoread

" * Search & Replace
" show the `best match so far' as search strings are typed:
  set incsearch
 
" assume the /g flag on :s substitutions to replace all matches in a line:
  set gdefault

" enable line numbers
  set number
  setlocal numberwidth=3

" FILE BROWSING
" Settings for explorer.vim
  let g:explHideFiles='^\.'

" Settings fo rnetrw
  let g:netrw_list_hide='^\.,\~$'

" TAB COMPLETION FOR AUTO COMPLETE
  if has("eval")
      function! CleverTab()
          if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
              return "\<Tab>"
          else
              return "\<C-N>"
          endif
      endfun
      inoremap <Tab> <C-R>=CleverTab()<CR>
      inoremap <S-Tab> <C-P>
  endif

" ENABLE THE TAB BAR
  set tabline=%!MyTabLine()
  set showtabline=2 " 2=always

" MAKE BACKSPACE WORK IN INSERT MODE
  set backspace=indent,eol,start

" REMEMBER LAST POSITION IN FILE
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" MAKE IT EASY TO UPDATE/RELOAD_vimrc 
  :nmap ,s :source ~/.vimrc<cr>
  :nmap ,v :tabe ~/.vimrc<cr>
  
" TAB NAVIGATION
  :nmap ,tn :tabnext<cr>
  :nmap ,tp :tabprevious<cr>  
  :nmap ,te :tabedit  

" SHELL
  command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)

  function! s:RunShellCommand(cmdline)
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1,a:cmdline)
    call setline(2,substitute(a:cmdline,'.','=','g'))
    execute 'setfiletype shell'
    execute 'set syntax=shell'
    execute 'silent $read !'.escape(a:cmdline,'%#')
    setlocal nomodifiable
    1
  endfunction

  :nmap ,sh :Shell 

" find file in project
  :nmap ,t :FuzzyFinderTextMate<cr> 

" Run file with 
  :nmap ,sf :Shell script/spec -cfp %<cr>
  :nmap ,st :Shell ruby %<cr>
  
  :nmap ,foo  :source ~/.vimrc<cr>:set syntax=shell<cr>
" Quick, jump out of insert mode while no one is looking
  :imap ii <Esc>

" Nice statusbar
  set laststatus=2
  set statusline=\ "
  set statusline+=%f\ " file name
  set statusline+=[
  set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&fileformat}] " file format

  set statusline+=%h%1*%m%r%w%0* " flag
  set statusline+=%= " right align
  set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" Title: update the title of the window?
  set title

" Title String: what will actually be displayed
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

" Turn off rails bits of statusbar
  let g:rails_statusline=0
 
" TagList {{{
  set tags=./tags;
  let Tlist_GainFocus_On_ToggleOpen = 1
  let Tlist_Inc_Winwidth = 0
  let Tlist_Enable_Fold_Column = 0
  let Tlist_Use_SingleClick = 1
  let Tlist_Use_Right_Window = 1
  :nmap ,ta :TlistAddFilesRecursive app<cr>
  :nmap <F3> :TlistToggle<cr>

" NERDTree {{{
  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowBookmarks = 1
  let NERDTreeShowHidden = 1
  let NERDTreeQuitOnOpen = 1

  :nmap <F2> :NERDTreeToggle<cr>

  autocmd FileType irb inoremap <buffer> <silent> <Cr> <Esc>:<C-u>ruby v=VIM::Buffer.current;v.append(v.line_number, eval(v[v.line_number]).inspect)<Cr>jo
  nnoremap ,irb :<C-u>below new<Cr>:setfiletype irb<Cr>:set syntax=ruby<Cr>i

  if has("gui_running")
    colors spicycodegui
    set guioptions=e
    set guioptions-=m
  else
  " MAKE ARROW KEYS WORK IN CONSOLE VI
   set term=xterm
   colors spicycode
  endif
  
  " Textmate Fuzzy Finder ignores
  let g:fuzzy_ignore = "*.png;*.jpg;*.gif;vendor/**;coverage/**;tmp/**"
  let g:fuzzy_matching_limit = 20

  runtime user_settings.vim
