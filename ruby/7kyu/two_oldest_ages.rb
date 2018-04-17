require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class TwoOldestAges < Minitest::Test

  def two_oldest_ages(ages)
    ages.sort.slice(-2,2)   
  end

  def test_one
    ages = [1, 3, 10, 0]
    assert_equal([3, 10], two_oldest_ages(ages))
  end
  
  def test_two
    ages = [-5, -10, -3, 10, 20, 13, 8]
    assert_equal([13, 20], two_oldest_ages(ages))
  end
  
  def test_three
    ages = [55, 45, 73, 123, 101, 115, 122]
    assert_equal([122, 123], two_oldest_ages(ages))
  end
  
end

class TwoOldestAgesBestSolution < Minitest::Test

  def two_oldest_ages(ages)
    # this was the most upvoted solution on Codewars
    # our thinking was the same but he remembered that
    # last can take an argument, that is how many last
    # very clever.
    # another very good solution => ages.max(2).sort
    ages.sort.last(2)
  end

  def test_one
    ages = [1, 3, 10, 0]
    assert_equal([3, 10], two_oldest_ages(ages))
  end
  
  def test_two
    ages = [-5, -10, -3, 10, 20, 13, 8]
    assert_equal([13, 20], two_oldest_ages(ages))
  end
  
  def test_three
    ages = [55, 45, 73, 123, 101, 115, 122]
    assert_equal([122, 123], two_oldest_ages(ages))
  end
  
end