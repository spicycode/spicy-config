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

