function zsh_recompile() {
  autoload -U zrecompile

  [[ -f ~/.zshrc ]] && zrecompile -p ~/.zshrc
  [[ -f ~/.zshrc.zwc.old ]] && rm -f ~/.zshrc.zwc.old

  for f in ~/.zsh/**/*.zsh; do
    [[ -f $f ]] && zrecompile -p $f
    [[ -f $f.zwc.old ]] && rm -f $f.zwc.old
  done

  [[ -f ~/.zcompdump ]] && zrecompile -p ~/.zcompdump
  [[ -f ~/.zcompdump.zwc.old ]] && rm -f ~/.zcompdump.zwc.old

  source ~/.zshrc
}

function update_textmate_bundles {
  for dir in ~/Library/Application\ Support/TextMate/Bundles/*.tmbundle; do
    cd $dir
    git pull
    svn up
    cd -
  done
}

function mysqlredo {
  mysqladmin drop $1
  mysqladmin create $1
}

function nginx_start { sudo nginx }

function nginx_stop { sudo kill $(cat /opt/nginx/logs/nginx.pid) }

# From http://tomafro.net/tags/zsh

# Change directory and open TextMate in a single command
function tm { cd $1; rmate $1 }

# Usage is simple: tab <command> opens a new tab in Terminal, and runs the given command in the current working directory. 
# For example tab script/server would open a new tab and run script/server.
function tab {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd $PWD; $*" in window 1
    end tell
EOF
}

# Create and move to a directory in a single command
# Usage: take ~/Projects/tools/awesometer
function take {
  mkdir -p $1
  cd $1
}
