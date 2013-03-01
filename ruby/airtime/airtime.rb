class AirtimeChallenge
  require 'net/http'

  def initialize(email)
    @initial_url = "http://challenge.airtime.com/?email=#{email}"
  end

  def calculate_number(url)
    response = Net::HTTP.get(URI(url))
    ary = response.split('.')
    number = ary.shift

    # if initial value isn't an integer, we've reached another instruction
    # page - print out response and return
    if is_integer(number)
      number = number.to_i
    else
      puts response
      return nil
    end

    ary.each do |elem|
      regex_groups = elem.match(/(.+)\((.+)\)/)
      operation = regex_groups[1]
      value = regex_groups[2].to_i

      case operation
        when 'add'  then number += value
        when 'sub'  then number -= value
        when 'mult' then number *= value
        when 'div'  then number /= value
        else raise 'Unexpected operation'
      end
    end

    number
  end

  def sequence
    sequence = []
    num = calculate_number(@initial_url)

    while num != nil
      sequence << num
      num = calculate_number(@initial_url.gsub('?', "#{num}?"))
    end

    sequence
  end

  private

  def is_integer(str)
    str.to_i.to_s == str
  end
end

class Array
  def all_increasing_subsequences
    if self.length < 2
      []
    else
      main_array = []
      2.upto(self.length) do |i|
        #puts "trying length #{i}"
        arrays = self.combination(i).select{|a| a.is_sorted?}
        if arrays.empty?
          break
        else
          main_array += arrays
        end
      end
      main_array.to_a
    end
  end

  def longest_increasing_subsequences
    array = self
    subsequences = Hash.new {|h,k| h[k] = []}
    array.all_increasing_subsequences.each do |ary|
      subsequences[ary.length] << ary
    end
    subsequences[subsequences.keys.max]
  end

  def is_sorted?
    self.sort == self
  end
end

# placeholder
class Subsequence
end

#=============================================================================
# main
#=============================================================================

#email = ARGV[0]
#if email == nil
#  puts "Usage: #{__FILE__} <email address>"
#  exit
#end

#sequence = AirtimeChallenge.new(email).sequence
#puts Subsequence.new(sequence).sum_of_longest_increasing