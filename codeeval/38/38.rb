File.open(ARGV[0]).each do |line|
  line = line.chomp.split(',')
  num = line.first.to_i
  letters = line.last.split('').uniq

  p = letters.repeated_permutation(num)
  puts p.to_a.collect(&:join).sort.join(',')
end
