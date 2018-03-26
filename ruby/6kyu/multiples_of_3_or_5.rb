require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once.
=end

class MultiplesOf3Or5 < Minitest::Test

  def solution(number)
    (1...number).select {|num| (num % 3).zero? || (num % 5).zero?}.reduce(:+)
  end

  # this was offered as a more efficient solution because one only interates through
  # the list one time.  I can see such a requirement for a very large number, however
  # I think the first solution is more readable.  I personally do not like putting
  # conditionals in methods like #map and #inject because that is what #select is for.
  def second_solution(number)
    (1...number).inject(0) {|sum, num| (num % 3).zero? || (num % 5).zero? ? sum + num : sum}
  end

  def test_case_1
    assert_equal(23, solution(10))    
    assert_equal(23, second_solution(10))    
  end

  def test_case_2
    assert_equal(78, solution(20))
    assert_equal(78, second_solution(20))
  end

  def test_case_3
    assert_equal(9168, solution(200))
    assert_equal(9168, second_solution(200))
  end

end