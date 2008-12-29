# My aliases
alias ocaml="rlwrap ocaml"
alias ssh='/usr/bin/ssh'
alias ls='ls -G'
alias tar='nocorrect /usr/bin/tar'
alias sudo='nocorrect sudo'
alias rmate='mate Rakefile README app config doc db lib public script spec test stories features examples'
alias ri='ri -Tf ansi'
alias ss='./script/server'
alias sc='./script/console'
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim -p'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -p'
alias postgres_start='pg_ctl -D ~/.pgdata -l ~/.pgdata/psql.log start'
alias postgres_stop='pg_ctl -D ~/.pgdata stop'
alias mysql='/opt/local/bin/mysql5 -u root --socket=/tmp/mysql.sock'
alias mysqladmin='/opt/local/bin/mysqladmin5 -u root --socket=/tmp/mysql.sock'
alias mysql_config='/opt/local/bin/mysql_config5'
alias gvim='mvim -p'
alias cycle_passenger='touch tmp/restart.txt'
alias e='open -a Emacs'
alias gemdir='/Library/Ruby/Gems/1.8/gems/'
alias jruby='~/open_source/jruby_install/bin/jruby'

function mysqlredo {
  mysqladmin drop $1
  mysqladmin create $1
}
