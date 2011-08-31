File.open(ARGV[0]).each do |line|
  line = line.chomp!
  ary = line.split("")
  ary.each do |c|
    if line.count(c) == 1
      puts c
      break
    end
  end
end
