
# Predefined Variables, and CONSTANTS
# RUBY LEARNING - my first explorative steps
# (C) 2015 by AK
# 
# If you like this, show it: [BTC] 1FsfnPDgU1yaEYoc5PEskUwMpmYZb8TaGW
#

puts "-------------------------------------------------------"
puts "Ruby 'Predefined Variables' from"
puts "http://www.tutorialspoint.com/ruby/ruby_quick_guide.htm"
puts "-------------------------------------------------------"

vars=["$!", "$@", "$/", "$\\", "$,", "$;", "$.", "$<", "$>", "$0", "$$", "$?", "$:", "$DEBUG", "$defout", "$F", "$FILENAME", "$LOAD_PATH", "$SAFE", "$stdin", "$stdout", "$stderr", "$VERBOSE", "$-0", "$-a", "$-d", "$-F", "$-i", "$-I", "$-l", "$-p", "$_", "$~", "$1", "$2", "$3", "$&", "$`", "$'", "$+", "$+", "TRUE", "FALSE", "NIL", "ARGF", "ARGV", "$*", "DATA", "ENV", "RUBY_PLATFORM", "RUBY_RELEASE_DATE", "RUBY_VERSION", "STDERR", "STDIN", "STDOUT", "TOPLEVEL_BINDING"]

vars.each do |v|
  print "%17s"%v, "    "
	begin
	  print eval(v)
	rescue  Exception => e
	  print "exception:   ",e
	end
	puts
end

puts
puts "------------------------------------------------"
puts "ENV"
puts "------------------------------------------------"

ENV.each do |name|
  print "#{name.join("   =>   ")}"
  puts
end
