require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class RomanNumeralsDecoderFirstSolution < Minitest::Test

=begin
Create a function that takes a Roman numeral as its argument and returns its value as a numeric decimal integer.
You don't need to validate the form of the Roman numeral.

Modern Roman numerals are written by expressing each decimal digit of the number to be encoded separately,
starting with the leftmost digit and skipping any 0s. So 1990 is rendered "MCMXC" (1000 = M, 900 = CM, 90 = XC)
and 2008 is rendered "MMVIII" (2000 = MM, 8 = VIII). The Roman numeral for 1666, "MDCLXVI", uses each letter in descending order.

Example:

solution('XXI') # should return 21
Help:

Symbol    Value
I          1
V          5
X          10
L          50
C          100
D          500
M          1,000

AL:
  split into characters and then reverse
    - initialize the sum to zero
    - store the current charter into a previous character
      - evaluate each character
      - if the current character is < previous character
        - subract current character value from sum
        - else add current character value to sum
=end

  VALUES = {
    "I" => 1, "V" => 5, "X" => 10, "L" => 50,
    "C" => 100, "D" => 500, "M" => 1_000
  }

  def solution(roman)
    previous_value = -1 * Float::INFINITY
    roman.chars.reverse.inject(0) do |decoded_number, char|
      current_value = VALUES[char]
      current_value = current_value < previous_value ? -1 * current_value : current_value

      previous_value = current_value.abs
      decoded_number += current_value
    end
  end

  def test_1
    # skip
    assert_equal(1, solution('I'))
  end

  def test_2
    # skip
    assert_equal(2, solution('II'))
  end

  def test_3
    # skip
    assert_equal(30, solution('XXX'))
  end

  def test_4
    # skip
    assert_equal(400, solution('CD'))
  end

  def test_5
    # skip
    assert_equal(5, solution('V'))
  end

  def test_6
    # skip
    assert_equal(60, solution('LX'))
  end

  def test_7
    # skip
    assert_equal(7, solution('VII'))
  end

  def test_8
    # skip
    assert_equal(800, solution('DCCC'))
  end

  def test_9
    # skip
    assert_equal(90, solution('XC'))
  end

  def test_10
    # skip
    assert_equal(44, solution('XLIV'))
  end

  def test_11
    # skip
    assert_equal(259, solution('CCLIX'))
  end

  def test_12
    # skip
    assert_equal(548, solution('DXLVIII'))
  end

  def test_13
    # skip
    assert_equal(999, solution('CMXCIX'))
  end

  def test_14
    # skip
    assert_equal(2715, solution('MMDCCXV'))
  end

  def test_15
    # skip
    assert_equal(1498, solution('MCDXCVIII'))
  end

end
