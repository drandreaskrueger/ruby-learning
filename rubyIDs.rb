# hardcoded ids ... in strange order
# RUBY LEARNING - my first explorative steps
# (C) 2015 by AK
# 

(0..30).each do |v| 
	print "id #{v}:   "
	begin
		print	ObjectSpace._id2ref(v)
	rescue Exception => ex
		print "exception: ", ex
	end
	puts
end

puts "\nActually, this is different on Linux, and Windows. Weird."