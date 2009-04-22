git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "%{$fg_bold[green]%}/${ref#refs/heads/}%{$reset_color%}"
  fi
}

# Put the string "hostname::/full/directory/path" in the title bar:
set_term_title() { 
	echo -ne "\e]2;$PWD\a" 
}

# Put the parentdir/currentdir in the tab
set_term_tab() {
	echo -ne "\e]1;$PWD:h:t/$PWD:t\a" 
}

set_running_app() {
 printf "\e]1; $PWD:t:$(history $HISTCMD | cut -b7- ) \a"
}

precmd() { 
  if [ $TERM_PROGRAM ]; then
    set_term_title
    set_term_tab
  fi
}

preexec() { 
  if [ $TERM_PROGRAM ]; then
    set_running_app
  fi
}

postexec() {
  set_running_app
}

export PS1='%{$reset_color$fg[gray]%}%2~%{$reset_color$bold_color$fg[green]%}$(git_prompt_info)>%{$reset_color%} '
