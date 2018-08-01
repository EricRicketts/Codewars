=begin
Sum Of A Beach

(Level 7 Kata)

Beaches are filled with sand, water, fish, and sun. Given a string,
calculate how many times the words "Sand", "Water", "Fish", and "Sun"
appear without overlapping (regardless of the case).

Examples
sum_of_a_beach("WAtErSlIde")                    ==>  1
sum_of_a_beach("GolDeNSanDyWateRyBeaChSuNN")    ==>  3
sum_of_a_beach("gOfIshsunesunFiSh")             ==>  4
sum_of_a_beach("cItYTowNcARShoW")               ==>  0


Test.assert_equals(sum_of_a_beach("SanD"), 1)
Test.assert_equals(sum_of_a_beach("sunshine"), 1)
Test.assert_equals(sum_of_a_beach("sunsunsunsun"), 4)
Test.assert_equals(sum_of_a_beach("123FISH321"), 1)

=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SumOfABeachMyFirstSolution < Minitest::Test

  def sum_of_a_beach(beach)
    regex = /sand|water|fish|sun/
    beach.downcase.scan(regex).count
  end

  def test_1
    # skip
    assert_equal(1, sum_of_a_beach("SanD"))
  end
  
  def test_2
    # skip
    assert_equal(1, sum_of_a_beach("sunshine"))
  end
  
  def test_3
    # skip
    assert_equal(4, sum_of_a_beach("sunsunsunsun"))
  end
  
  def test_4
    # skip
    assert_equal(1, sum_of_a_beach("123FISH321"))
  end
  
  def test_5
    # skip
    assert_equal(1, sum_of_a_beach("WAtErSlIde"))
  end
  
  def test_6
    # skip
    assert_equal(3, sum_of_a_beach("GolDeNSanDyWateRyBeaChSuNN"))
  end
  
  def test_7
    # skip
    assert_equal(4, sum_of_a_beach("gOfIshsunesunFiSh"))
  end
  
  def test_8
    # skip
    assert_equal(0, sum_of_a_beach("cItYTowNcARShoW"))
  end
  
end

class SumOfABeachCodewarsSolution < Minitest::Test

# no need to downcase with i suffix on regex

  def sum_of_a_beach(beach)
    regex = /sand|water|fish|sun/i
    beach.scan(regex).count
  end

  def test_1
    # skip
    assert_equal(1, sum_of_a_beach("SanD"))
  end
  
  def test_2
    # skip
    assert_equal(1, sum_of_a_beach("sunshine"))
  end
  
  def test_3
    # skip
    assert_equal(4, sum_of_a_beach("sunsunsunsun"))
  end
  
  def test_4
    # skip
    assert_equal(1, sum_of_a_beach("123FISH321"))
  end
  
  def test_5
    # skip
    assert_equal(1, sum_of_a_beach("WAtErSlIde"))
  end
  
  def test_6
    # skip
    assert_equal(3, sum_of_a_beach("GolDeNSanDyWateRyBeaChSuNN"))
  end
  
  def test_7
    # skip
    assert_equal(4, sum_of_a_beach("gOfIshsunesunFiSh"))
  end
  
  def test_8
    # skip
    assert_equal(0, sum_of_a_beach("cItYTowNcARShoW"))
  end
  
end