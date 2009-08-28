autoload -U compinit && compinit
autoload colors && colors

source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
# source ~/.zsh/ruby_switcher.zsh

if [ -f ~/.rvm/bin/rvm ] ; then source ~/.rvm/bin/rvm ; fi
if [ -f ~/.rvm/current ] ; then source ~/.rvm/current ; fi
# use_ruby_from_leopard
# use_ruby
