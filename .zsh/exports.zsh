export MANPATH=/opt/local/share/man:$MANPATH
export PATH=/usr/local/git/bin:/Library/Ruby/bin:/opt/local/bin:/opt/local/lib/postgresql82/bin/:/opt/local/sbin:/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/:$PATH
export CDPATH=~/ruby:~/relevance
export RUBYOPT='rubygems'
export GREP_OPTIONS='--color=auto' 
export GREP_COLOR='3;33'
export EDITOR='mate -w'
export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home'
  
case $VIM in
/Applications/MacVim.app/Contents/Resources/vim)
  export CLICOLOR=0
  export TERM=xterm
  ;;
*)
  export TERM=xterm-color
  export LSCOLORS=gxfxcxdxbxegedabagacad
  export CLICOLOR=1
  ;;
esac

