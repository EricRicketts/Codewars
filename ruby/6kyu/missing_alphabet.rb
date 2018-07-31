require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
In this Kata you have to create a function,named insertMissingLetters,that takes in a string and outputs the same string processed in a particular way.

The function should insert only after the first occurence of each character of the input string, all the alphabet letters that:

-are NOT in the original string
-come after the letter of the string you are processing

Each added letter should be in uppercase, the letters of the original string will always be in lowercase.

Example:

input: "holly"

missing letters: "a,b,c,d,e,f,g,i,j,k,m,n,p,q,r,s,t,u,v,w,x,z"

output: "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"

You don't need to validate input, the input string will always contain a certain amount of lowercase letters (min 1 / max 50).

insert_missing_letters("holly") == "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
insert_missing_letters("hello") == "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
insert_missing_letters("fred") == "fGHIJKLMNOPQSTUVWXYZrSTUVWXYZeGHIJKLMNOPQSTUVWXYZdGHIJKLMNOPQSTUVWXYZ"
=end

class MissingAlphabet < Minitest::Test

  def insert_missing_letters(string)
    missing_letters = define_missing_letters(string)
    string.chars.inject('') do |str, char|
      str.include?(char) ? str += char : str += add_letters(char, missing_letters)
    end  
  end

  def add_letters(char, missing_letters)
    next_letter = missing_letters.find { |letter| letter.ord > char.upcase.ord }
    return char if next_letter == missing_letters[-1]
    next_index = missing_letters.index(next_letter)
    char + missing_letters[next_index..-2].join
  end

  def define_missing_letters(string)
    final_ord = "Z".ord + 1
    missing_letters = ('A'..'Z').to_a + [final_ord.chr]
    unique_chars = string.chars.map(&:upcase).uniq
    unique_chars.each do |char|
      missing_letters.delete(char)
    end
    missing_letters
  end

  def test_1
    # skip
    expected = "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
    assert_equal(expected, insert_missing_letters("holly"))
  end

  def test_2
    # skip
    expected = "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("hello"))
  end

  def test_3
    # skip
    expected = "fGHIJKLMNOPQSTUVWXYZrSTUVWXYZeGHIJKLMNOPQSTUVWXYZdGHIJKLMNOPQSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("fred")) 
  end

  def test_4
    # skip
    expected = "eIJKLMNOPQRSTUVWXYZfIJKLMNOPQRSTUVWXYZgIJKLMNOPQRSTUVWXYZhIJKLMNOPQRSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("efgh"))
  end

  def test_5
    # skip
    expected = "abcdefghijklmnopqrstuvwxyz"
    assert_equal(expected, insert_missing_letters(expected))
  end

  def test_6
    # skip
    expected = "z"
    assert_equal(expected, insert_missing_letters("z"))
  end

  def test_7
    # skip
    input = "hellllllllllllooooo"
    expected = "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZllllllllllloPQRSTUVWXYZoooo"
    assert_equal(expected, insert_missing_letters(input))
  end

  def test_8
    # skip
    input = "xpixax"
    expected = "xYZpQRSTUVWYZiJKLMNOQRSTUVWYZxaBCDEFGHJKLMNOQRSTUVWYZx"
    assert_equal(expected, insert_missing_letters(input))
  end
  
  def test_9
    # skip
    input = "xpixax"
    expected = "xYZpQRSTUVWYZiJKLMNOQRSTUVWYZxaBCDEFGHJKLMNOQRSTUVWYZx"
    assert_equal(expected, insert_missing_letters(input))
  end

  def test_10
    # skip
    input = "exvalszvtvqfrvdcsasiishqtznlscnzpkjjykvuv"
    expected = "eGMOWxvWaBGMOWlMOWsWzvtWvqWfGMOWrWvdGMOWcGMOWsasiMOWishMOWqtznOWlscnzpWkMOWjMOWjykvuWv"
    assert_equal(expected, insert_missing_letters(input))
  end
  
end