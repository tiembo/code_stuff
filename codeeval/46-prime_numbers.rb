require 'prime'
file = ARGV[0]
str = ""

File.open(file).each do |line|
  2.upto(line.to_i) do |i|
    str += "#{i}," if Prime.prime?(i)
  end
  str.chomp!(",")
  str += "\n"
end
puts str.chomp("\n")
