File.open(ARGV[0]).each do |line|
  l = line.split(';')
  first = l.first.split(',').collect(&:strip)
  last = l.last.split(',').collect(&:strip)
  puts (first & last).join(',')
end
