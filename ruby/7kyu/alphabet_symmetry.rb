=begin
Alphabet Symmetry

(Level 7 Kata)

Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2.
In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy
the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions
in the alphabet for each word. For example, solve(["abode","ABc","xyzD"]) = [4,3,1]. See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

I: an array of strings, upper or lower case
    - assumptions no spaces in the strings
    - only alphabetic characters
0: an array of numbers where the number is a count of letters which have their
   corresponding position in the alphabet
AL:
  - define an Array LETTERS 'a'..'z', now each index corresponds to the letters
    position in the alphabet
  - input_array.map
    - each string.chars.select.with_index where current index == LETTERS.index(current letter)
    - then count the selected array
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class AlphabetSymmetryMyFirstSolution < Minitest::Test

  LETTERS = ('a'..'z').to_a

  def solve(arr)
    arr.map do |word|
      word.chars.select.with_index do |char, idx|
        idx == LETTERS.index(char.downcase) 
      end.count
    end
  end 

  def test_1
    # skip
    assert_equal([4, 3, 1], solve(%W(abode ABc xyzD)))
  end
  
  def test_2
    # skip
    assert_equal([4, 3, 0], solve(["abide","ABc","xyz"]))
  end
  
  def test_3
    # skip
    assert_equal([6, 5, 7], solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]))
  end
  
  def test_4
    # skip
    assert_equal([1, 3, 1, 3], solve(["encode","abc","xyzD","ABmD"]))
  end
  
end

class AlphabetSymmetryCodeWarsSolution < Minitest::Test

=begin
really clever solution
take the string "adobe", we run s.downcase.each_char.zip('a'..'z')
and we get [["a", "a"], ["b", "b"], ["o", "c"], ["d", "d"], ["e", "e"]]

I did not know that, zip stopped at the last character of 'adobde' count
can take a block so the truthiness of the return value of the block determines
the count
=end

  def solve(arr)
    arr.map { |s| s.downcase.each_char.zip('a'..'z').count{ |a, b| a == b } }
  end 

  def test_1
    # skip
    assert_equal([4, 3, 1], solve(%W(abode ABc xyzD)))
  end
  
  def test_2
    # skip
    assert_equal([4, 3, 0], solve(["abide","ABc","xyz"]))
  end
  
  def test_3
    # skip
    assert_equal([6, 5, 7], solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]))
  end
  
  def test_4
    # skip
    assert_equal([1, 3, 1, 3], solve(["encode","abc","xyzD","ABmD"]))
  end
  
end