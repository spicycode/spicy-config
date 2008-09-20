  scriptencoding utf-8

" MAKE ARROW KEYS WORK IN CONSOLE VI
  set term=xterm
  
" Set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

" Color themes
  colors spicycode
"  colors wombat

" Set grep to ack
  set grepprg=ack\ -a

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

" Run file with 
  :nmap ,sf :! script/spec -fn %<cr>
  :nmap ,st :! ruby %<cr>

  " Quick, jump out of insert mode while no one is looking
  :imap ii <Esc>

  ""Nice statusbar
  set laststatus=2
  set statusline=\ "
  set statusline+=%f\ " file name
  set statusline+=[
  set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&fileformat}] " file format

  set statusline+=%h%1*%m%r%w%0* " flag
  set statusline+=%= " right align
  set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

  " title: update the title of the window?
  set   title

  " titlestring: what will actually be displayed
  set   titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

  " Reset the mapleader to comma
  let mapleader = ","
 
  " Turn off rails bits of statusbar
  let g:rails_statusline=0
 
  " TagList {{{
  let Tlist_GainFocus_On_ToggleOpen = 1
  let Tlist_Inc_Winwidth = 0
  let Tlist_Show_One_File = 1
  let Tlist_Enable_Fold_Column = 0
  " }}} TagList

  " NERDTree {{{
  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowBookmarks = 1
  let NERDTreeShowHidden = 1
  let NERDTreeQuitOnOpen = 1
  " }}} NERDTree

 " NERDTree
  :nmap <F2> :NERDTreeToggle<cr>
 
  " taglist
  :nmap <F3> :TlistToggle<cr>

