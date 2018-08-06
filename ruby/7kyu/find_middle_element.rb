=begin
Find The Middle Element

(Level 7 Kata)

As a part of this Kata, you need to create a function that when provided with a triplet,
returns the index of the numerical element that lies between the other two elements.

The input to the function will be an array of three distinct numbers (Haskell: a tuple).

For example:

gimme([2, 3, 1]) => 0
2 is the number that fits between 1 and 3 and the index of 2 in the input array is 0.

Another example (just to make sure it is clear):

gimme([5, 10, 14]) => 1
10 is the number that fits between 5 and 14 and the index of 10 in the input array is 1.

AL:
  - sort the array, then the middle number is of index 1
  - use Array#index on the input array of find the index of the middle number
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class FindMiddleElementMySolution < Minitest::Test

  def gimmie(input_array)
    input_array.index(input_array.sort[1])
  end

  def test_1
    # skip
    assert_equal(0, gimmie([2, 3, 1]))
  end
  
  def test_2
    # skip
    assert_equal(1, gimmie([5, 10, 14]))
  end
  
  def test_3
    # skip
    assert_equal(1, gimmie([1, 3, 4]))
  end
  
  def test_4
    # skip
    assert_equal(2, gimmie([15, 10, 14]))
  end
  
  def test_5
    # skip
    assert_equal(0, gimmie([-0.401, -23, 4]))
  end
  
  def test_6
    # skip
    assert_equal(1, gimmie([-15, -10, 14]))
  end
  
end