=begin
Artlessly stolen and adapted from Hackerrank.

Kara Danvers is new to CodeWars, and eager to climb up in the ranks.
We want to determine Kara's rank as she progresses up the leaderboard.

This kata uses Dense Ranking, so any identical scores count as the same rank
(e.g, a scoreboard of [100, 97, 97, 90, 82, 80, 72, 72, 60] corresponds with
rankings of [1, 2, 2, 3, 4, 5, 6, 6, 7]

You are given an array, scores, of leaderboard scores, descending, and another array,
kara, representing Kara's Codewars score over time, ascending. Your function should
return an array with each item corresponding to the rank of Kara's current score on the leaderboard.

Note: This kata's performance requirements are significantly steeper than the Hackerrank
version. Some arrays will contain millions of elements; optimize your code so you don't time out.
If you're timing out before 200 tests are completed, you've likely got the wrong code complexity.
If you're timing out around 274 tests (there are 278), you likely need to make some tweaks to how you're handling the arrays.

Examples:
scores = [100, 90, 90, 80];
kara   = [70, 80, 105];

Should return: [4, 3, 1]
scores = [982, 490, 339, 180]
kara   = [180, 250, 721, 2500]

Should return: [4, 4, 2, 1]
scores = [1982, 490, 339, 180]
kara   = [180, 250, 721, 880]

Should return: [4, 4, 2, 2]

describe "Basic tests" do
  Test.assert_equals(leaderboard_climb([100, 90, 90, 80], [70, 80, 105]), [4, 3, 1])
  Test.assert_equals(leaderboard_climb([982, 490, 339, 180], [180, 250, 721, 2500]), [4, 4, 2, 1])
  Test.assert_equals(leaderboard_climb([1982, 490, 339, 180], [180, 250, 721, 880]), [4, 4, 2, 2])
end

=end

=begin

# code takes too long to run, 278 tests are supposed to be
# run and I only get through 78.

# I: 2 arrays, first is leaderboard scores, second is Kara's scores
# O: an array of rankings for low to high (bigger number to lower number)
# AL:
#   - the leaderboard scores need to be partitioned into some kind of ranges
#     - first we need a new array which has unique leaderboard scores
#     - now iterate through the array and create ranges based on adjacent values
#     in the array.  For instance [100, 90, 80] will have two ranges [(90..100), (80..90)]
#     - now make a hash of the ranges with the ranges as keys and their values having an integer
#     value, so in the above example we would have (91..100) => 2, (81..90) => 3
#   - then we need to iterate map each of Kara's score into one of the ranges
#     - for each of Kara's score we have three conditions
#       if the score is > max value we give it 1
#       if the score is < min value we give it largest_range + 1
#       otherwise we find the range it is included in
#       once we find the range we get the value for that range

=end
require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ClimbingTheLeaderboardFirstAttempt < Minitest::Test

  def leaderboard_climb(scores, kara)
    hsh = {}
    scores = scores.uniq
    max_value = scores.max
    min_value = scores.min
    arr_of_ranges = scores.each_cons(2).map.with_index do |arr, idx|
      arr = arr.reverse
      if idx.zero?
        (arr.first..arr.last)
      else
        (arr.first..arr.last-1)
      end
    end
    largest_range = arr_of_ranges.size + 1
    count = 0
    2.upto(largest_range) do |n|
      hsh[arr_of_ranges[count]] = n
      count += 1
    end
    kara.map do |score|
      if score >= max_value
        1
      elsif score < min_value
        largest_range + 1
      else
        range = hsh.keys.find { |score_range| score_range.include?(score)}
        hsh[range]
      end
    end
  end

  def test_1
    # skip
    assert_equal([4, 3, 1], leaderboard_climb([100, 90, 90, 80], [70, 80, 105]))
  end

  def test_2
    # skip
    assert_equal([4, 4, 2, 1], leaderboard_climb([982, 490, 339, 180], [180, 250, 721, 2500]))
  end

  def test_3
    # skip
    assert_equal([4, 4, 2, 2], leaderboard_climb([1982, 490, 339, 180], [180, 250, 721, 880]))
  end

end

class ClimbingTheLeaderboardSecondAttempt < Minitest::Test

=begin

I: 2 arrays, first is leaderboard scores, second is Kara's scores
O: an array of rankings for low to high (bigger number to lower number)
AL:
  - we are guaranteed the scores are sorted in descending order, we do need to uniq scores array
    - also get the max and min values of the scores array
  - then we need to map with index the kara array into a list of different integers
    - for each item in the kara array
      - first check if >= max then assign 1
      - second check if < min then assign array.size + 1
      - else => example [100, 90, 80]
        - is < 100 && >= 90 || < 90 && >= 80; (90...100); (80...90)
        if in these rangs ranking is index + 1

# even though it was less code, this was twice as slow as my first attempt
=end

  def leaderboard_climb(scores, kara)
    scores = scores.uniq
    max_score, min_score = scores.max, scores.min
    low_range = scores.size + 1
    kara.map do |kara_score|
      case kara_score
      when (max_score..Float::INFINITY) then 1
      when (0...min_score) then low_range
      else search_for_score(scores, kara_score)
      end
    end
  end

  def search_for_score(scores, kara_score)
    scores.each_index.each_cons(2).with_index do |indices, idx|
      low_score, high_score = scores[indices.last], scores[indices.first]
      return idx + 2 if (low_score...high_score).include?(kara_score)
    end
  end

  def test_1
    # skip
    assert_equal([4, 3, 1], leaderboard_climb([100, 90, 90, 80], [70, 80, 105]))
  end

  def test_2
    # skip
    assert_equal([4, 4, 2, 1], leaderboard_climb([982, 490, 339, 180], [180, 250, 721, 2500]))
  end

  def test_3
    # skip
    assert_equal([4, 4, 2, 2], leaderboard_climb([1982, 490, 339, 180], [180, 250, 721, 880]))
  end

end

class ClimbingTheLeaderboardThirdAttempt < Minitest::Test

  def leaderboard_climb(scores, kara)
    scores = scores.uniq
    max_score, min_score = scores.first, scores.last
    low_range = scores.size + 1
    kara.map do |kara_score|
      case
      when kara_score >= max_score then 1
      when kara_score < min_score then low_range
      else search_for_score(scores, kara_score)
      end
    end
  end

  def search_for_score(scores, kara_score)
    last_idx = scores.size - 1
    scores.each.with_index do |score, idx|
      unless idx >= last_idx
        lower_bound = scores[idx + 1]
        upper_bound = score
        return idx + 2 if kara_score >= lower_bound && kara_score < upper_bound
      end
    end
  end  

  def test_1
    # skip
    assert_equal([4, 3, 1], leaderboard_climb([100, 90, 90, 80], [70, 80, 105]))
  end

  def test_2
    # skip
    assert_equal([4, 4, 2, 1], leaderboard_climb([982, 490, 339, 180], [180, 250, 721, 2500]))
  end

  def test_3
    # skip
    assert_equal([4, 4, 2, 2], leaderboard_climb([1982, 490, 339, 180], [180, 250, 721, 880]))
  end
  
end
