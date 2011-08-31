require 'prime'

print "Number to calculate sum of prime divisors on: "
number = gets.chomp.to_i

prime_divisors = []
2.upto(number) do |i|
  if Prime.prime?(i)
    prime_divisors << i if (number % i) == 0
  end
end

puts prime_divisors.reduce(:+)