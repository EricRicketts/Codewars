=begin
Minimize Sum Of An Array

(Level 7 Kata)

Given an array of intgers , Find the minimum sum which is obtained from summing each Two integers product .

Notes
Array/list will contain positives only .
Array/list will always has even size
Input >> Output Examples
1- minSum({5,4,2,3}) ==> return (22)
Explanation:
The minimum sum obtained from summing each two integers product , 5*2 + 3*4 = 22
2- minSum({12,6,10,26,3,24}) ==> return (342)
Explanation:
The minimum sum obtained from summing each two integers product , 26*3 + 24*6 + 12*10 = 342
3- minSum({9,2,8,7,5,4,0,6}) ==> return (74)
Explanation:
The minimum sum obtained from summing each two integers product , 9*0 + 8*2 +7*4 +6*5 = 74

=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class MinimizeSumOfArray < Minitest::Test

  def min_sum(arr)
    return 0 if arr.empty?
    low_to_high = arr.sort
    high_to_low = low_to_high.reverse
    paired_min_max = low_to_high.zip(high_to_low).take(arr.length/2)
    paired_min_max.inject(0) {|sum, pair| sum += pair.first * pair.last}    
  end

  def test_one
    assert_equal(min_sum(22, [5,4,2,3]))
  end

  def test_two
    assert_equal(min_sum(342, [12,6,10,26,3,24]))    
  end

  def test_three
    assert_equal(min_sum(74, [9,2,8,7,5,4,0,6]))    
  end

  def test_four
    assert_equal(min_sum(2, [1,2]))    
  end

  def test_five
    assert_equal(min_sum(0, []))    
  end
  
end

class MinimizeSumOfArrayBestSolution < Minitest::Test

=begin
  my solution was thinking along the same lines as the one
  of the two most upvoted solutions.  Here is one of the
  most upvoted solutions and I modify it below to make
  it more readable.
  just some notes on the implementation, much more clever
  than I thought, good knowledge of Ruby.  So if the
  array has 8 elements, then arr.size / 2 = 4
  but notice the array slice uses ... instead of ..
  so the indices are going from 0 to 3 not 0 to 4, but
  when taking the upper half of the array he starts at 4
  and the goes to the last element.  So in the case of
  an 8 element array, [0...half] takes us from indices 0 to 3
  while [half..-1] takes us from indices 4 to 7
=end

  def min_sum(arr)
    arr.sort!
    half = arr.size / 2
    arr[0...half].zip(arr[half..-1].reverse).inject(0){|r,e| r + e.reduce(:*) }
  end

  def test_one
    assert_equal(22, min_sum([5,4,2,3]))
  end

  def test_two
    assert_equal(342, min_sum([12,6,10,26,3,24]))    
  end

  def test_three
    assert_equal(74, min_sum([9,2,8,7,5,4,0,6]))    
  end

  def test_four
    assert_equal(2, min_sum([1,2]))    
  end

  def test_five
    assert_equal(0, min_sum([]))    
  end
  
end