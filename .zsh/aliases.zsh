alias update_macports='sudo port selfupdate && port outdated'
alias ocaml='rlwrap ocaml'

# Override macports ssh in case it gets pulled in as a dependency
alias ssh='/usr/bin/ssh'

# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'

# Same as above, but in long listing format
alias ll='ls -GFhl'

alias rmate='mate Capfile Rakefile README app bin config doc db lib public script spec test stories features examples'
alias ri='ri -Tf ansi'
alias ss='./script/server'
alias sc='./script/console'
alias sg='./script/generate'
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias mysql='/opt/local/bin/mysql5 -u root'
alias mysqladmin='/opt/local/bin/mysqladmin5 -u root'
alias mysql_config='/opt/local/bin/mysql_config5'
alias gvim='mvim -p'
alias e='open -a Aquamacs'
alias cycle_passenger='touch tmp/restart.txt'
