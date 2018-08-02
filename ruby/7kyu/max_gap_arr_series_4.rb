=begin
Maximum Gap

(Level 7 Kata)

Given an array/list [] of integers , Find The maximum difference between the successive elements in its sorted form.

Notes
Array/list size is at least 3 .

Array/list's numbers Will be mixture of positives and negatives also zeros_

Repeatition of numbers in the array/list could occur.

The Maximum Gap is computed Regardless the sign.

Input >> Output Examples
1- maxGap ({13,10,5,2,9}) ==> return (4)
Explanation:
The Maximum Gap after sorting the array is 4 , The difference between 9 - 5 = 4 .
2- maxGap ({-3,-27,-4,-2}) ==> return (23)
Explanation:
The Maximum Gap after sorting the array is 23 , The difference between |-3- (-27) | = 23 .

Note : Regardless the sign of negativity .

3- maxGap ({-7,-42,-809,-14,-12}) ==> return (767)
Explanation:
The Maximum Gap after sorting the array is 767 , The difference between | -809- (-42) | = 767 .

Note : Regardless the sign of negativity .

4- maxGap ({-54,37,0,64,640,0,-15}) //return (576)
Explanation:
The Maximum Gap after sorting the array is 576 , The difference between | 64 - 640 | = 576 .

Note : Regardless the sign of negativity .
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class MaxGap < Minitest::Test

  def max_gap(numbers)
    sorted_numbers = numbers.sort
    sorted_numbers[0..-2].zip(sorted_numbers[1..-1]).map do |pair|
      (pair.last - pair.first).abs 
    end.max
  end

  def test_one 
    assert_equal(4, max_gap([13,10,2,9,5]))
  end

  def test_two    
    assert_equal(8, max_gap([13,3,5]))
  end

  def test_three    
    assert_equal(168, max_gap([24,299,131,14,26,25]))
  end

  def test_four    
    assert_equal(23, max_gap([-3,-27,-4,-2]))
  end

  def test_five    
    assert_equal(767, max_gap([-7,-42,-809,-14,-12]))
  end

  def test_six    
    assert_equal(278, max_gap([12,-5,-7,0,290]))
  end

  def test_seven    
    assert_equal(576, max_gap([-54,37,0,64,-15,640,0]))
  end

  def test_eight   
    assert_equal(80, max_gap([130,30,50]))
  end

  def test_nine    
    assert_equal(0, max_gap([1,1,1]))
  end

  def test_ten    
    assert_equal(0, max_gap([-1,-1,-1]))
  end

end

class MaxGapBestSol < Minitest::Test

=begin
  this was the method I was looking for, that is
  each_cons.  #each_cons returns an enumerator which
  iterates over each element for a block of consecutive
  n elements.  So, for example if we have an array
  arr = [1, 2, 3, 4, 5] and we call each_cons on the array
  with #each arr.each_cons(2).each {|a| p a} the output
  will be [1, 2], [2, 3], [3, 4], [4, 5]
=end

  def max_gap(numbers)
    numbers.sort.each_cons(2).map {|a, b| b - a}.max
  end

  def test_one 
    assert_equal(4, max_gap([13,10,2,9,5]))
  end

  def test_two    
    assert_equal(8, max_gap([13,3,5]))
  end

  def test_three    
    assert_equal(168, max_gap([24,299,131,14,26,25]))
  end

  def test_four    
    assert_equal(23, max_gap([-3,-27,-4,-2]))
  end

  def test_five    
    assert_equal(767, max_gap([-7,-42,-809,-14,-12]))
  end

  def test_six    
    assert_equal(278, max_gap([12,-5,-7,0,290]))
  end

  def test_seven    
    assert_equal(576, max_gap([-54,37,0,64,-15,640,0]))
  end

  def test_eight   
    assert_equal(80, max_gap([130,30,50]))
  end

  def test_nine    
    assert_equal(0, max_gap([1,1,1]))
  end

  def test_ten    
    assert_equal(0, max_gap([-1,-1,-1]))
  end
  
end