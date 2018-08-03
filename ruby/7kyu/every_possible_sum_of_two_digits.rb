=begin
Given a long number, return all the possible sum of two digits of it.

For example, 12345: all possible sum of two digits from that number are:

[ 1 + 2, 1 + 3, 1 + 4, 1 + 5, 2 + 3, 2 + 4, 2 + 5, 3 + 4, 3 + 5, 4 + 5 ]
Therefore the result must be:

[ 3, 4, 5, 6, 5, 6, 7, 7, 8, 9 ]


=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class EveryPossibleSumOfTwoDigitsMyFirstSolution < Minitest::Test

  def digits(num)
    num.to_s.chars.map(&:to_i).combination(2).map { |comb| comb.inject(&:+) }
  end    

  def test_1
    # skip
    assert_equal([ 6, 7, 11 ], digits(156))
  end

  def test_2
    # skip
    assert_equal([ 9, 13, 17, 14, 6, 10, 7, 14, 11, 15 ], digits(81596))
  end

  def test_3
    # skip
    assert_equal([ 11, 8, 5, 13, 10, 7 ], digits(3852))
  end

  def test_4
    # skip
    assert_equal([ 5, 9, 7, 4, 5, 11, 8, 6, 3, 4, 10, 10, 7, 8, 14, 5, 6, 12, 3, 9, 10 ], digits(3264128))
  end

  def test_5
    # skip
    assert_equal([ 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18 ], digits(999999))  
  end

end

class EveryPossibleSumOfTwoDigitsCodeWars < Minitest::Test

  def digits(num)
    num.to_s.chars.map(&:to_i).combination(2).map(&:sum)
  end    

  def test_1
    # skip
    assert_equal([ 6, 7, 11 ], digits(156))
  end

  def test_2
    # skip
    assert_equal([ 9, 13, 17, 14, 6, 10, 7, 14, 11, 15 ], digits(81596))
  end

  def test_3
    # skip
    assert_equal([ 11, 8, 5, 13, 10, 7 ], digits(3852))
  end

  def test_4
    # skip
    assert_equal([ 5, 9, 7, 4, 5, 11, 8, 6, 3, 4, 10, 10, 7, 8, 14, 5, 6, 12, 3, 9, 10 ], digits(3264128))
  end

  def test_5
    # skip
    assert_equal([ 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18 ], digits(999999))  
  end

end