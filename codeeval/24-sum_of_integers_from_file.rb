file = ARGV[0]
sum = 0

File.open(file).each do |line|
  sum += line.to_i
end
puts sum
