def is_happy(i, calculated = [])
  return true if i == 1
  new = i.to_s.split("").collect{|a| a.to_i ** 2}.reduce(&:+)
  return false if calculated.include?(new)
  calculated << new
  is_happy(new, calculated)
end

File.open(ARGV[0]).each do |line|
  puts (is_happy(line.to_i) ? "1" : "0")
end
