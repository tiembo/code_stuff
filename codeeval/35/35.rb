File.open(ARGV[0]).each do |line|
  next if line.chomp == ""
  if line.chomp.count('@') > 1
    puts false
    next
  end
  res = line.chomp =~ /\w+\@\w+\.\w+/
  puts (res.nil? ? false : true)
end
