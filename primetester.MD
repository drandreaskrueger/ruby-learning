# Prime tester
## Coding something in Ruby, pt.2

All this is mainly me learning essential Ruby basics.  
The trigger for this chapter was a friend who has started studying, and one of the first questions is ... a prime number tester.


**Two Versions.   ...01.rb and ...02.rb**

The first one is a bit more complex, but neat: I tried solving the 2,3,4,5 question first - ... just because I can :-)

The second version is *without* that "playful" intro, and definitely easier to understand. It simply tests all odd numbers (plus the 2) until sqrt(n).

Both have a switch at the beginning, where you can choose "stop as soon as a divisor has been found" versus "find many divisors".

Wow, it is quite fast - two to eight million tests per second, depending on the hardware. All large numbers given at the bottom of the ruby files ... are working without problems.


### [primetester01.rb](primetester01.rb)
Prime Number Test v01 (playful version)

### [primetester02.rb](primetester02.rb)
Prime Number Test v02 (only the greedy part)
Better look at this code first.


##How?

Either you [download Ruby](http://rubyinstaller.org/downloads/) to your machine; or you copy the code into http://www.tutorialspoint.com/execute_ruby_online.php - and then press "Execute" there.


Enjoy!

		:-)
		
		
P.S.: No guarantees that my code is correct.


