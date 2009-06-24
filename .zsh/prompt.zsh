#autoload -Uz vcs_info && vcs_info
RED=$'%{\e[31m%}'
GR=$'%{\e[32m%}'
MA=$'%{\e[35m%}'
YE=$'%{\e[33m%}'
NC=$'%{\e[0m%}'
zstyle ':vcs_info:*' actionformats  "/${GR}%s:${YE}${GR}%b${YE}|${RED}%a${NC}"
zstyle ':vcs_info:*' formats        "/${GR}%s:${Y}${GR}%b%}${NC}"
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat "%b${RED}:${YE}%r"

# Put the string "hostname::/full/directory/path" in the title bar:
function set_term_title { 
	echo -ne "\e]2;$PWD\a" 
}

# Put the parentdir/currentdir in the tab
function set_term_tab {
	echo -ne "\e]1;$PWD:h:t/$PWD:t\a" 
}

function set_running_app {
 printf "\e]1; $PWD:t:$(history $HISTCMD | cut -b7- ) \a"
}

function precmd { 
  set_term_title
  set_term_tab
  #vcs_info
}

function preexec { 
  set_running_app
}

function postexec {
  set_running_app
}

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\/git:\1/'
}

function git_prompt_info() {
  local ref=$(git symbolic-ref HEAD 2> /dev/null)
  local gitst="$(git status 2> /dev/null)"

  if [[ -f .git/MERGE_HEAD ]]; then
    if [[ ${gitst} =~ "unmerged" ]]; then
      gitstatus=" %{$fg[red]%}unmerged%{$reset_color%}"
    else
      gitstatus=" %{$fg[green]%}merged%{$reset_color%}"
    fi
  elif [[ ${gitst} =~ "Changes to be committed" ]]; then
    gitstatus=" %{$fg[green]%}modified%{$reset_color%}"
  elif [[ ${gitst} =~ "use \"git add" ]]; then
    gitstatus=" %{$fg[red]%}modified%{$reset_color%}"
  elif [[ -n `git checkout HEAD 2> /dev/null | grep ahead` ]]; then
    gitstatus=" %{$fg[yellow]%}unpushed ↑ %{$reset_color%}"
  else
    gitstatus=''
  fi
  if [[ -n $ref ]]; then
    echo "%{$fg_bold[green]%}/${ref#refs/heads/}%{$reset_color%}$gitstatus"
  fi
}

export PS1='%{$reset_color$fg[gray]%}%2~%{$reset_color$bold_color$fg[green]%}$(git_prompt_info)>%{$reset_color%} '
#export PS1='%{$reset_color$fg[gray]%}%2~%{$reset_color%}%{$vcs_info_msg_0_%}>%{$reset_color%} '
