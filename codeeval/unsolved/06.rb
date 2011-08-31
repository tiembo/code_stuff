File.open(ARGV[0]).each do |line|
  next if line.chomp == ""
  a = line.split(';').first.split("")
  b = line.chomp.split(';').last.split("")
  puts (a & b).join("")
end
