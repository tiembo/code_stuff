file = ARGV[0]

File.open(file).each do |line|
  ary = line.chomp.split(',')
  binary = ary[0].to_i.to_s(2).reverse
  puts binary[ary[1].to_i-1] == binary[ary[2].to_i-1]
end
