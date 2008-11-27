parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\/git:\1/'
}

# Show character if changes are pending
git_status() {
  if current_git_status=$(git status 2> /dev/null | grep 'added to commit' 2> /dev/null); then
    echo "⚡"
  else
    echo ''
  fi
}

git_prompt_info() {
  branch_prompt=$(parse_git_branch)
  if [ -n "$branch_prompt" ]; then
  
    
    echo "$branch_prompt"
    # echo "$fg[green]$branch_prompt$reset_color $(git_status)"
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
	set_term_title
	set_term_tab
}

preexec() { 
  set_running_app
}

postexec() {
  set_running_app
}

export PS1='%{$reset_color$fg[gray]%}%2~%{$reset_color$bold_color$fg[green]%}$(git_prompt_info)>%{$reset_color%} ' 
export RPS1='%{$fg[yellow]%}$(git_status)%{$reset_color%}'