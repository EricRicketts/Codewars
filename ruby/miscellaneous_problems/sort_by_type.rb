=begin
# Given a list of items, sort each item of the same type in ascending order,
the positions of the items of the same type should remain the same.

sort_by_type(['d', 3, 1, 'a', 'c', 2, 'b']) == ['a', 1, 2, 'b', 'c', 3, 'd']

I: an array, for now assume integers or single characters only because I was only
   supplied with on example
0: a sorted array which
  - is in ascending order
  - the proper object type appears in the sorted index, for example in the
    original array the first element is the char 'd' so in the sorted array
    the first element must be a char.  Since 'a' is the lowest ranking char
    it will appear first
AL:
  - make two sorted arrays => 1. contains integers 2. contains strings
  - map the original array
    - if the element is an integer then shift from the sorted integer array
    - if the element is a string then shift from the sorted string array
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SortByTypeMySolution < Minitest::Test

  def sort_by_type(arr)
    sorted_int, sorted_str = arr.partition { |el| el.is_a?(Integer) }.map(&:sort)
    arr.map { |el| el.is_a?(Integer) ? sorted_int.shift : sorted_str.shift }
  end

  def test_1
    # skip
    expected = ['a', 1, 2, 'b', 'c', 3, 'd']
    input = ['d', 3, 1, 'a', 'c', 2, 'b']
    assert_equal(expected, sort_by_type(input))
  end
  
end