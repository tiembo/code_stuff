File.open(ARGV[0]).each do |line|
  str = line.split(',').first.reverse
  char = line.split(',').last.chomp
  location = str.index(char)
  puts (location.nil? ? "-1" : str.length - location - 1)
end
