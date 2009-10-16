require 'pp'
require 'irb/completion'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:VERBOSE] = true
IRB.conf[:USE_READLINE] = true

IRB.conf[:PROMPT][:spicycode] = {
  :PROMPT_I=> "irb >> ", 
  :PROMPT_N=> "irb >> ", 
  :PROMPT_S=> nil, 
  :PROMPT_C=> "irb ?> ", 
  :RETURN=> "irb \=> %s\n"
}

IRB.conf[:PROMPT][:DEFAULT].replace(IRB.conf[:PROMPT][:spicycode])

IRB.conf[:PROMPT_MODE] = :spicycode

IRB_HISTORY_FILE = "~/.irb_history_#{RUBY_PLATFORM}_#{RUBY_VERSION}"
IRB_HISTORY_MAXIMUM_SIZE = 500

begin
  histfile = File::expand_path(IRB_HISTORY_FILE)
  
  if File::exists?(histfile)
    lines = IO::readlines(histfile).collect { |line| line.chomp }
    Readline::HISTORY.push(*lines)
  end
  
  Kernel::at_exit do
    lines = Readline::HISTORY.to_a.reverse.uniq.reverse
    lines.reject! { |line| line == 'exit' }
    lines = lines[-IRB_HISTORY_MAXIMUM_SIZE, IRB_HISTORY_MAXIMUM_SIZE] if lines.compact.size > IRB_HISTORY_MAXIMUM_SIZE
    File::open(histfile, File::WRONLY|File::CREAT|File::TRUNC) { |io| io.puts lines.join("\n") }
  end
end
