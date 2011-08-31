file = ARGV[0]

File.open(file).each do |line|
  puts line.split("").collect(&:to_i).reduce(&:+)
end
