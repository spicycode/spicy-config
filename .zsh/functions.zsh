function update_textmate_bundles {
  for dir in ~/Library/Application\ Support/TextMate/Bundles/*.tmbundle; do
    cd $dir
    git pull
    svn up
    cd -
  done
}

function update_macports {
  sudo port selfupdate
  sudo port sync
  sudo port outdated
}

function mysqlredo {
  mysqladmin drop $1
  mysqladmin create $1
}

function new_tab {
  osascript -e "
  tell application \"iTerm\"
   tell the first terminal
    launch session \"Default Session\"
    tell the last session
     write text \"cd $(pwd)\"
     write text \"clear\"
    end tell
   end tell
  end tell"
}

function use_ruby_186 {
  export PATH=~/.gem/ruby/1.8/bin:/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/bin/:$ORIGINAL_PATH
  export GEM_HOME=~/.gem/ruby/1.8
  display_which_ruby
}

function use_ruby_191 {
  export PATH=~/.gem/ruby/1.9.1/bin:~/.ruby_versions/ruby_191/bin:$ORIGINAL_PATH
  export GEM_HOME=~/.gem/ruby/1.9.1
  display_which_ruby
}

function display_which_ruby {
  export RPS1="$(ruby -v | colrm 11)"
}

function hide_which_ruby {
  unset RPS1
}
