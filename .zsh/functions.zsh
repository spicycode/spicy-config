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
  export GEM_PATH=~/.gem/ruby/1.8
  echo "Using Leopard Ruby 1.8.6"
}

function use_ruby_ee_186 {
  export PATH=~/.gem/ruby/1.8/bin:/opt/ruby-enterprise-1.8.6-20090421/bin:$ORIGINAL_PATH
  export GEM_HOME=~/.gem/ruby/1.8
  export GEM_PATH=~/.gem/ruby/1.8
  echo "Using Ruby EE 1.8.6"
}

function use_ruby_191 {
  export PATH=~/.gem/ruby/1.9.1/bin:~/.ruby_versions/ruby_191_p0/bin:$ORIGINAL_PATH
  export GEM_HOME=~/.gem/ruby/1.9.1
  export GEM_PATH=~/.gem/ruby/1.9.1
  echo "Using Ruby 1.9.1"
}
