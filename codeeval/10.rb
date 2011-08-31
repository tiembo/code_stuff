File.open(ARGV[0]).each do |line|
  chars = line.chomp.split(" ")
  pos = chars.pop.to_i
  next if pos > chars.length
  puts chars[-pos] 
end
