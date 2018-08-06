=begin
Weird String Case

(Level 6 Kata)

Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string
with all even indexed characters in each word upper cased, and all odd indexed characters in each
word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased.

The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only
be present if there are multiple words. Words will be separated by a single space(' ').

Examples:
weirdcase( "String" )#=> returns "StRiNg"
weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"

I: A single string, consisting of only alphabetic characters and spaces
O: same string but with even indexed characters upcased and odd index characters lower cased
   - key point, spaces are included in the character count
AL:
  - map the chars
    - index.even? upcase : downcase
    - join
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class WeirdStringCaseMyFirstSolution < Minitest::Test

  def weirdcase string
    string.split.map do |str|
      str.chars.map.with_index do |char, idx|
        idx.even? ? char.upcase : char.downcase
      end.join
    end.join(' ')
  end

  def test_1
    # skip
    assert_equal('ThIs', weirdcase('this'))
  end
  
  def test_2
    # skip
    assert_equal('Is', weirdcase('is'))
  end
  
  def test_3
    # skip
    assert_equal('ThIs Is A TeSt', weirdcase('This is a test'))
  end

  def test_4
    # skip
    assert_equal('StRiNg', weirdcase('String'))
  end
  
  def test_5
    # skip
    assert_equal('WeIrD StRiNg CaSe', weirdcase('Weird string case'))
  end
  
end

class WeirdStringCaseCodewarsSolution < Minitest::Test

=begin
very clever, excellent though my solution is more understandable
so the developer grabs only word characters, 2 at a time, since
the first word character will be guaranteed to be an even index
we capitalize the two characters meaning the first character will
be upper case and the second lower case
=end

  def weirdcase string
    string.gsub(/(\w{1,2})/) { |s| $1.capitalize }
  end

  def test_1
    # skip
    assert_equal('ThIs', weirdcase('this'))
  end
  
  def test_2
    # skip
    assert_equal('Is', weirdcase('is'))
  end
  
  def test_3
    # skip
    assert_equal('ThIs Is A TeSt', weirdcase('This is a test'))
  end

  def test_4
    # skip
    assert_equal('StRiNg', weirdcase('String'))
  end
  
  def test_5
    # skip
    assert_equal('WeIrD StRiNg CaSe', weirdcase('Weird string case'))
  end
  
end