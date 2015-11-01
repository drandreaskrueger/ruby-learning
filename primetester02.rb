# (C) 2015 by AK

breakWhenFirstFound = false   # false, then it will find many divisors (slower).
                              # true, then it will stop as soon as it finds one.

printEvery = 1000000          # print a status line at every 1 million tests.




puts           "Prime Number Test v02 (only greedy)"




print "Please input an integer you want tested: "
input = gets
input = input.strip   # drop newline character and whitespaces

# is the input valid?
if not (input.to_i > 1 and /^[0-9]+$/ =~ input ) 
  puts "not a integer > 1, sorry."
  exit
end

# some simple statistics
startingTime = Time.now 
testsNeeded  = 0

# convert string to integer
n = input.to_i  

# Array as container for all divisors we will find.
divisors=[]     
  

# 2 is the only even number, so that below only odd numbers need be checked
if n % 2 == 0
    divisors << 2    
end 
testsNeeded += 1 # that was the first test


if divisors == [] or not breakWhenFirstFound
                         # or found one - then that is enough already. 
  
  puts "Please be patient ..."
  puts
  print "Checking possible divisors in intervall "
  
  # Greedy part 
  # But we only have to check until the square root of n
  
  maxTest = Math.sqrt(n) .to_i + 1
  test = 3
  
  puts "[#{test}, #{maxTest}]"
    
  # test all odd numbers between 3 and maxTest
  while test <= maxTest
    
    if n % test == 0
      divisors << test  
      if breakWhenFirstFound # found one - that is enough already. 
        break 
      end
    end
    
    testsNeeded += 1 # just count how many operations needed
    
    # progress printer
    if (testsNeeded % printEvery==0)
      progress = testsNeeded.to_f / (maxTest/2)
      print "progress %.1f%% after " % (progress * 100)
      puts "%.1f seconds."  % (Time.now - startingTime)
    end
    
    test += 2     # next odd number
  
  end
end

# present the results

puts
print "#{n} is " 

divisors.delete(n) # " ... only be divided by 1 and itself ..."

if divisors == []
  puts "probably a prime number (modulo possible errors in my code *g*)."
else
  puts "NOT a prime number.\nIt can be divided -at least- by"
    
  # find the complementary divisors too
  complementary = []
  divisors.each do |d|
    complementary << (n / d)
  end
  divisors += complementary   # append to the end.
  
  divisors.uniq!  # get rid of any duplicates, just in case
  divisors.sort!  # sort ascending

  puts divisors.join(", ")  # join the whole array into comma-separated string
end

# Some simple statistics:
duration = Time.now - startingTime
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
# 26784038870077
# 100000099999829
# 159999852000007
# 2500000599999811
# 5000001199999622

# for these large questions, switch breakWhenFirstFound=true
# 1000000099997390001539
# 24999983499992710001701
# 50000009499995620000189

