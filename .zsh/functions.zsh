function update_textmate_bundles {
  local bundles_directory='~/Library/Application\ Support/TextMate/Bundles'
for dir in ~/Library/Application\ Support/TextMate/Bundles/*.tmbundle
do
  cd $dir
  git pull
  svn up
  cd ~
done
}

