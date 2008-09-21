# My aliases
alias ocaml="rlwrap ocaml"
alias ssh='/usr/bin/ssh'
alias ls='ls -G'
alias tar='nocorrect /usr/bin/tar'
alias sudo='nocorrect sudo'
alias rmate='mate Rakefile README app config doc db lib public script spec test stories features'
alias ri='ri -Tf ansi'
alias ss='./script/server'
alias sc='./script/console'
alias vi='/opt/local/bin/vim'
alias postgres_start='pg_ctl -D ~/.pgdata -l ~/.pgdata/psql.log start'
alias vim='/opt/local/bin/vim -p'
alias postgres_stop='pg_ctl -D ~/.pgdata stop'
alias mysql='/opt/local/bin/mysql5 -u root --socket=/tmp/mysql.sock'
alias mysqladmin='/opt/local/bin/mysqladmin5 -u root --socket=/tmp/mysql.sock'
alias mysql_config='/opt/local/bin/mysql_config5'
alias gvim='mvim -p'
alias r='/usr/bin/r'
alias autou='autotest'
alias autof='AUTOTEST=functional autotest'
alias cycle_passenger='touch tmp/restart.txt'

function mysqlredo {
  mysqladmin drop $1
  mysqladmin create $1
}
