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

def sum_of_a_beach(beach)
  # your code here
end
=end