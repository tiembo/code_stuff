require './airtime'

#describe Array do # not sure why this doesn't work
describe Subsequence do
  describe '#all_increasing_subsequences' do
    context 'array length is less than 2' do
      it 'should return an empty array' do
        [].all_increasing_subsequences.should == []
        [1].all_increasing_subsequences.should == []
      end
    end

    context 'array length is >= 2' do
      it 'should return an array of increasing subsequences' do
        [3,4,1,2,5].all_increasing_subsequences.should == [
          [3,4],[3,5],[4,5],[1,2],[1,5],[2,5],
          [3,4,5],[1,2,5]
        ]
      end

      it 'should return an empty array if there are no increasing subsequences' do
        [5,4,3].all_increasing_subsequences.should == []
      end
    end
  end

  describe '#is_sorted?' do
    it 'should return true if the array is already sorted' do
      [1,2,3].is_sorted?.should be_true
    end

    it 'should return false if the array is not sorted' do
      [3,1,2].is_sorted?.should be_false
    end
  end

  describe '#longest_increasing_subsequences' do
    it 'should return the longest increasing subsequences' do
      [3,4,1,2,5].longest_increasing_subsequences.should == [[3,4,5],[1,2,5]]
      [5,1,2,3].longest_increasing_subsequences.should == [[1,2,3]]
      [1,3,5,7,9,2,4,6,8].longest_increasing_subsequences.should == [
        [1,3,5,7,9],[1,3,5,7,8],[1,3,5,6,8],[1,3,4,6,8],[1,2,4,6,8]
      ]
    end
  end

  describe 'performance' do
    xit 'test' do
      foobar = [-200, -95, 13, 3, -63, 1, -62, -99, 0, -32, -400, 4741, -7, 43, 10, 12, 47520, -6, -173, -9, 191, 260, -284, 33, -123488, -38, -839, -56, 119, 25, -920, -842, 749153, 15, -36, 40, -8, 222, 8, 2712, 2159, 6855, 224, -150, -10, 13575581, 4, -370, -54764609688, 5, 2, -4318, -19, 192, -41, 27, 1995, -8280, 9482, -4, 2268, 111, 54, 403, -699, 17, -4449, 2014767720, 3088, -6795, -248, -115, 212, 153, -376712, 42, -224, -90259, -148, 18, 854, 2349, 66043, -2370, 90487524, 8346, -18, 88, -124, -15, 393, 7, 226, -36270374, -53, -4052, 26, 95, -13907921, -109]
      sf = [-60, 2, -1, -108, 1, -12, 21, -96, -121, 149, -180, 340, 5, 144, 222, -3, 792, 3, -50, -1436, -14, -65, 0, 213, -252, -18, -5, 28, -17147, 821, -6, 8, -111, 246488, -861, 3974, -4, 9, -187, 763, 7, 33, -701, 12, 4, 32, -114, 128, -449, -2018, 105, 114, -89, -530, 90, -253, -14075, 110084, -77, 160244, -61, -101225409, -15, -153, 7449, -162, 177, 24, -545, 164, 249, -17486, -340, -20, -629, 6940, 648, -126, 210, -32906, 192, -836127, 22, 2152099158, 97653, -224, -2169230, -7, 2881440, -46, 42422, 2546, -22129696311, 26, -2, 2300, -641, -1344256, -743, -310]
      foobar.longest_increasing_subsequences.should == []
    end
  end
end