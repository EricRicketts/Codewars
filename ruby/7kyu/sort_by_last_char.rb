=begin
Sort Array by last character

(Level 7 Kata)

Write a function sortMe (sort_me in Python) to sort a given array by last character of the element.

Element can be an integer or a string.

Example:
sortMe(['acvd','bcc']) => ['bcc','acvd']
As the last characters of strings are 'd' and 'c'. As, 'c' comes before 'd', sorting by last character will give ['bcc', 'acvd']

If two elements don't differ in the last character, that then they should be sorted by the order they come in the array.

AL:
  - cycle through the array
    - convert each element to be sorted into a string
    - get the last element of the string
    - if the last character does not produce a sort then sort by the index
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SortByLastCharMyFirstSolution < Minitest::Test

  def sortMe(arr)
    arr.sort_by { |el| el.to_s[-1] }   
  end

  def test_1
    # skip
    assert_equal(['bcc','acvd'], sortMe(['acvd','bcc']))
  end

  def test_2
    # skip
    assert_equal(["13", 14, "asdf", "asdf"], sortMe(["asdf", "asdf", 14, "13"]))
  end

end