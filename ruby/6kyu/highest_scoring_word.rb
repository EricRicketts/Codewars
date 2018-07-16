=begin
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to it's position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.

describe "Basic Tests" do
  it "should pass basic tests" do
    Test.assert_equals(high('man i need a taxi up to ubud'), 'taxi')
    Test.assert_equals(high('what time are we climbing up the volcano'), 'volcano')
    Test.assert_equals(high('take me to semynak'), 'semynak')
    Test.assert_equals(high('aa b'), 'aa')
  end
end

In: string separated by spaces
out: string

AL:
  array of letters ['a'..'z']
  split to an array of words
  map this array for each word
    split each word into characters
      sum of the letter values by calling the index value for each letter
      return the sum of characters
  take the max value of the new array
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class HighestScoringWord < Minitest::Test

  def high(x)
    letters = ('a'..'z').to_a.zip(1..26).to_h
    hsh = {}
    x.split.each do |word|
      value = word.chars.inject(0) { |sum, char| sum += letters[char] }
      hsh[word] = value
    end
    max_value = 0
    max_key = ''
    hsh.each do |key, value|
      if value > max_value
        max_value = value
        max_key = key
      end
    end
    max_key
  end

  def test_1
    # skip
    assert_equal("taxi", high('man i need a taxi up to ubud'))
  end

  def test_2
    # skip
    assert_equal("volcano", high('what time are we climbing up the volcano'))
  end

  def test_3
    # skip
    assert_equal("semynak", high('take me to semynak'))
  end

  def test_4
    # skip
    assert_equal("aa", high('aa b'))
  end

end

class HighestScoringWordManual < Minitest::Test

  def high(x)
    letters = ('a'..'z').to_a.zip(1..26).to_h
    max_str = ''
    max_value = 0
    x.split.each do |word|
      current_value = word.chars.inject(0) { |sum, char| sum += letters[char] }
      if current_value > max_value
        max_value = current_value
        max_str = word
      end
    end
    max_str
  end

  def test_1
    # skip
    assert_equal("taxi", high('man i need a taxi up to ubud'))
  end

  def test_2
    # skip
    assert_equal("volcano", high('what time are we climbing up the volcano'))
  end

  def test_3
    # skip
    assert_equal("semynak", high('take me to semynak'))
  end

  def test_4
    # skip
    assert_equal("aa", high('aa b'))
  end

end

class HighestScoringWordCodeWarsModification < Minitest::Test

  def high(x)
    letters = ('a'..'z').to_a.zip(1..26).to_h
    x.split.max_by do |word|
      word.chars.inject(0) { |sum, char| sum += letters[char]}
    end
  end

  def test_1
    # skip
    assert_equal("taxi", high('man i need a taxi up to ubud'))
  end

  def test_2
    # skip
    assert_equal("volcano", high('what time are we climbing up the volcano'))
  end

  def test_3
    # skip
    assert_equal("semynak", high('take me to semynak'))
  end

  def test_4
    # skip
    assert_equal("aa", high('aa b'))
  end

end

class HighestScoringWordCodeWarsBestSolution < Minitest::Test

  def high(x)
    x.split.max_by { |word| word_score(word)}
  end

  def word_score(word)
    # 96 is special because it is the ordinal number before the
    # character `a` which is 97, so in this addition `a` has value 1
    word.chars.inject(0) { |sum, char| sum += (char.ord - 96) }
  end

  def test_1
    # skip
    assert_equal("taxi", high('man i need a taxi up to ubud'))
  end

  def test_2
    # skip
    assert_equal("volcano", high('what time are we climbing up the volcano'))
  end

  def test_3
    # skip
    assert_equal("semynak", high('take me to semynak'))
  end

  def test_4
    # skip
    assert_equal("aa", high('aa b'))
  end

end
