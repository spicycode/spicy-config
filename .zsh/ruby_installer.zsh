function install_jruby_120 {
  mkdir -p ~/.ruby_versions && cd ~/.ruby_versions &&
  curl -O -L --silent http://dist.codehaus.org/jruby/1.2.0/jruby-bin-1.2.0.zip &&
  rm -rf jruby-1.2.0 &&
  jar xf jruby-bin-1.2.0.zip &&
  ln -sf ~/.ruby_versions/jruby-1.2.0/bin/jruby ~/.ruby_versions/jruby-1.2.0/bin/ruby &&
  ln -sf ~/.ruby_versions/jruby-1.2.0/bin/jgem ~/.ruby_versions/jruby-1.2.0/bin/gem   &&
  ln -sf ~/.ruby_versions/jruby-1.2.0/bin/jirb ~/.ruby_versions/jruby-1.2.0/bin/irb &&
  chmod +x ~/.ruby_versions/jruby-1.2.0/bin/{jruby,jgem,jirb} &&
  rm -rf ~/.ruby_versions/jruby-bin-1.2.0.zip &&
  use_jruby_120 && install_jruby_openssl && install_basic_gems &&
  cd ~
}

function install_ruby_191 {
  mkdir -p ~/.ruby_versions && cd /tmp
  curl -L -O ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p129.tar.gz &&
  tar xzf ruby-1.9.1-p129.tar.gz &&
  cd ruby-1.9.1-p129 &&
  ./configure --prefix=$HOME/.ruby_versions/ruby_191 --enable-shared &&
  make && make install &&
  rm -rf ruby-1.9.1-p129.tar.gz ruby-1.9.1-p129 &&
  use_ruby_191 && install_basic_gems && cd ~
}

function install_basic_gems {
  gem install rdoc rake
}

function install_jruby_openssl {
  gem install jruby-openssl
}