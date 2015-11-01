maxDecimal=20

(0..maxDecimal).each do |d|
  puts "Decimal #{d} is Binary #{d.to_s(2)}"
end

puts "press enter"
dummy = gets