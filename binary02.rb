maxDecimal=20

(0..maxDecimal).each do |d|
  puts "Decimal #{d.to_s(10)} is Binary #{d.to_s(2)} is Ternary #{d.to_s(3)} is Quaternary #{d.to_s(4)}"
end

puts "press enter"
dummy = gets