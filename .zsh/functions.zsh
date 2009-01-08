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
