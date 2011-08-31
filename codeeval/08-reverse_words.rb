file = ARGV[0]

File.open(file).each do |line|
  str = line.lstrip
  puts line.split.reverse.join(" ") unless str == ""
end
