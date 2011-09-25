File.open(ARGV[0]).each do |line|
  str = line.split(',').first
  chr = line.split(',').last.chomp.strip.split("").join("|")
  puts str.gsub(/#{chr}/, "")
end
