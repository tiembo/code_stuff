require 'prime'

def is_palindrome(str)
  str == str.reverse
end

1000.downto(1) do |i|
  if Prime.prime?(i) and is_palindrome(i.to_s)
    puts i
    break
  end
end