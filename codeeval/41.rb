File.open(ARGV[0]).each do |line|
  next if line.chomp == ""
  n = line.split(';').first
  ary = line.chomp.split(';').last.split(',')
  h = {}
  ary.each do |a|
    if h[a].nil?
      h[a] = 1
    else
      puts a
      break
    end
  end
end
