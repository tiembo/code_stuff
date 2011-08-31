print "Enter numbers, comma separated: "
list = gets.chomp.split(',').collect(&:to_i)

count = 0
highest_value = list.max

2.upto(list.length) do |l|
  candidate_sums = list.combination(l).collect {|p| p.reduce(:+)}.reject {|r| r > highest_value or !list.include?(r)}
  count += candidate_sums.count
end

puts count