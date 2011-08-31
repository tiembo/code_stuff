File.open(ARGV[0]).each do |line|
  l = line.split(',').collect(&:to_i)
  max_sum = l[0]
  1.upto(l.length) do |size|
    1.upto(l.length-size) do |sub|
      s = l[(sub-1)..(size-1)]
      puts s.inspect
      s = s.reduce(&:+)
      max_sum = s if s > max_sum 
    end
  end
  puts max_sum
end
