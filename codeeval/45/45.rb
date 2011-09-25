def is_pal(int)
  a = int.to_s
  a == a.reverse
end

def do_it(int, count)
  if is_pal(int)
    return "#{count} #{int}"
  else
    sum = int + int.to_s.reverse.to_i
    do_it(sum, count+1)
  end
end

File.open(ARGV[0]).each do |line|
  i = line.chomp.to_i
  count = 0
  puts do_it(i, count)
end
