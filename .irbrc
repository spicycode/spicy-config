require 'rubygems'
require 'irb/completion'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

HISTFILE = "~/.irb_history"
MAXHISTSIZE = 500

begin
  histfile = File::expand_path(HISTFILE)
  
  if File::exists?(histfile)
    lines = IO::readlines(histfile).collect { |line| line.chomp }
    Readline::HISTORY.push(*lines)
  end
  
  Kernel::at_exit do
    lines = Readline::HISTORY.to_a.reverse.uniq.reverse
    lines.reject! { |line| line == 'exit' }
    lines = lines[-MAXHISTSIZE, MAXHISTSIZE] if lines.nitems > MAXHISTSIZE
    File::open(histfile, File::WRONLY|File::CREAT|File::TRUNC) { |io| io.puts lines.join("\n") }
  end
end

IRB.conf[:IRB_RC] = proc do |conf|
  name = "irb: "
  name = "rails: " if $0 == 'irb' && ENV['RAILS_ENV'] 
  leader = " " * name.length
  conf.prompt_i = "#{name}"
  conf.prompt_s = leader + '\-" '
  conf.prompt_c = leader + '\-+ '
  conf.return_format = ('=' * (name.length - 2)) + "> %s\n"
end


def time_it(times=1)
  require "benchmark"
  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end

# Why's aorta method to edit an object in YAML, awesome!
# Source: http://rubyforge.org/snippet/detail.php?type=snippet&id=22
def aorta(obj)
  tempfile = File.join('/tmp',"yobj_#{ Time.now.to_i }")
  File.open( tempfile, 'w' ) { |f| f << obj.to_yaml }
  system( "#{ ENV['EDITOR'] || 'vi' } #{ tempfile }" )
  return obj unless File.exists?( tempfile )
  content = YAML::load( File.open( tempfile ) )
  File.delete( tempfile )
  content
end

def aorta!(obj)
  obj = aorta(obj)
end

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV'] 
