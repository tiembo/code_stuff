require 'prime'

def fib(n)
  if n == 0 || n == 1
    n
  else
    fib(n - 1) + fib(n - 2)
  end
end

print "Get largest Fibonacci number greater than this: "
min = gets.chomp.to_i

f_counter = 0
f = fib(f_counter)
while !((f > min) and Prime.prime?(f))
  f_counter += 1
  f = fib(f_counter)
end

puts f
