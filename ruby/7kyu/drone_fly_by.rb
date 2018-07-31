=begin
Drone Fly By

(Level 7 Kata)

The other day I saw an amazing video where a guy hacked some wifi controlled
lightbulbs by flying a drone past them. Brilliant.

In this kata we will recreate that stunt... sort of.

You will be given two strings: lamps and drone. lamps represents a row of lamps,
currently off, each represented by x. When these lamps are on, they should be represented by o.

The drone string represents the position of the drone T (any better suggestion for character??)
and its flight path up until this point =. The drone always flies left to right, and always
begins at the start of the row of lamps. Anywhere the drone has flown, including its current
position, will result in the lamp at that position switching on.

Return the resulting lamps string. See example tests for more clarity.

AL:
  - convert the strings to arrays
  - zip the arrays together
  - map the zipped array
    - if the second element is nil then take the first element
    - else conver the first element to 'o'
    - map the result to the first element
    - flatten
    - join
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class DroneFlyByMyFirstSolution < Minitest::Test
=begin
my algorithm shows a misunderstanding of how map works
the return value for the block will replace whatever the
current mapped object happens to be.

In my case the block variable is a two element array
of [light, path] which is a result of the zip operation
my block returns a string so this two element array
will be mapped into a string
=end

  def fly_by(lamps, drone)
    super_imposed = lamps.chars.zip(drone.chars)
    super_imposed.map do |light, path|
      path.nil? ? light : light = "o"
    end.join
  end

  def test_1
    # skip
    expected = 'ooooox'
    assert_equal(expected, fly_by('xxxxxx', '====T'))
  end

  def test_2
    # skip
    expected = 'oooxxxxxx'
    assert_equal(expected, fly_by('xxxxxxxxx', '==T'))
  end

  def test_3
    # skip
    expected = 'ooooooooooxxxxx'
    assert_equal(expected, fly_by('xxxxxxxxxxxxxxx', '=========T'))
  end

end

class DroneFlyByGoodCodeWarsSolution < Minitest::Test
=begin
very clever.  so where ever "===...T" is the 'x' will be
flipped to an 'o', so just create that many 'o's with the
drone string, concat with the current lamp string and slice
to the current length of the index string.  the concatenation
fills in 'x's behind the 'o's, so the slice operation gives
us the desired amount of 'x's beyond the 'o's.
=end

  def fly_by(lamps, drone)
    ('o' * drone.size + lamps)[0..lamps.size - 1]
  end

  def test_1
    # skip
    expected = 'ooooox'
    assert_equal(expected, fly_by('xxxxxx', '====T'))
  end

  def test_2
    # skip
    expected = 'oooxxxxxx'
    assert_equal(expected, fly_by('xxxxxxxxx', '==T'))
  end

  def test_3
    # skip
    expected = 'ooooooooooxxxxx'
    assert_equal(expected, fly_by('xxxxxxxxxxxxxxx', '=========T'))
  end

end