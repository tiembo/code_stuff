print "Enter string: "
string = gets.chomp
string_length = string.length

longest_length = 1
match_position = 0

0.upto(string_length) do |position|
  position.upto(string_length) do |substring_position|
    substring_length = substring_position - position
    if substring_length > longest_length
      substring = string[position..(position + substring_length - 1)]
      if substring == substring.reverse
        longest_length = substring_length - 1
        match_position = position
      end
    end
  end
end

puts "\nLongest palindrome: #{string[match_position..(match_position + longest_length)]}"
