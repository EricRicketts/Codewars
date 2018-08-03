=begin
Sum Of Odd Numbers

(Level 7 Kata)

Given the triangle of consecutive odd numbers:

             1
          3     5
       7     9    11
   13    15    17    19
21    23    25    27    29
...
Calculate the row sums of this triangle from the row index (starting at index 1) e.g.:

row_sum_odd_numbers(1); # 1
row_sum_odd_numbers(2); # 3 + 5 = 8

I: an integer, assume it will be positive
O: the sum of the appropriate row of odd integers
  - we see for row 2 we sum 3 + 5 notice the row has the same
    number of odd integers as the row number
AL:
  - if we are given a row number then that is how many odd integers
    are in that row
  - if the number is 3 then we have 3 + 2 + 1 = 6 odd numbers
  - start at 0 odd number is 2n + 1
  - 1 => (1..2), 2 => (1..6), 3 => (1..12)
  - pattern is (1..n*(n+1)).step(2) to get odd numbers
  - then with an array of odd numbers, slice backwards to get the required numbers
    arr[-n..-1] starts from the last number and moves backwards n-1 locations for a total of n numbers
  - then just sum up these numbers
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SumOfOddNumbersMyFirstSolution < Minitest::Test

  def row_sum_odd_numbers(n)
    (1..n*(n+1)).step(2).to_a[-n..-1].reduce(&:+)
  end  

  def test_1
    # skip
    assert_equal(1, row_sum_odd_numbers(1))
  end
  
  def test_2
    # skip
    assert_equal(8, row_sum_odd_numbers(2))
  end
  
  def test_3
    # skip
    assert_equal(2197, row_sum_odd_numbers(13))
  end
  
  def test_4
    # skip
    assert_equal(6859, row_sum_odd_numbers(19))
  end
  
  def test_5
    # skip
    assert_equal(68921, row_sum_odd_numbers(41))
  end
  
end

class SumOfOddNumbersCodeWarsSolution < Minitest::Test

  def row_sum_odd_numbers(n)
    n**3
  end  

  def test_1
    # skip
    assert_equal(1, row_sum_odd_numbers(1))
  end
  
  def test_2
    # skip
    assert_equal(8, row_sum_odd_numbers(2))
  end
  
  def test_3
    # skip
    assert_equal(2197, row_sum_odd_numbers(13))
  end
  
  def test_4
    # skip
    assert_equal(6859, row_sum_odd_numbers(19))
  end
  
  def test_5
    # skip
    assert_equal(68921, row_sum_odd_numbers(41))
  end
  
end

class SumOfOddNumbersAnotherCodeWarsSolution < Minitest::Test

  def row_sum_odd_numbers(n)
    start = n * n - n + 1 
    finish = start + 2 * n
    (start...finish).step(2).reduce(:+)
  end  

  def test_1
    # skip
    assert_equal(1, row_sum_odd_numbers(1))
  end
  
  def test_2
    # skip
    assert_equal(8, row_sum_odd_numbers(2))
  end
  
  def test_3
    # skip
    assert_equal(2197, row_sum_odd_numbers(13))
  end
  
  def test_4
    # skip
    assert_equal(6859, row_sum_odd_numbers(19))
  end
  
  def test_5
    # skip
    assert_equal(68921, row_sum_odd_numbers(41))
  end
  
end

