require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Missing Alphabret

(Level 6 Kata)

In this Kata you have to create a function,named insertMissingLetters,that takes in a string and outputs the same string processed in a particular way.

The function should insert only after the first occurence of each character of the input string, all the alphabet letters that:

-are NOT in the original string
-come after the letter of the string you are processing

Each added letter should be in uppercase, the letters of the original string will always be in lowercase.

Example:

input: "holly"

missing letters: "a,b,c,d,e,f,g,i,j,k,m,n,p,q,r,s,t,u,v,w,x,z"

output: "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"

You don't need to validate input, the input string will always contain a certain amount of lowercase letters (min 1 / max 50).

insert_missing_letters("holly") == "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
insert_missing_letters("hello") == "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
insert_missing_letters("fred") == "fGHIJKLMNOPQSTUVWXYZrSTUVWXYZeGHIJKLMNOPQSTUVWXYZdGHIJKLMNOPQSTUVWXYZ"
=end

class MissingAlphabetMyFirstSolution < Minitest::Test

  def insert_missing_letters(string)
    missing_letters = define_missing_letters(string)
    string.chars.inject('') do |str, char|
      str.include?(char) ? str += char : str += add_letters(char, missing_letters)
    end  
  end

  def add_letters(char, missing_letters)
    next_letter = missing_letters.find { |letter| letter.ord > char.upcase.ord }
    return char if next_letter == missing_letters[-1]
    next_index = missing_letters.index(next_letter)
    char + missing_letters[next_index..-2].join
  end

  def define_missing_letters(string)
    final_ord = "Z".ord + 1
    missing_letters = ('A'..'Z').to_a + [final_ord.chr]
    unique_chars = string.chars.map(&:upcase).uniq
    unique_chars.each do |char|
      missing_letters.delete(char)
    end
    missing_letters
  end

  def test_1
    # skip
    expected = "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
    assert_equal(expected, insert_missing_letters("holly"))
  end

  def test_2
    # skip
    expected = "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("hello"))
  end

  def test_3
    # skip
    expected = "fGHIJKLMNOPQSTUVWXYZrSTUVWXYZeGHIJKLMNOPQSTUVWXYZdGHIJKLMNOPQSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("fred")) 
  end

  def test_4
    # skip
    expected = "eIJKLMNOPQRSTUVWXYZfIJKLMNOPQRSTUVWXYZgIJKLMNOPQRSTUVWXYZhIJKLMNOPQRSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("efgh"))
  end

  def test_5
    # skip
    expected = "abcdefghijklmnopqrstuvwxyz"
    assert_equal(expected, insert_missing_letters(expected))
  end

  def test_6
    # skip
    expected = "z"
    assert_equal(expected, insert_missing_letters("z"))
  end

  def test_7
    # skip
    input = "hellllllllllllooooo"
    expected = "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZllllllllllloPQRSTUVWXYZoooo"
    assert_equal(expected, insert_missing_letters(input))
  end

  def test_8
    # skip
    input = "xpixax"
    expected = "xYZpQRSTUVWYZiJKLMNOQRSTUVWYZxaBCDEFGHJKLMNOQRSTUVWYZx"
    assert_equal(expected, insert_missing_letters(input))
  end
  
  def test_9
    # skip
    input = "xpixax"
    expected = "xYZpQRSTUVWYZiJKLMNOQRSTUVWYZxaBCDEFGHJKLMNOQRSTUVWYZx"
    assert_equal(expected, insert_missing_letters(input))
  end

  def test_10
    # skip
    input = "exvalszvtvqfrvdcsasiishqtznlscnzpkjjykvuv"
    expected = "eGMOWxvWaBGMOWlMOWsWzvtWvqWfGMOWrWvdGMOWcGMOWsasiMOWishMOWqtznOWlscnzpWkMOWjMOWjykvuWv"
    assert_equal(expected, insert_missing_letters(input))
  end
  
end

class MissingAlphabetCatherineSolution < Minitest::Test

=begin
I: A string
  - continues alphabetic characters, guaranteed to be lower case
  - no digits
  - no spaces
  - can have duplicate letters any where in the string, not necessarily
    adjacent to one another
0: A string
  - After each letter insert all upper case letters in the string which
    do not have a lower case representation in the original string
  - unless the lower case letter has already appeared then just add the
    lower case letter to the resultant string
example:
  "hello" => "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
    - note upper case letters after "h" are missing captial "O" because of the "o" in "hello"
    - note "lo" because "l" has already appeared
AL:
  - declare a method which takes a string as an argument
  - convert the string into an array of chars arr_chars
  - declare an empty array which will hold the results of the new string creation new_arr
  - iterate through arr_chars
    - if the current char is in new_arr then new_arr << current char
    - else create a new array of upper case letters 'A' - 'Z'
    - get the index of the current letter upper cased in the 'A' - 'Z' array, advance the index by 1
      to get the starting index
    - now slice this 'A' - 'Z' array to the end
    - now for each letter in the upper cased array select a letter from the slice 'A' - 'Z' array if the array does
      not contain the current upcased letter
    - new_arr << current_char + sliced result
  - join new_arr 
=end

  def insert_missing_letters(string)
    str_chars = string.chars
    str_chars_upcase = str_chars.uniq.map(&:upcase)
    upper_case_arr = ('A'..'Z').to_a
    result = []
    str_chars.each do |char|
      if result.include?(char)
        result << char
        next
      end
      result << char
      upper_case_index_current_char = upper_case_arr.index(char.upcase)
      starting_index = upper_case_index_current_char + 1
      first_slice = upper_case_arr[starting_index..-1]
      missing_letters = first_slice.reject { |char| str_chars_upcase.include?(char) }
      missing_letters.each { |char| result << char }
    end
    result.join       
  end

  def test_1
    # skip
    expected = "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
    assert_equal(expected, insert_missing_letters("holly"))
  end

  def test_2
    # skip
    expected = "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("hello"))
  end

  def test_3
    # skip
    expected = "fGHIJKLMNOPQSTUVWXYZrSTUVWXYZeGHIJKLMNOPQSTUVWXYZdGHIJKLMNOPQSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("fred")) 
  end

  def test_4
    # skip
    expected = "eIJKLMNOPQRSTUVWXYZfIJKLMNOPQRSTUVWXYZgIJKLMNOPQRSTUVWXYZhIJKLMNOPQRSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("efgh"))
  end

  def test_5
    # skip
    expected = "abcdefghijklmnopqrstuvwxyz"
    assert_equal(expected, insert_missing_letters(expected))
  end

  def test_6
    # skip
    expected = "z"
    assert_equal(expected, insert_missing_letters("z"))
  end

  def test_7
    # skip
    input = "hellllllllllllooooo"
    expected = "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZllllllllllloPQRSTUVWXYZoooo"
    assert_equal(expected, insert_missing_letters(input))
  end

  def test_8
    # skip
    input = "xpixax"
    expected = "xYZpQRSTUVWYZiJKLMNOQRSTUVWYZxaBCDEFGHJKLMNOQRSTUVWYZx"
    assert_equal(expected, insert_missing_letters(input))
  end
  
  def test_9
    # skip
    input = "xpixax"
    expected = "xYZpQRSTUVWYZiJKLMNOQRSTUVWYZxaBCDEFGHJKLMNOQRSTUVWYZx"
    assert_equal(expected, insert_missing_letters(input))
  end

  def test_10
    # skip
    input = "exvalszvtvqfrvdcsasiishqtznlscnzpkjjykvuv"
    expected = "eGMOWxvWaBGMOWlMOWsWzvtWvqWfGMOWrWvdGMOWcGMOWsasiMOWishMOWqtznOWlscnzpWkMOWjMOWjykvuWv"
    assert_equal(expected, insert_missing_letters(input))
  end  
  
end

class MissingAlphabetRefactorCatherineSolution < Minitest::Test

=begin
I: A string
  - continues alphabetic characters, guaranteed to be lower case
  - no digits
  - no spaces
  - can have duplicate letters any where in the string, not necessarily
    adjacent to one another
0: A string
  - After each letter insert all upper case letters in the string which
    do not have a lower case representation in the original string
  - unless the lower case letter has already appeared then just add the
    lower case letter to the resultant string
example:
  "hello" => "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
    - note upper case letters after "h" are missing captial "O" because of the "o" in "hello"
    - note "lo" because "l" has already appeared
AL:
  - declare a method which takes a string as an argument
  - convert the string into an array of chars arr_chars
  - declare an empty array which will hold the results of the new string creation new_arr
  - iterate through arr_chars
    - if the current char is in new_arr then new_arr << current char
    - else create a new array of upper case letters 'A' - 'Z'
    - get the index of the current letter upper cased in the 'A' - 'Z' array, advance the index by 1
      to get the starting index
    - now slice this 'A' - 'Z' array to the end
    - now for each letter in the upper cased array select a letter from the slice 'A' - 'Z' array if the array does
      not contain the current upcased letter
    - new_arr << current_char + sliced result
  - join new_arr 
=end

  def insert_missing_letters(string)
    str_chars = string.chars
    str_chars_upcase = str_chars.uniq.map(&:upcase)
    upper_case_arr = ('A'..'Z').to_a
    result = ''
    str_chars.each do |char|
      if result.include?(char)
        result << char
        next
      end
      result << char
      start_idx = upper_case_arr.index(char.upcase) + 1
      sliced_uppercase = upper_case_arr[start_idx..-1]
      missing_letters = sliced_uppercase.reject { |char| str_chars_upcase.include?(char) }.join
      result << missing_letters
    end
    result      
  end

  def test_1
    # skip
    expected = "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
    assert_equal(expected, insert_missing_letters("holly"))
  end

  def test_2
    # skip
    expected = "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("hello"))
  end

  def test_3
    # skip
    expected = "fGHIJKLMNOPQSTUVWXYZrSTUVWXYZeGHIJKLMNOPQSTUVWXYZdGHIJKLMNOPQSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("fred")) 
  end

  def test_4
    # skip
    expected = "eIJKLMNOPQRSTUVWXYZfIJKLMNOPQRSTUVWXYZgIJKLMNOPQRSTUVWXYZhIJKLMNOPQRSTUVWXYZ"
    assert_equal(expected, insert_missing_letters("efgh"))
  end

  def test_5
    # skip
    expected = "abcdefghijklmnopqrstuvwxyz"
    assert_equal(expected, insert_missing_letters(expected))
  end

  def test_6
    # skip
    expected = "z"
    assert_equal(expected, insert_missing_letters("z"))
  end

  def test_7
    # skip
    input = "hellllllllllllooooo"
    expected = "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZllllllllllloPQRSTUVWXYZoooo"
    assert_equal(expected, insert_missing_letters(input))
  end

  def test_8
    # skip
    input = "xpixax"
    expected = "xYZpQRSTUVWYZiJKLMNOQRSTUVWYZxaBCDEFGHJKLMNOQRSTUVWYZx"
    assert_equal(expected, insert_missing_letters(input))
  end
  
  def test_9
    # skip
    input = "xpixax"
    expected = "xYZpQRSTUVWYZiJKLMNOQRSTUVWYZxaBCDEFGHJKLMNOQRSTUVWYZx"
    assert_equal(expected, insert_missing_letters(input))
  end

  def test_10
    # skip
    input = "exvalszvtvqfrvdcsasiishqtznlscnzpkjjykvuv"
    expected = "eGMOWxvWaBGMOWlMOWsWzvtWvqWfGMOWrWvdGMOWcGMOWsasiMOWishMOWqtznOWlscnzpWkMOWjMOWjykvuWv"
    assert_equal(expected, insert_missing_letters(input))
  end  
  
end