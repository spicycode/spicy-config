require 'pp'
require 'irb/completion'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:VERBOSE] = true
IRB.conf[:USE_READLINE] = true

HISTFILE = "~/.irb_history_#{RUBY_PLATFORM}_#{RUBY_VERSION}"
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
    lines = lines[-MAXHISTSIZE, MAXHISTSIZE] if lines.compact.size > MAXHISTSIZE
    File::open(histfile, File::WRONLY|File::CREAT|File::TRUNC) { |io| io.puts lines.join("\n") }
  end
end

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV'] 
