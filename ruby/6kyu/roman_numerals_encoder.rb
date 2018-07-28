require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class RomanNumeralsEncoderFirstPass < Minitest::Test

=begin
Create a function taking a positive integer as its parameter and
returning a string containing the Roman Numeral representation of that integer.

Modern Roman numerals are written by expressing each digit separately
starting with the left most digit and skipping any digit with a value of zero.
In Roman numerals 1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC.
2008 is written as 2000=MM, 8=VIII; or MMVIII. 1666 uses each Roman symbol
in descending order: MDCLXVI.

Example:

solution(1000) # should return 'M'
Help:

Symbol    Value
I          1
V          5
X          10
L          50
C          100
D          500
M          1,000
Remember that there can't be more than 3 identical symbols in a row.
=end

  ROMAN_NUMERALS = {
    1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X', 40 => 'XL', 50 => 'L',
    90 => 'XC', 100 => 'C', 400 => 'CD', 500 => 'D', 900 => 'CM', 1000 => 'M'
  }

  def solution(number)
    roman_numeral = ''
    number.digits.each.with_index do |n, idx|
      case idx
      when 0
        roman_numeral = roman_numeral.prepend(ones_digit(n))
      when 1
        roman_numeral = roman_numeral.prepend(tens_digit(n))
      when 2
        roman_numeral = roman_numeral.prepend(hundreds_digit(n))
      when 3
        roman_numeral = roman_numeral.prepend(thousands_digit(n))
      end
    end
    roman_numeral
  end

  def ones_digit(digit)
    case digit
    when (1..3)
      ROMAN_NUMERALS[1] * digit
    when 4
      ROMAN_NUMERALS[4]
    when (5..8)
      ROMAN_NUMERALS[5] + ROMAN_NUMERALS[1] * (digit - 5)
    when 9
      ROMAN_NUMERALS[9]
    else
      ''
    end
  end

  def tens_digit(digit)
    case digit
    when (1..3)
      ROMAN_NUMERALS[10] * digit
    when 4
      ROMAN_NUMERALS[40]
    when (5..8)
      ROMAN_NUMERALS[50] + ROMAN_NUMERALS[10] * (digit - 5)
    when 9
      ROMAN_NUMERALS[90]
    else
      ''
    end
  end

  def hundreds_digit(digit)
    case digit
    when (1..3)
      ROMAN_NUMERALS[100] * digit
    when 4
      ROMAN_NUMERALS[400]
    when (5..8)
      ROMAN_NUMERALS[500] + ROMAN_NUMERALS[100] * (digit - 5)
    when 9
      ROMAN_NUMERALS[900]
    else
      ''
    end
  end

  def thousands_digit(digit)
    ROMAN_NUMERALS[1000] * digit
  end

  def test_1
    # skip
    assert_equal('I', solution(1))
  end

  def test_2
    # skip
    assert_equal('IV', solution(4))
  end

  def test_3
    # skip
    assert_equal('VI', solution(6))
  end

  def test_4
    # skip
    assert_equal('XIV', solution(14))
  end

  def test_5
    # skip
    assert_equal('XXI', solution(21))
  end

  def test_6
    # skip
    assert_equal('LXXXIX', solution(89))
  end

  def test_7
    # skip
    assert_equal('XCI', solution(91))
  end

  def test_8
    # skip
    assert_equal('CCXXXIV', solution(234))
  end

  def test_9
    # skip
    assert_equal('DCLXXVIII', solution(678))
  end

  def test_10
    # skip
    assert_equal('CMLXXXIV', solution(984))
  end

  def test_11
    # skip
    assert_equal('M', solution(1000))
  end

  def test_12
    # skip
    assert_equal('MDCCCLXXXIX', solution(1889))
  end

  def test_13
    # skip
    assert_equal('MCMLXXXIX', solution(1989))
  end

end

class RomanNumeralsEncoderSecondPass < Minitest::Test

  ROMAN_NUMERALS = {
    1 => ['I', 'X', 'C', 'M'],
    4 => ['IV', 'XL', 'CD'],
    5 => ['V', 'L', 'D'],
    9 => ['IX', 'XC', 'CM']
  }

  def solution(number)
    number.digits.each_with_index.inject('') do |roman_numeral, (n, idx)|
      roman_numeral = roman_numeral.prepend(encode_digit(n, idx))
    end
  end

  def encode_digit(digit, power_of_ten)
    case digit
    when (1..3)
      ROMAN_NUMERALS[1][power_of_ten] * digit
    when 4
      ROMAN_NUMERALS[4][power_of_ten]
    when (5..8)
      ROMAN_NUMERALS[5][power_of_ten] + ROMAN_NUMERALS[1][power_of_ten] * (digit - 5)
    when 9
      ROMAN_NUMERALS[9][power_of_ten]
    else
      ''
    end
  end

  def test_1
    # skip
    assert_equal('I', solution(1))
  end

  def test_2
    # skip
    assert_equal('IV', solution(4))
  end

  def test_3
    # skip
    assert_equal('VI', solution(6))
  end

  def test_4
    # skip
    assert_equal('XIV', solution(14))
  end

  def test_5
    # skip
    assert_equal('XXI', solution(21))
  end

  def test_6
    # skip
    assert_equal('LXXXIX', solution(89))
  end

  def test_7
    # skip
    assert_equal('XCI', solution(91))
  end

  def test_8
    # skip
    assert_equal('CCXXXIV', solution(234))
  end

  def test_9
    # skip
    assert_equal('DCLXXVIII', solution(678))
  end

  def test_10
    # skip
    assert_equal('CMLXXXIV', solution(984))
  end

  def test_11
    # skip
    assert_equal('M', solution(1000))
  end

  def test_12
    # skip
    assert_equal('MDCCCLXXXIX', solution(1889))
  end

  def test_13
    # skip
    assert_equal('MCMLXXXIX', solution(1989))
  end

end
