=begin
Inverting A Hash

(Level 7 Kata)

Summary
Given a Hash made up of keys and values, invert the hash by swapping them.

Examples
Given:

  { 'a' => 1,
    'b' => 2,
    'c' => 3 }

Return:

  { 1 => 'a',
    2 => 'b',
    3 => 'c' }



Given:

  { 'foo'   => 'bar',
    'hello' => 'world' }

Return:

  { 'bar'   => 'foo',
    'world' => 'hello' }
Notes
Keys and values may be of any type appropriate for use as a key.
All hashes provided as input will have unique values, so the inversion is involutive.
In other words, do not worry about identical values stored under different keys.
Ruby has a built-in Hash#invert. This is awesome, but is disabled for this kata
so you can solve it yourself.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class InvertingAHashManual < Minitest::Test

=begin
I: hash
O: hash
AL:
  - create an empty hash
  - cycle through each element of the current hash
  - populate the new hash with hash[value] = key
  - return the new hash
=end

  def invert_hash(hash)
    h = {}
    hash.each do |k, v|
      h[v] = k
    end
    h
  end

  def test_1
    # skip
    input = { 'hello' => 'world' }
    expected = { 'world' => 'hello' }
    assert_equal(expected, invert_hash(input))
  end

  def test_2
    # skip
    input = { 'a' =>  1, 'b' => 2, 'c' => 3  }
    expected = {  1  => 'a', 2 => 'b', 3 => 'c' }
    assert_equal(expected, invert_hash(input))
  end

end

class InvertingAHashSecondSolution < Minitest::Test

  def invert_hash(hash)
    hash.to_a.map { |arr| arr.reverse }.to_h
  end

  def test_1
    # skip
    input = { 'hello' => 'world' }
    expected = { 'world' => 'hello' }
    assert_equal(expected, invert_hash(input))
  end

  def test_2
    # skip
    input = { 'a' =>  1, 'b' => 2, 'c' => 3  }
    expected = {  1  => 'a', 2 => 'b', 3 => 'c' }
    assert_equal(expected, invert_hash(input))
  end

end

class InvertingAHashCodewarsGood < Minitest::Test

=begin
I had the same idea but this solution showed a greater
knowledge of how #map works on hashes.  When #map is called
on a hash the block variable is an array [key, value], further
calling #map on a hash returns an array of arrays =>
h = { 'a' =>  1, 'b' => 2, 'c' => 3  }
h.map(&:reverse) = [[1, "a"], [2, "b"], [3, "c"]]
=end

  def invert_hash(hash)
    hash.map(&:reverse).to_h
  end

  def test_1
    # skip
    input = { 'hello' => 'world' }
    expected = { 'world' => 'hello' }
    assert_equal(expected, invert_hash(input))
  end

  def test_2
    # skip
    input = { 'a' =>  1, 'b' => 2, 'c' => 3  }
    expected = {  1  => 'a', 2 => 'b', 3 => 'c' }
    assert_equal(expected, invert_hash(input))
  end

end
