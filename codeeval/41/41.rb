File.open(ARGV[0]).each do |line|
  line = line.chomp
  next if line == "" # skip empty lines

  # parse line
  line_split = line.split(';')
  total_numbers = line_split.first.to_i
  numbers = line_split.last.split(',').collect(&:to_i)

  # calculate values
  sum_of_numbers = numbers.reduce(:+)
  possible_sum = (1..(total_numbers - 2)).reduce(:+)
  puts sum_of_numbers - possible_sum
end
