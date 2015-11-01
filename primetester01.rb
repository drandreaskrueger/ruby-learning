# (C) 2015 by AK
# 
# If you like this, show it: [BTC] 1FsfnPDgU1yaEYoc5PEskUwMpmYZb8TaGW
#


breakWhenFirstFound = false   # false, then it will find many divisors (slower).
                              # true, then it will stop as soon as it finds one.

printEvery = 1000000          # print a status line at every 1 million tests.




puts            "Prime Number Test v01 (playful version)"




print "Please input an integer you want tested: "
input = gets
input = input.strip     # drop newline character and whitespaces

# testing if the input is valid
if not (input.to_i > 1 and /^\d+$/ =~ input ) 
  puts "not a integer > 1, sorry."
  exit
end

puts # empty line

# for some simple statistics
startingTime = Time.now 
testsNeeded  = 0

# string --> integer
n = input.to_i  

# Array as container for all divisors we will find.
divisors=[]     

puts "Step 1: Testing simple cases (2,3,4,5) first ...  just because we can :-)"


# 2 or 5 
#           last character --> integer  
lastDigit =  n.to_s[-1]         .to_i
  
if [0,2,4,6,8].include? lastDigit 
  divisors << 2
end

if [0,5].include? lastDigit
  divisors << 5
end

# 4          
#               last 2 characters      --> Integer
lastDigits = ("0" + n.to_s) [-2..-1]     .to_i     
if lastDigits % 4 == 0
    divisors << 4
end


# 3      
# "if cross sum is divisible by 3 ... then number is"   

# cross sum of a positive integer (constraints not checked)
def crossSum number
  allCharacters = number.to_s .split("")
  asNumbers = allCharacters.map {|d| d.to_i}
  sum = asNumbers.reduce :+
  return sum
end

result = n
until result < 10 
  result = crossSum result   # repeat calculating the cross sum ... until small
end

if [3,6,9].include? result
  divisors << 3
end

# 6
# is 2 and 3


# for our "statistics"
testsNeeded += 4

# just in case n was 2,3,5 
divisors.delete(n)


# found some?
if divisors.length == 1
  print "Found a supersimple divisor. "
elsif divisors != []  
  print "Found supersimple divisors. "
else
  print "No supersimple divisor found. "
end 



if divisors != []  and breakWhenFirstFound
  puts "Skipping the greedy part."
  
else
    puts "Please be patient during the greedy part:"
    puts
    print "Step 2: Checking in intervall "
    
    # Greedy part 
    # But we already know it is not divisible by 2, 3, 4, 5, 6 
    # and we only have to check until the square root of n
  
    maxTest = Math.sqrt(n) .to_i + 1
    test = 7
    
    puts "[#{test}, #{maxTest}]"
      
    # test all odd numbers between 7 and maxTest
    while test <= maxTest
      
      if n % test == 0
        divisors << test  
        if breakWhenFirstFound # found one - that is enough already. 
          break 
        end
      end
      
      testsNeeded += 1 # just count how many operations needed
      if testsNeeded % printEvery == 0
        progress = testsNeeded.to_f / (maxTest/2)
        print "progress %.1f%% after " % (progress * 100)
        puts "%.1f seconds."  % (Time.now - startingTime)
      end
      
      test += 2     # next odd number
      # idea: Could be improved by testing if test is divisible by 5, then skip that one too.
  
    end # of while
end # of greedy part


# present the output

puts
print "#{n} is " 

if divisors == []
  puts "probably a prime number (modulo possible errors in my code *g*)."
else
  puts "NOT a prime number\n"
    
  # find the complementary divisors too, that's cheap
  complementary = []
  divisors.each do |d|
    complementary << n / d
  end
  divisors += complementary 
  
  divisors.uniq!  # get rid of any duplicates
  divisors.sort!  # sort ascending
  
  puts "It can be divided -at least- by"
  puts divisors.join(", ")
end

# show some statistics
duration = (Time.now - startingTime)
print "\nReady. The needed %d tests "  % testsNeeded
print "took %.4f seconds, "  % duration
puts "so %.0f tests per second." % (testsNeeded/duration)


# some numbers for testing
# 9999991
# 13403447
# 213403447
# 234123427
# 454457123
# 7897876891
# 790104098803
# 9000047999983
# 99999999999999
# 26784038870077
# 100000099999829
# 159999852000007
# 2500000599999811
# 1000000099997390001539
# 24999983499992710001701
# 50000009499995620000189

