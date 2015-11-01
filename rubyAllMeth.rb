
# all methods of an object
# RUBY LEARNING - my first explorative steps
# (C) 2015 by AK
# 

puts "--------------------------------------"
puts "print all methods, and try to execute:"
puts "--------------------------------------"

def allmeth(myObj)
	myObj.methods.each do |m|
		print "%12s" % m  + ":\t    "
		begin
			print myObj.send(m)
		rescue Exception => e  
			print "exception:    ", e
		end
		puts
	end
end

if __FILE__ == $0
  puts
  a=77
  mystr = " example: type '#{a.class}'  instance '#{a}'"
  divider = "-" * mystr.length
  puts divider + "\n" + mystr + "\n" + divider
  puts
  allmeth(a)
end


