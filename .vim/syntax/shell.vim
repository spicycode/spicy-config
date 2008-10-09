" Vim syntax file
" Language:         shell results
" Maintainer:       Chad Humphries
" Latest Revision:  2008-10-09

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

"syn match   completedInTime contained '^Finished in'

"syn match   shellEscape    '\\.'

"syn keyword shellTodo      contained TODO FIXME XXX NOTE

"syn region  shellComment   display oneline start='#' end='$'
"                            \ contains=shellTodo,@Spell

"syn region  shellString    display oneline start=+"+ skip=+\\"+ end=+"+
"                            \ contains=shellVariable,screenSpecial

"syn region  shellLiteral   display oneline start=+'+ skip=+\\'+ end=+'+

"syn match   shellVariable  contained display '$\(\h\w*\|{\h\w*}\)'

"syn keyword shellBoolean   on off

"syn match   shellNumbers   display '\<\d\+\>'

"syn match   shellSpecials  contained
"                            \ '%\([%aAdDhlmMstuwWyY?:{]\|[0-9]*n\|0?cC\)'

"syn keyword shellCommands  acladd aclchg acldel aclgrp aclumask activity
"                            \ addacl allpartial at attrcolor autodetach
"                            \ bell_msg bind bindkey bufferfile caption chacl
"                            \ chdir clear colon command compacthist console
"                            \ copy copy_regcrlf debug detach digraph dinfo
"                            \ crlf displays dumptermcap echo exec fit focus
"                            \ height help history info kill lastmsg license
"                            \ lockshell markkeys meta msgminwait msgwait
"                            \ multiuser nethack next nonblock number only
"                            \ other partial_state password paste pastefont
"                            \ pow_break pow_detach_msg prev printcmd process
"                            \ quit readbuf readreg redisplay register
"                            \ remove removebuf reset resize shell select
"                            \ sessionname setenv shelltitle silencewait
"                            \ verbose sleep sorendition split startup_message
"                            \ stuff su suspend time title umask version wall
"                            \ width writebuf xoff xon defmode hardstatus
"                            \ altshell break breaktype copy_reg defbreaktype
"                            \ defencoding deflog encoding eval ignorecase
"                            \ ins_reg maxwin partial pow_detach setsid source
"                            \ unsetenv windowlist windows defautonuke autonuke
"                            \ defbce bce defc1 c1 defcharset charset defescape
"                            \ escape defflow flow defkanji kanji deflogin
"                            \ login defmonitor monitor defhstatus hstatus
"                            \ defobuflimit obuflimit defscrollback scrollback
"                            \ defshell shell defsilence silence defslowpaste
"                            \ slowpaste defutf8 utf8 defwrap wrap defwritelock
"                            \ writelock defzombie zombie defgr gr hardcopy
"                            \ hardcopy_append hardcopydir hardstatus log
"                            \ logfile login logtstamp mapdefault mapnotnext
"                            \ maptimeout term termcap terminfo termcapinfo
"                            \ vbell vbell_msg vbellwait

"hi def link shellEscape    Special
"hi def link shellComment   Comment
"hi def link shellTodo      Todo
"hi def link shellString    String
"hi def link shellLiteral   String
"hi def link shellVariable  Identifier
"hi def link shellBoolean   Boolean
"hi def link shellNumbers   Number
"hi def link shellSpecials  Special
"hi def link shellCommands  Keyword
"
let b:current_syntax = "shell"

let &cpo = s:cpo_save
unlet s:cpo_save
