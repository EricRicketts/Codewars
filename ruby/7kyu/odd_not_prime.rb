=begin
Odd Not Prime

(Level 7 Kata)

For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1

Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

I: a number which is the endpoint of the desired number range, problem statement says this must be a positive integer
   so the number must be >= 1
0: starting from 1 going to up and including the number, the number will not exceed 10_000
AL:
  - declare a method with one argument which is a number
  - define a RANGE (1..number)
    - RANGE.select
      - if the number IS ODD AND NOT PRIME
        - define a method not_prime which takes a number
          - if the number is divisible by any number from 2 to number - 1
            then it is not prime => (2...n).any?

=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class OddNotPrimeMyFirstSolution < Minitest::Test

  def odd_not_prime(num)
    (1..num).select { |number| number.odd? && is_not_prime?(number) }.count
  end

  def is_not_prime?(number)
    return true if number == 1
    (2...number).any? { |n| (number % n).zero? }
  end

  def test_1
    # skip
    assert_equal(3, odd_not_prime(15))
  end
  
  def test_2
    # skip
    assert_equal(10, odd_not_prime(48))
  end
  
  def test_3
    # skip
    assert_equal(20, odd_not_prime(82))
  end
  
end