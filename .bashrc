source $HOME/.bash.d/exports.sh
source $HOME/.bash.d/history.sh
source $HOME/.bash.d/aliases.sh
source $HOME/.bash.d/project_directory_aliases.sh
source $HOME/.bash.d/ssh.sh
source $HOME/.bash.d/ruby.sh
source $HOME/.bash.d/rubygems.sh
source $HOME/.bash.d/vcs.sh

if [ -f /opt/local/etc/bash_completion ]; then
  source /opt/local/etc/bash_completion
fi

# I don't care about case when globbing
shopt -s nocaseglob

# Clearing because of hte weird underlying vcs issue
command clear
