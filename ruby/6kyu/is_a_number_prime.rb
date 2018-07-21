require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class WatchOthersCodePartOneProblemOneMySolution < Minitest::Test

  def is_prime(num)
    num >= 2  && (2...num).none? { |divisor| (num % divisor).zero? }
  end

  def test_1
    # skip
    assert(is_prime(2))
  end

  def test_2
    # skip
    refute(is_prime(4))
  end

  def test_3
    # skip
    assert(is_prime(11))
  end

  def test_4
    # skip
    refute(is_prime(1))
  end

  def test_5
    # skip
    assert(is_prime(31))
  end

  def test_6
    # skip
    refute(is_prime(33))
  end

  def test_7
    # skip
    refute(is_prime(-5))
  end

end
