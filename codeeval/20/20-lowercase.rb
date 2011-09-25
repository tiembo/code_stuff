file = ARGV[0]

File.open(file).each do |line|
  puts line.downcase
end
