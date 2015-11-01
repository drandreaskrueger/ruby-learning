
# file open - how to
# RUBY LEARNING - my first explorative steps
# (C) 2015 by AK
# 

puts "---------------------------"
puts "-----   Begins here    ----"
puts "---------------------------"
puts "---- File open how to    --"
puts "---------------------------"

filename="rubyAllMeth.rb"
IO.foreach(filename, sepstring=$/) {|line| print line}

puts "---------------------------"

lines = IO.readlines(filename)
puts "File Length in lines: #{lines.length}"

lines.each do |l|
	puts l[0..6]
end

puts "---------------------------"

load "rubyAllMeth.rb"

File.open(filename, aModeString="r") {|file| 
	puts file
	puts file.methods.join(", ")

 	puts "---------------------------"

	allmeth(file)
}


