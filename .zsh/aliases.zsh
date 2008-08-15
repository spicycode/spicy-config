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

# Rob's aliases
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcap='git commit -v -a && git push'
alias gpp='git pull; git push'
alias c='cd '
alias mv='mv -i'
alias rm='rm -i'
alias :='cd ..'
alias ::='cd ../..'
alias :::='cd ../../..'
alias md=mkdir
alias m='mate'

# listing files
alias l='ls -al'
alias lt='ll -t'
alias la='lt -a'
alias ltr='ls -ltr'
alias lth='ll -t|head'
alias ltr='ls -ltr'
alias lh='ls -Shl | less'
alias tf='tail -f -n 100'
alias t500='tail -n 500'
alias t1000='tail -n 1000'
alias t2000='tail -n 2000'


function mysqlredo {
  mysqladmin drop $1
  mysqladmin create $1
}