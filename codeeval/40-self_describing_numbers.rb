File.open(ARGV[0]).each do |line|
  frequency = line.chomp.split("").collect(&:to_i)
  count = {}
  0.upto(frequency.length - 1) {|i| count[i] = 0}
  sd = true
  frequency.each do |i|
    count[i] ||= 0
    count[i] += 1
  end 

  frequency.each_with_index do |j,k|
    if count[k] != j
      sd = false
      break
    end
  end
  puts (sd ? "1": "0") 
end
