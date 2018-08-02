=begin
Task
Given Two intgers a , b , find The sum of them , BUT You are not allowed to use the operators + and -

Notes
The numbers (a,b) may be positive , negative values or zeros .

Returning value will be integer .


Input >> Output Examples
1- add (5,19) ==> return (24)

2- Add (-27,18) ==> return (-9)

3- Add (-14,-16) ==> return (-30)

my solution worked on the samples but it timed out
on the final test suite it needs to be made faster
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SumOfTwoNumbersMyFirstSolution < Minitest::Test

  def add(x, y)
    return x.zero? ? y : x if x.zero? || y.zero?
    result, iterator = x, y.abs
    y > 0 ? iterator.times { result = result.succ } :
      iterator.times { result = result.pred }
    result
  end

  def test_1
    # skip
    assert_equal(5, add(0, 5))
  end

  def test_2
    # skip
    assert_equal(-6, add(-6, 0))
  end

  def test_3
    # skip
    assert_equal(24, add(5, 19))
  end

  def test_4
    # skip
    assert_equal(-9, add(-27, 18))
  end

  def test_5
    # skip
    assert_equal(-30, add(-14, -16))
  end

  def test_6
    # skip
    assert_equal(4, add(19, -15))
  end

end
