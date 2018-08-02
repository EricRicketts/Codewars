=begin
Sub-array elements sum

(Level 7 Kata)

Given an array (or list or vector) of arrays (or, guess what, lists or vectors) of integers, your goal is to return the sum of a specific set of numbers,
starting with elements whose position is equal to the main array length and going down by one at each step.

Say for example the parent array (etc, etc) has 3 sub-arrays inside: you should consider the third element of the first sub-array,
the second of the second array and the first element in the third one: [[3, 2, 1, 0], [4, 6, 5, 3, 2], [9, 8, 7, 4]] would have you
considering 1 for [3, 2, 1, 0], 6 for [4, 6, 5, 3, 2] and 9 for [9, 8, 7, 4], which sums up to 16.

One small note if that not always each sub-array will have enough elements, in which case you should then use a default value
if provided or 0 if not provided, as shown in the test cases.

describe "Basic tests" do
  Test.assert_equals(elements_sum([[3, 2, 1, 0], [4, 6, 5, 3, 2], [9, 8, 7, 4]]), 16)
  Test.assert_equals(elements_sum([[3], [4, 6, 5, 3, 2], [9, 8, 7, 4]]), 15)
  Test.assert_equals(elements_sum([[3, 2, 1, 0], [4, 6, 5, 3, 2], []]), 7)
  Test.assert_equals(elements_sum([[3, 2, 1, 0], [4, 6, 5, 3, 2], []], 5), 12)
  Test.assert_equals(elements_sum([[3, 2], [4], []]), 0)
end
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SubArrayElementsSum < Minitest::Test

=begin
I: an array of arrays and a number
0: an integer
AL:
  - count the number of subarrays
  - cycle through the arrays
    - grab the element from the current subarray, which starts at the array size
      and is decremented by one each time
    - if the value is nil, return the default value
=end

  def elements_sum(arr, d = 0)
    arr.reverse.each.with_index.inject(0) do |sum, (ary, idx)|
      sum += (num = ary[idx].nil? ? d : ary[idx])
    end
  end

  def test_1
    # skip
    assert_equal(16, elements_sum([[3, 2, 1, 0], [4, 6, 5, 3, 2], [9, 8, 7, 4]]))
  end

  def test_2
    # skip
    assert_equal(15, elements_sum([[3], [4, 6, 5, 3, 2], [9, 8, 7, 4]]))
  end

  def test_3
    # skip
    assert_equal(7, elements_sum([[3, 2, 1, 0], [4, 6, 5, 3, 2], []]))
  end

  def test_4
    # skip
    assert_equal(12, elements_sum([[3, 2, 1, 0], [4, 6, 5, 3, 2], []], 5))
  end

  def test_5
    # skip
    assert_equal(0, elements_sum([[3, 2], [4], []]))
  end

end
