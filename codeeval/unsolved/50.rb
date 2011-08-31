File.open(ARGV[0]).each do |line|
  line = line.chomp!.split(";")
  num = line.first
  rep = line.last.split(',')
  rep.each_with_index do |i,j|
    if ((j % 2) == 0)
      num.sub!(i, "sub#{(j+65).chr}")
    end
  end
  rep.each_with_index do |i,j|
    num.gsub!("sub#{(j+65).chr}", rep[j+1]) if ((j % 2) == 0)
  end
  puts num
end
