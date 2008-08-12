# COMPLETION
zmodload -i zsh/complist
zstyle ':completion:*' menu select=10
zstyle ':completion:*' verbose yes

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' keep-prefix true tag-order all-expansions
 
# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-separator '#'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:prefix:*' add-space true

# Ignore these directories from completion
zstyle ':completion:*:*cd:*' ignored-patterns '(*/|)(CVS|SCCS|SVN|GIT|HG)'

# Make the nice with git completion and others
zstyle ':completion::*:(git|less|rm|emacs)' ignore-line true

# SSH Completion
zstyle ':completion:*:scp:*' tag-order files 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show
 
# Colors in completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Disable completion of usernames
zstyle ':completion:*' users off

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Cache
zstyle ':completion:*' use-cache on
