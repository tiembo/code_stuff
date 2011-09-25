File.open(ARGV[0]).each do |line|
  str = line.chomp.split(",").first.reverse
  word = line.chomp.split(",").last.reverse
  puts (str.index(word) == 0 ? "1" : "0")
end
