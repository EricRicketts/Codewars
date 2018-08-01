=begin
Ones And Zeros

(Level 7 Kata)

Given an array of one's and zero's convert the equivalent binary value to an integer.

Eg: [0, 0, 0, 1] is treated as 0001 which is the binary representation of 1.

Examples:

Testing: [0, 0, 0, 1] ==> 1
Testing: [0, 0, 1, 0] ==> 2
Testing: [0, 1, 0, 1] ==> 5
Testing: [1, 0, 0, 1] ==> 9
Testing: [0, 0, 1, 0] ==> 2
Testing: [0, 1, 1, 0] ==> 6
Testing: [1, 1, 1, 1] ==> 15
Testing: [1, 0, 1, 1] ==> 11
However, the arrays can have varying lengths, not just limited to 4.

Test.describe("Example tests") do
Test.assert_equals(binary_array_to_number([0,0,0,1]), 1)
Test.assert_equals(binary_array_to_number([0,0,1,0]), 2)
Test.assert_equals(binary_array_to_number([1,1,1,1]), 15)
Test.assert_equals(binary_array_to_number([0,1,1,0]), 6)
end

def binary_array_to_number(arr)
  # your code here
end
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class OnesAndZerosMyFirstSolution < Minitest::Test

  def binary_array_to_number(arr)
    # can use sum instead of reduce but Codewars did not recognize sum method
    arr.reverse.map.with_index { |b, idx| b*2**(idx) }.reduce(&:+)
  end

  def test_1
    # skip
    assert_equal(1, binary_array_to_number([0,0,0,1]))
  end

  def test_2
    # skip
    assert_equal(2, binary_array_to_number([0,0,1,0]))
  end

  def test_3
    # skip
    assert_equal(15, binary_array_to_number([1,1,1,1]))
  end

  def test_4
    # skip
    assert_equal(6, binary_array_to_number([0,1,1,0]))
  end

end

class OnesAndZerosMyCodeWarsSolution < Minitest::Test
=begin
this is very clever, by default join is join('') so
all of the 0's or 1's are joined together in a string
and then let Ruby do the binary interpretation by calling
to_i(base) which in this case is to_i(2) so it interprets
the number as binary and converts to a base 10.
=end

  def binary_array_to_number(arr)
    arr.join.to_i(2)
  end

  def test_1
    # skip
    assert_equal(1, binary_array_to_number([0,0,0,1]))
  end

  def test_2
    # skip
    assert_equal(2, binary_array_to_number([0,0,1,0]))
  end

  def test_3
    # skip
    assert_equal(15, binary_array_to_number([1,1,1,1]))
  end

  def test_4
    # skip
    assert_equal(6, binary_array_to_number([0,1,1,0]))
  end

end

class OnesAndZerosAnotherCodeWarsSolution < Minitest::Test
=begin
the algorithm, take 111 or 7
sum = 0 to begin with 
1st iteration:
  - sum = 2*0 + 1 = 1
2nd iteration:
  - sum = 2*1 + 1 = 3
3rd iteration
  - sum = 2*3 + 1 = 7

=end

  def binary_array_to_number(arr)
    arr.inject(0) { |sum, n| 2*sum + n }
  end

  def test_1
    # skip
    assert_equal(1, binary_array_to_number([0,0,0,1]))
  end

  def test_2
    # skip
    assert_equal(2, binary_array_to_number([0,0,1,0]))
  end

  def test_3
    # skip
    assert_equal(15, binary_array_to_number([1,1,1,1]))
  end

  def test_4
    # skip
    assert_equal(6, binary_array_to_number([0,1,1,0]))
  end

end
