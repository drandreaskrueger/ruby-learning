# Modulo = ?
# (C) 2015 by AK
# 

maxNumber = 15
moduloDividers = [1,2,3,4,5]

(1..maxNumber) .each { |n|
    print " %2d ...  " %n
    moduloDividers.each { |d|
       print "  ... modulo #{d} = #{n % d}   "
    }
    puts
}
