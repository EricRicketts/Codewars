=begin
Alphabetically Ordered

(Level 7 Kata)

Your task is very simple. Just write a function isAlphabetic(s), which takes an input
string s in lowercase and returns true/false depending on whether the string is in
alphabetical order or not.

For example, isAlphabetic('kata') is False as 'a' comes after 'k', but isAlphabetic('ant') is True.

I: a string which can be a single character or an empty string, all chars lowercase
  - asssume string is all alpha
O: boolean
   - true if string is in alphabetical order
    - true if empty
    - true if single characte
AL:
  - guard conditon, return true if empty? or single char
  - otherwise
    - string.chars.all?
      string[idx] < string[idx + 1] if idx + 1 < string length
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class AlphabeticallyOrderedMyFirstSolution < Minitest::Test

  def alphabetic(s)
    s.chars.each_cons(2).all? { |a, b| a <= b }
  end

  def test_1
    # skip
    refute(alphabetic('asd'))
  end

  def test_2
    # skip
    refute(alphabetic('codewars'))
  end

  def test_3
    # skip
    assert(alphabetic('door'))
  end

  def test_4
    # skip
    assert(alphabetic('cell'))
  end

  def test_5
    # skip
    assert(alphabetic('z'))
  end

  def test_6
    # skip
    assert(alphabetic(''))
  end

end

class AlphabeticallyOrderedCodewarsSolution < Minitest::Test
=begin
such a simple solution, sort the string by its letters and then
compare it with the original string
=end

  def alphabetic(s)
    s == s.chars.sort.join
  end

  def test_1
    # skip
    refute(alphabetic('asd'))
  end

  def test_2
    # skip
    refute(alphabetic('codewars'))
  end

  def test_3
    # skip
    assert(alphabetic('door'))
  end

  def test_4
    # skip
    assert(alphabetic('cell'))
  end

  def test_5
    # skip
    assert(alphabetic('z'))
  end

  def test_6
    # skip
    assert(alphabetic(''))
  end

end