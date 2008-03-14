# START: EXPORTS
export PATH=/Library/Ruby/bin:/opt/local/bin:/Library/PostgreSQL8/bin:/opt/local/sbin:/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export GREP_OPTIONS='--color=auto' 
export GREP_COLOR='3;33'
export GEM_HOME=/Library/Ruby/Gems/1.8
export GEM_PATH=/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/gems/1.8
export EDITOR='mate -w'
export PS1='%2/ ~ '
export TERM=xterm-color
export LSCOLORS=gxfxcxdxbxegedabagacad
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=
# END: EXPORTS

# START RAKE COMPLETION (caching rake tasks per project directory, not globally)
function _rake_does_task_list_need_generating () {
  if [ ! -f .zsh_rake_cache ]; then
    return 0;
  else
    accurate=$(stat -f%m .zsh_rake_cache)
    changed=$(stat -f%m Rakefile)
    return $(expr $accurate '>=' $changed)
  fi
}

function _rake () {
  if [ -f Rakefile ]; then
    if _rake_does_task_list_need_generating; then
      echo "\nGenerating zsh rake cache..." > /dev/stderr
      rake --silent --tasks | cut -d " " -f 2 > .zsh_rake_cache
    fi
    reply=( `cat .zsh_rake_cache` )
  fi
}
compctl -K _rake rake
# ENDING RAKE COMPLETION

# color module
autoload colors ; colors	

###########################################
#   iTerm Tab and Title Customization     #
###########################################

# Put the string "hostname::/full/directory/path" in the title bar:
set_iterm_title() { 
	echo -ne "\e]2;$HOST:r:r::$PWD\a" 
}

# Put the parentdir/currentdir in the tab
set_iterm_tab() {
	echo -ne "\e]1;$PWD:h:t/$PWD:t\a" 
}

set_iterm_running_app() {
 printf "\e]1; $PWD:t:$(history $HISTCMD | cut -b7- ) \a"
}

precmd() { 
	set_iterm_title
	set_iterm_tab
}

preexec() { 
  set_iterm_running_app
}

postexec() {
  set_iterm_running_app
}

# Keeps the paths from growing too big    
typeset -U path manpath fpath

# HISTORY
HISTSIZE=600
SAVEHIST=600
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY 
setopt INC_APPEND_HISTORY 
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

# MISC CONFIG
setopt complete_in_word         # Not just at the end
setopt always_to_end            # When complete from middle, move cursor
setopt nohup										# In general, we don't kill background jobs upon logging out

# COMPLETION
zmodload -i zsh/complist
zstyle ':completion:*' menu select=10
zstyle ':completion:*' verbose yes

# Completing process IDs with menu selection:
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# Prevent CVS/SVN files/directories from being completed:
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)SVN'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#SVN'

## With commands like `rm' it's annoying if one gets offered the same filename
## again even if it is already on the command line. To avoid that:
zstyle ':completion:*:rm:*' ignore-line yes

# Force 'sudo zsh' to start root as a logging shell to avoid problems with environment clashes:
function sudo {
	if [[ $1 = "zsh" ]]; then
        command sudo /opt/local/bin/zsh -l
	else
        command sudo "$@"
	fi
}

     
# ALIASES
alias ocaml="rlwrap ocaml"
alias ssh='/usr/bin/ssh'
alias ls='ls -G'
alias ll='ls -hl'
alias tar='nocorrect /usr/bin/tar'
alias sudo='nocorrect sudo'
alias rmate='mate app config doc db lib public script spec test stories'
alias ri='ri -Tf ansi'
alias ss='./script/server'
alias sc='./script/console'
alias vi='/opt/local/bin/vim'
alias postgres_start='pg_ctl -D ~/.pgdata -l ~/.pgdata/psql.log start'
alias vim='/opt/local/bin/vim -p'
alias postgres_stop='pg_ctl -D ~/.pgdata stop'
alias mysql='/opt/local/bin/mysql5 -u root --socket=/tmp/mysql.sock'
alias mysqladmin='/opt/local/bin/mysqladmin5 -u root --socket=/tmp/mysql.sock'
alias gvim='mvim -p'
alias gitdiff="git log|grep commit|awk '{print \$2}'|tail -n 2|xargs -n 2 git diff $1 $2|mate"
alias start_mysql="sudo /opt/local/share/mysql5/mysql/mysql.server start"
alias stop_mysql="sudo /opt/local/share/mysql5/mysql/mysql.server stop"

bindkey '^K' kill-whole-line
