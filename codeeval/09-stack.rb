File.open(ARGV[0]).each do |line|
  str = ""
  line.chomp.split(" ").reverse.each_with_index do |a, i|
    str += "#{a} " if ((i % 2) == 0)
  end
  puts str.chomp
end
