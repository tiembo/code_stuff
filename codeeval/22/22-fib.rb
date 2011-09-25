def fib(i)
  return 0 if i == 0
  return 1 if i == 1
  fib(i - 1) + fib(i - 2)
end

File.open(ARGV[0]).each {|line| puts fib(line.to_i)}
