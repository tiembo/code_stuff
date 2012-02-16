File.open(ARGV[0]).each do |line|
  next if line == ""
  pairs = []
  split = line.split(';')
  sum = split.last.to_i
  numbers = split.first.split(',').collect(&:to_i)
  numbers.each do |n|
    other = sum - n
    next if other == n and numbers.count(n) == 1
    if numbers.include? other
      pairs << [n, other].sort.join(",")
    end
  end
  puts (pairs.empty? ? "NULL" : pairs.uniq.join(';'))
end
