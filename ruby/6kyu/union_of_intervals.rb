=begin
Union Of Intervals

(Level 6 Kata)

Write a function interval_insert which takes as input

a list myl of disjoint closed intervals with integer endpoints, sorted by increasing order of left endpoints
an interval interval
and returns the union of interval with the intervals in myl, as an array of disjoint closed intervals.

Terminology
A closed interval includes its endpoints. For example [0,5] means greater than or equal to 0 and less
than or equal to 5. For more, refer to Wikipedia.

Two intervals are said to be disjoint if they have no element in common. Equivalently, disjoint
intervals are intervals whose intersection is the empty interval. For example,
[1,3] and [4,6] are disjoint
[1,3] and [3,5] are not.

Examples:
                         [(1, 2)], (3, 4) -> [(1, 2), (3, 4)]
                         [(3, 4)], (1, 2) -> [(1, 2), (3, 4)]
                 [(1, 2), (4, 6)], (1, 4) -> [(1, 6)]
[(0, 2), (3, 6), (7, 7), (9, 12)], (1, 8) -> [(0, 8), (9, 12)]
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class UnionOfIntervalsMyFirstSolution < Minitest::Test

  def interval_insert (myl, interval)
      #your code here
  end

  def test_1
    skip
    expected = [[1, 2], [3, 4]]
    assert_equal(expected, interval_insert([[1, 2]], [3, 4]))
  end

  def test_2
    skip
    expected = [[1, 4]]
    assert_equal(expected, interval_insert([[1, 2], [3, 4]], [2, 3]))
  end

  def test_3
    skip
    expected = [[1, 4], [5, 6]]
    assert_equal(expected, interval_insert([[1, 2], [3, 4], [5, 6]], [2, 3]))
  end

  def test_4
    skip
    expected = [[1, 2], [3, 4]]
    assert_equal(expected, interval_insert([[3, 4]], [1, 2]))
  end

  def test_5
    skip
    expected = [[1, 6]]
    assert_equal(expected, interval_insert([[1, 2], [4, 6]], [1, 4]))
  end

  def test_6
    skip
    expected = [[0, 8], [9, 12]]
    assert_equal(expected, interval_insert([[0, 2], [3, 6], [7, 7], [9, 12]], [1, 8]))
  end


end
