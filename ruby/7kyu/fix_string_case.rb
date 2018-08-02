=begin
Fix String Case

(Level 7 Kata)

In this Kata, you will be given a string that may have mixed uppercase and lowercase letters
and your task is to convert that string to either lowercase only or uppercase only based on:

make as few changes as possible.
if the string contains equal number of uppercase and lowercase letters, convert the string to lowercase.
For example:

solve("coDe") = "code". Lowercase characters > uppercase. Change only the "D" to lowercase.
solve("CODe") = "CODE". Uppercase characters > lowecase. Change only the "e" to uppercase.
solve("coDE") = "code". Upper == lowercase. Change all to lowercase.
More examples in test cases. Good luck!

AL:
  - compare the number of upper to lower
    - if upper > lower cycle through the string if case is lower make upper
  - compare  
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class FixStringCaseMyFirstSolution < Minitest::Test

  def solve(s)
    upper, lower = s.chars.partition {|char| char.match?(/[[:upper:]]/) }
    change_to_upper = upper.size > lower.size
    change_to_upper ? s.gsub(/([[:lower:]])/) { $1.upcase } :
      s.gsub(/([[:upper:]])/) { $1.downcase }
  end

  def test_1
    # skip
    assert_equal("code", solve("code"))
  end

  def test_2
    # skip
    assert_equal("CODE", solve("CODe"))          
  end

  def test_3
    # skip
    assert_equal("code", solve("COde"))          
  end

  def test_4
    # skip
    assert_equal("code", solve("Code"))          
  end

end

class FixStringCaseCodewarsSolution < Minitest::Test
=begin
what got me is changing as few letters as possible, I thought downcase
and upcase did a global change, no they just invert on the characters
that needed to be inverted
=end

  def solve(s)
    s.count('A-Z') > s.count('a-z') ? s.upcase : s.downcase
  end

  def test_1
    # skip
    assert_equal("code", solve("code"))
  end

  def test_2
    # skip
    assert_equal("CODE", solve("CODe"))          
  end

  def test_3
    # skip
    assert_equal("code", solve("COde"))          
  end

  def test_4
    # skip
    assert_equal("code", solve("Code"))          
  end

end

