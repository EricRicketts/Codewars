=begin
Have the method division_stringified(num1, num2) take both parameters being passed,
divide num1 by num2, and return the result as a string with properly formatted commas.
If an answer is only 3 digits long, return the number with no commas.

For example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".

Note: 2 divided by 3 should return '1'

I: two integers
   - we cannot divide by zero so num2 != 0
   - always positive integers
0: a string
   - a properly formatted number meaning:
    - a comma inserted for each three digits if the
      resulting divide has > 3 digits
AL:
  - notice from the examples that the resulting number is rounded so the
  division needs to be (num1.to_f / num2).round
  - convert the resulting division to a string
  - reverse the string so I am working from back to front
  - use gsub to substitute every third digit with 3 digits + ","
  - reverse the result of gsub
=end
require 'pry'

def division_stringified(num1, num2)
  division = (num1.to_f / num2).round.to_s
  return division if division.length < 4
  result = division.reverse.gsub(/(\d{3})/, '\1,').reverse
  result[0] == "," ? result[1..-1] : result
end

# def division_stringified(num1, num2)
#   result = (num1.to_f / num2).round
#   new_str = ''
#   result.digits.each do |digit|
#     if new_str.gsub(',', '').length % 3 == 0 && new_str.length != 0
#       new_str << ',' << digit.to_s
#     else
#       new_str << digit.to_s
#     end
#   end
#   new_str.reverse
# end

p division_stringified(2, 3) == "1"
p division_stringified(5, 2) == "3"
p division_stringified(7, 3) == "2"
p division_stringified(6874, 67) == "103"
p division_stringified(503394930, 43) == "11,706,859"
p division_stringified(1, 10) == "0"
p division_stringified(100000, 1) == "100,000"


# def division_stringified(num1, num2)
#   formatted_num = (num1.to_f / num2).round.to_s
#   formatted_num.reverse.scan(/\d\d?\d?/).join(',').reverse
# end

# def division_stringified(num1, num2)
#   formatted_num = (num1.to_f / num2).round.to_s

#   num_arr = formatted_num.reverse.chars
#   (3...num_arr.size).step(4) { |idx| num_arr.insert(idx, ',') }
#   num_arr.reverse.join
# end