File.open(ARGV[0]).each do |line|
  word_letters = line.chomp.split('')
  p = word_letters.permutation
  puts p.to_a.collect(&:join).sort.join(',')
end
