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

class Subsequence
  def initialize(ary)
    @sequence = ary
    @subsequences = Hash.new {|h,k| h[k] = []}
    @longest_subsequence_length = 0
  end

  def sum_of_longest_increasing

    # stop calculating subsequences once the initial array is shorter than
    # the length of the longest subsequence
    while @sequence.length >= @longest_subsequence_length
      calculate_subsequence
    end

    candidate_subsequences = @subsequences[@subsequences.keys.max]
    candidate_subsequences.map{|i| i.reduce(:+)}.max
  end

  private

  def calculate_subsequence
    smallest_number = @sequence.shift
    subsequence = [smallest_number]

    @sequence.each do |i|
      if i > smallest_number
        smallest_number = i
        subsequence << i
      end
    end

    if subsequence.length >= @longest_subsequence_length
      @longest_subsequence_length = subsequence.length
      @subsequences[subsequence.length] << subsequence
    end
  end
end

#=============================================================================
# main
#=============================================================================

email = ARGV[0]
if email == nil
  puts "Usage: #{__FILE__} <email address>"
  exit
end

sequence = AirtimeChallenge.new(email).sequence
puts Subsequence.new(sequence).sum_of_longest_increasing