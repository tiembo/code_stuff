file = ARGV[0]

File.open(file).each do |line|
  str = ""
  l = line.split
  fizz = l[0].to_i
  buzz = l[1].to_i
  limit = l[2].to_i

  1.upto(limit) do |i|
    if (i % (fizz * buzz) == 0)
      str += "FB "
    elsif (i % fizz == 0)
      str += "F "
    elsif (i % buzz == 0)
      str += "B "
    else
      str += "#{i} "
    end
  end
  puts str.chomp
end
