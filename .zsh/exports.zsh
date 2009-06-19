# Currently this path is appendend to dynamically when picking a ruby version
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/opt/local/lib/postgresql83/bin/:/opt/nginx/sbin:$PATH

# Our list of directorys we can cd to from anywhere
export CDPATH=.:~/Projects:~/Projects/spicycode:~/Projects/open_source:~/Projects/relevance

# Add macports man pages to the man path
export MANPATH=/opt/local/share/man:$MANPATH

# Set default console Java to 1.6
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

# Setup terminal, and turn on colors
export TERM=xterm-color
export LSCOLORS=gxfxcxdxbxegedabagacad
export CLICOLOR=1

# Enable color in grep
export GREP_OPTIONS='--color=auto' 
export GREP_COLOR='3;33'

# Enable color, and better prompt in LESS
export PAGER=less
export LESS=ce3M

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch i386'

# Set macvim with flag to wait for console (git commit compat) as our EDITOR
export EDITOR="mvim -f"

# Make activemq happy
export ACTIVEMQ_HOME=~/Projects/relevance/activemq/
export ACTIVEMQ_BASE=~/Projects/relevance/activemq/
export ACTIVEMQ=~/Projects/relevance/activemq/bin/macosx/activemq
