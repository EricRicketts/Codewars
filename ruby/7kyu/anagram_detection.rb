require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
An anagram is the result of rearranging the letters of a word to produce a new word (see wikipedia).

Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are anagrams of theeach other; return false otherwise.

Examples
"foefet" is an anagram of "toffee"

"Buckethead" is an anagram of "DeathCubeK"
=end

def is_anagram(test, original)
  original.downcase.chars.sort == test.downcase.chars.sort
end

class AnagramDetection < Minitest::Test

  def test_case_1
    assert(is_anagram('Creative', 'Reactive'), 'The word Creative is an anagram of Reactive')
  end

  def test_case_2
    assert(is_anagram("foefet", "toffee"), 'The word foefet is an anagram of toffee')   
  end

  def test_case_3
    assert(is_anagram("Buckethead", "DeathCubeK"), 'The word Buckethead is an anagram of DeathCubeK')
  end

  def test_case_4
    assert(is_anagram("Twoo", "WooT"), 'The word Twoo is an anagram of WooT')
  end

  def test_case_5
    refute(is_anagram("dumble", "bumble"), 'Characters do not match for test case dumble, bumble')
  end

  def test_case_6
    refute(is_anagram("ound", "round"), 'Missing characters for test case ound, round')    
  end

end