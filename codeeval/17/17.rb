def largest_continuous_sum(array)
  largest = array.first(2).reduce(&:+)
  0.upto(array.length - 1) do |start_position|
    2.upto(array.length - start_position) do |length|
      sum = array[start_position, length].reduce(&:+)
      largest = sum if sum > largest
    end
  end
  largest
end

#describe "largest_continuous_sum" do
#  it "should return the largest sum" do
#    largest_continuous_sum([-10, 2, 3, -2, 0, 5, -15]).should == 8
#    largest_continuous_sum([2,3,-2,-1,10]).should == 12
#  end
#end

File.open(ARGV[0]).each do |line|
  puts largest_continuous_sum(line.chomp.split(',').map(&:to_i))
end
