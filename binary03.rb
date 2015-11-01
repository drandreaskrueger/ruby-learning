
base = 2      # 2 for binary (base-2) system  (... try e.g. octal, and hexadecimal)
summands = 2  # 2 for adding two numbers

puts
puts "BaseX calculator"
puts "Might help explaining how to add #{summands} positive numbers in base-#{base}."
puts "  [Change parameters ... in the first two lines of the code.]"
puts 

# just a neat trick to ask unboring questions :-) 
article  = "a"

# Arrays = containers for the numbers, and results
allDec    = []
allBaseX  = []

      
# ask 'summands' times:
(1..summands).each do 
  
  puts "Input #{article} number in base-#{base} system:"
  input = gets
  
  inputDec   = input.to_i(base)     # convert from base-X to decimal (integer)
  allDec << inputDec                # append to Array, to keep for later
  
  inputBaseX = inputDec.to_s(base)  # convert back (trick to get rid of leading 000s)
  allBaseX << inputBaseX            # append to Array

  puts "Thanks. #{inputBaseX} is #{inputDec} in decimal."
    
  article ="another"  # :-)
  puts                # empty line
end

puts
print "Thanks for your inputs. Now summing up ..."

allDec    << ( allDec.reduce :+ )       # The sum of the whole Array, then append that to end of Array.
allBaseX  << ( allDec.last ).to_s(base) # Transform that LAST element of the Array (=the sum) to base-X, 
                                        # and then add that to the end of the other Array.
puts " done. That was fast ;-)"

puts
puts "For better formatting ... finding the longest strings now:"
L1 = ( allBaseX.map { |b|  b.length      } ).max    # mapping .length on all elements, and take the maximum
L2 = ( allDec  .map { |b|  b.to_s.length } ).max    # mapping .length on all elements-made-to-string, ...
format1="%" + L1.to_s + "s"   # formatting with leading whitespaces, to right-adjust output 
format2="%" + L2.to_s + "s"   # same for the decimal numbers
puts "Longest base-#{base} number has #{L1} digits. Using '#{format1}' for formatting." 
puts "Longest decimal number has #{L2} digits. Using '#{format2}' for formatting."
puts

all = allBaseX.zip (allDec)  # Zipping both Arrays together into a new Array
counter = all.length         # Length, for counting down.

# this loop goes through the whole Array, tuple by tuple; each tuple is (baseX,decimal) 
all.each do |baseX,decimal|
  
  puts (format1 % baseX)  +  (" " * 5)  +  (format2 % decimal)  # nicely formatted line
  
  counter -= 1                  # subtract 1 from counter
  if counter == 1               # when we reach the last one ...
    puts "-" * (L1 + L2 + 5)    # then put a --------- before
  end
    
end


puts
puts
puts "Done.\nIs that good - or good? *g*"
puts "... Now press enter ..."
dummy=gets

