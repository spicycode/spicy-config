autoload -U compinit && compinit
autoload colors && colors

source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/history.zsh
source ~/.zsh/set_options.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/magic_prediction.zsh
# Make TextMate and others that need Bash happy
ECHO PATH=$PATH > .profile
