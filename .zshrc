# START: EXPORTS
export MANPATH=/opt/local/share/man:$MANPATH
export JRUBY_HOME=/Users/chad/programming/oss/jruby
export PATH=/Users/chad/.rubygems/bin:/opt/local/bin:/usr/local/bin:/Library/PostgreSQL8/bin:/opt/local/sbin:$JRUBY_HOME/bin/:/usr/local/git/bin/:$PATH
export GREP_OPTIONS='--color=auto' 
export GREP_COLOR='3;33'
export RUBYLIB=/Users/chad/.rubygems/lib
export GEM_HOME=/Users/chad/.rubygems
export GEM_PATH=/Users/chad/.rubygems
export EDITOR='mate -w'
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
# Terminal Tab and Title Customization   

git_prompt_info() {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "(${ref#refs/heads/})/"
}

# Put the string "hostname::/full/directory/path" in the title bar:
set_term_title() { 
	echo -ne "\e]2;$HOST:r:r::$PWD\a" 
}

# Put the parentdir/currentdir in the tab
set_term_tab() {
	echo -ne "\e]1;$PWD:h:t/$PWD:t\a" 
}

set_term_running_app() {
 printf "\e]1; $PWD:t:$(history $HISTCMD | cut -b7- ) \a"
}

precmd() { 
	set_term_title
	set_term_tab
}

preexec() { 
  set_term_running_app
}

postexec() {
  set_term_running_app
}

export PS1='%1//$(git_prompt_info)$ ' 

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
setopt prompt_subst							# Required for the git prompt substitution

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
alias mysql_config='/opt/local/bin/mysql_config5'
alias gvim='mvim -p'
alias r='/usr/bin/r'
alias e="open -a emacs"
bindkey '^K' kill-whole-line

# Enable VIM keybindings
# bindkey -v

