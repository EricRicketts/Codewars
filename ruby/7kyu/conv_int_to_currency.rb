require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class ConvIntToCurrency < Minitest::Test

  def to_currency(number)
    return number.to_s if number.to_s.chars.length < 4
    num_str = number.to_s.chars.reverse
    num_str.map.with_index do |char, i|
      ((i+1)%3).zero? && i != num_str.length - 1 ? ",#{char}" : char
    end.reverse.join
  end

  def test_one
    assert_equal('6', to_currency(6))
  end

  def test_two
    assert_equal('56', to_currency(56))
  end
  
  def test_three
    assert_equal('456', to_currency(456))
  end

  def test_four
    assert_equal('3,456', to_currency(3456))
  end
  
  def test_five
    assert_equal('23,456', to_currency(23456))
  end
  
  def test_six
    assert_equal('123,456', to_currency(123456))
  end
    
  def test_seven
    assert_equal('7,123,456', to_currency(7123456))
  end
  
  def test_eight
    assert_equal('78,123,456', to_currency(78123456))
  end
  
  def test_nine
    assert_equal('789,123,456', to_currency(789123456))
  end
  
  def test_ten
    assert_equal('1,789,123,456', to_currency(1789123456))
  end
  
  def test_eleven
    assert_equal('12,789,123,456', to_currency(12789123456))
  end
  
  def test_twelve
    assert_equal('123,789,123,456', to_currency(123789123456))
  end
  
end

class ConvIntToCurrencyBestSolution < Minitest::Test

  def to_currency(number)
    # this is the most highly regarded solution, I was on the
    # right track originally by using regular expressions.  So
    # we reverse the string so we can start counting digits from
    # the least signifcant digit.  #join works because it only
    # inserts its string argument between two or more array elements.
    # Once the "," are inserted we reverse the string again to get
    # the correct number
    number.to_s.reverse.scan(/\d{1,3}/).join(',').reverse
  end

  def test_one
    assert_equal('6', to_currency(6))
  end

  def test_two
    assert_equal('56', to_currency(56))
  end
  
  def test_three
    assert_equal('456', to_currency(456))
  end

  def test_four
    assert_equal('3,456', to_currency(3456))
  end
  
  def test_five
    assert_equal('23,456', to_currency(23456))
  end
  
  def test_six
    assert_equal('123,456', to_currency(123456))
  end
    
  def test_seven
    assert_equal('7,123,456', to_currency(7123456))
  end
  
  def test_eight
    assert_equal('78,123,456', to_currency(78123456))
  end
  
  def test_nine
    assert_equal('789,123,456', to_currency(789123456))
  end
  
  def test_ten
    assert_equal('1,789,123,456', to_currency(1789123456))
  end
  
  def test_eleven
    assert_equal('12,789,123,456', to_currency(12789123456))
  end
  
  def test_twelve
    assert_equal('123,789,123,456', to_currency(123789123456))
  end
    
end