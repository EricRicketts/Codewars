=begin
Sort an array by value and index

(Level 7 Kata)

Your task is to sort an array of integer numbers by the product of the value and the index of the positions. 

For sorting the index starts at 1, NOT at 0!
The sorting has to be ascending.
The array will never be null and will always contain numbers. 

Example:

Input: 23, 2, 3, 4, 5
Product of value and index:
23 => 23 * 1 = 23  -> Output-Pos 4
 2 =>  2 * 2 = 4   -> Output-Pos 1
 3 =>  3 * 3 = 9   -> Output-Pos 2
 4 =>  4 * 4 = 16  -> Output-Pos 3
 5 =>  5 * 5 = 25  -> Output-Pos 5

Output: 2, 3, 4, 23, 5



Have fun coding it and please don't forget to vote and rank this kata! :-)

I have also created other katas. Take a look if you enjoyed this kata!

describe "Basic tests" do
Test.assert_equals(sort_by_value_and_index([ 1, 2, 3, 4, 5 ]), [ 1, 2, 3, 4, 5 ])
Test.assert_equals(sort_by_value_and_index([ 23, 2, 3, 4, 5 ]), [ 2, 3, 4, 23, 5 ])
Test.assert_equals(sort_by_value_and_index([ 26, 2, 3, 4, 5 ]), [ 2, 3, 4, 5, 26 ])
Test.assert_equals(sort_by_value_and_index([ 9, 5, 1, 4, 3 ]), [ 1, 9, 5, 3, 4 ])
end

=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SortAnArrayByValueAndIndexMySolution < Minitest::Test

  def sort_by_value_and_index(arr)
    arr.sort_by.with_index { |n, idx| n*(idx + 1) }
  end


  def test_1
    # skip
    expected = [ 1, 2, 3, 4, 5 ]
    assert_equal(expected, sort_by_value_and_index([ 1, 2, 3, 4, 5 ]))
  end
  
  def test_2
    # skip
    expected = [ 2, 3, 4, 23, 5 ]
    assert_equal(expected, sort_by_value_and_index([ 23, 2, 3, 4, 5 ]))
  end
  
  def test_3
    # skip
    expected = [ 2, 3, 4, 5, 26 ]
    assert_equal(expected, sort_by_value_and_index([ 26, 2, 3, 4, 5 ]))
  end
  
  def test_4
    # skip
    expected = [ 1, 9, 5, 3, 4 ]
    assert_equal(expected, sort_by_value_and_index([ 9, 5, 1, 4, 3 ]))
  end
  
end

class SortAnArrayByValueAndIndexCodeWarsSolution < Minitest::Test

# very clever with_index(offset) offset allows one
# to use a different indexing scheme, in this case
# 1..n+1 vice 0..n
  def sort_by_value_and_index(arr)
    arr.sort_by.with_index(1) { |n, idx| n*idx }
  end

  def test_1
    # skip
    expected = [ 1, 2, 3, 4, 5 ]
    assert_equal(expected, sort_by_value_and_index([ 1, 2, 3, 4, 5 ]))
  end
  
  def test_2
    # skip
    expected = [ 2, 3, 4, 23, 5 ]
    assert_equal(expected, sort_by_value_and_index([ 23, 2, 3, 4, 5 ]))
  end
  
  def test_3
    # skip
    expected = [ 2, 3, 4, 5, 26 ]
    assert_equal(expected, sort_by_value_and_index([ 26, 2, 3, 4, 5 ]))
  end
  
  def test_4
    # skip
    expected = [ 1, 9, 5, 3, 4 ]
    assert_equal(expected, sort_by_value_and_index([ 9, 5, 1, 4, 3 ]))
  end
  
end

class SortAnArrayByValueAndIndexManualSolution < Minitest::Test

=begin
in this solution an attempt was made to do it manually
  - compute the product of the current number * current index
  - pair this product with the current index in an array so the mapping
    would result in [product, index]
  - then sort the resulting list based on the product, now the array
    is in the desired sorted order with the accompanying original index
    paired with each sorted product
  - with the sorted results we do another map and conver the product
    back into the original value by product/(index + 1)
=end

  def sort_by_value_and_index(arr)
    new_arr = arr.map.with_index { |n, idx| [n*(idx + 1), idx] }
    new_arr.sort! { |a, b| a.first <=> b.first }
    new_arr.map { |ary| ary.first/(ary.last + 1) }
  end


  def test_1
    # skip
    expected = [ 1, 2, 3, 4, 5 ]
    assert_equal(expected, sort_by_value_and_index([ 1, 2, 3, 4, 5 ]))
  end
  
  def test_2
    # skip
    expected = [ 2, 3, 4, 23, 5 ]
    assert_equal(expected, sort_by_value_and_index([ 23, 2, 3, 4, 5 ]))
  end
  
  def test_3
    # skip
    expected = [ 2, 3, 4, 5, 26 ]
    assert_equal(expected, sort_by_value_and_index([ 26, 2, 3, 4, 5 ]))
  end
  
  def test_4
    # skip
    expected = [ 1, 9, 5, 3, 4 ]
    assert_equal(expected, sort_by_value_and_index([ 9, 5, 1, 4, 3 ]))
  end
  
end