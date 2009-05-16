# Aliases that do not change the command
alias g='git'

# My aliases
alias port='sudo port -v'
alias update_macports='sudo port selfupdate && port outdated'
alias ocaml='rlwrap ocaml'

# Override macports ssh in case it gets pulled in as a dependency
alias ssh='/usr/bin/ssh'

# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'

# Same as above, but in long listing format
alias ll='ls -GFhl'

alias rmate='mate Rakefile README app bin config doc db lib public script spec test stories features examples'
alias ri='ri -Tf ansi'
alias rdoc='rdoc --ri --line-numbers --all'
alias ss='./script/server'
alias sc='./script/console'
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim -p'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -p'
alias vimr='/Applications/MacVim.app/Contents/MacOS/Vim -p --remote-silent'
alias postgres_start='pg_ctl -D ~/.pgdata -l ~/.pgdata/psql.log start'
alias postgres_stop='pg_ctl -D ~/.pgdata stop'
alias mysql='/opt/local/bin/mysql5 -u root'
alias mysqladmin='/opt/local/bin/mysqladmin5 -u root'
alias mysql_config='/opt/local/bin/mysql_config5'
alias gvim='mvim -p'
alias e='aquamacs'
alias cycle_passenger='touch tmp/restart.txt'