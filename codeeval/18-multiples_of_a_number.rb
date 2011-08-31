file = ARGV[0]

File.open(file).each do |line|
  x = line.split(',').first.to_i
  n = line.split(',').last.to_i

  i = 1
  while(n * i < x)
    i += 1
  end
  puts i * n
end
