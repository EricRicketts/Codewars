require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Introduction
  The wave (known as the Mexican wave in the English-speaking world outside North America)
  is an example of metachronal rhythm achieved in a packed stadium when successive groups
  of spectators briefly stand, yell, and raise their arms. Immediately upon stretching to
  full height, the spectator returns to the usual seated position. The result is a wave of
  standing spectators that travels through the crowd, even though individual spectators
  never move away from their seats. In many large arenas the crowd is seated in a contiguous
  circuit all the way around the sport field, and so the wave is able to travel continuously
  around the arena; in discontiguous seating arrangements, the wave can instead reflect back
  and forth through the crowd. When the gap in seating is narrow, the wave can sometimes pass
  through it. Usually only one wave crest will be present at any given time in an arena,
  although simultaneous, counter-rotating waves have been produced.

  In this simple Kata your task is to create a function that turns a string into a Mexican Wave.
  You will be passed a string and you must return that string in an array where an uppercase
  letter is a person standing up.

Rules
  1.  The input string will always be lower case but maybe empty.

  2.  If the character in the string is whitespace then pass over it as if it was an empty seat.

Example
wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

=end

class MexicanWave < Minitest::Test

=begin
I: string
O: array of strings
AL:
  - convert string to an array of chars
  - map the chars with index
    - if the char is an alpha
      - str[0..index] + char.upcase + str[index..-1]
=end

  def wave(str)
    str.chars.map.with_index do |char, idx|
      next if char.match?(/[[:space:]]/)
      char = char.upcase if char.match?(/[[:alpha:]]/)
        str[0...idx] + char + str[idx + 1..-1]
    end.compact
  end

  def test_1
    # skip
    expected = ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
    assert_equal(expected, wave("hello"))
  end

  def test_2
    # skip
    expected = ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
    assert_equal(expected, wave("codewars"))
  end

  def test_3
    # skip
    expected = []
    assert_equal(expected, wave(""))
  end

  def test_4
    # skip
    expected = ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
    assert_equal(expected, wave("two words"))
  end

  def test_5
    # skip
    expected = [" Gap ", " gAp ", " gaP "]
    assert_equal(expected, wave(" gap "))
  end

end

class MexicanWaveCodeWarsSolution < Minitest::Test

=begin
$` - string before the match string
$& - match string
$' - string after the match string
=end

  def wave(str)
    [].tap { |result| str.scan(/\w/) { result << $` + $&.upcase + $'} }
  end

  def test_1
    # skip
    expected = ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
    assert_equal(expected, wave("hello"))
  end

  def test_2
    # skip
    expected = ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
    assert_equal(expected, wave("codewars"))
  end

  def test_3
    # skip
    expected = []
    assert_equal(expected, wave(""))
  end

  def test_4
    # skip
    expected = ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
    assert_equal(expected, wave("two words"))
  end

  def test_5
    # skip
    expected = [" Gap ", " gAp ", " gaP "]
    assert_equal(expected, wave(" gap "))
  end

end
