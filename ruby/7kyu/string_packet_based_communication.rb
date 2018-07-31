=begin
String Packed Based Communications

(Level 7 Kata)

We need you to implement a method of receiving commands over a network, processing the information and responding.

Our device will send a single packet to you containing data and an instruction which you must perform before returning your reply.

To keep things simple, we will be passing a single "packet" as a string. Each "byte" contained in the packet is represented by 4 chars.

One packet is structured as below:

Header  Instruction   Data1    Data2   Footer
------   ------       ------   ------  ------
 H1H1     0F12         0012     0008    F4F4
------   ------       ------   ------  ------

The string received in this case would be - "H1H10F1200120008F4F4"

Instruction: The calculation you should perform, always one of the below.
            0F12 = Addition
            B7A2 = Subtraction
            C3D9 = Multiplication
            FFFF = This instruction code should be used to identify your return value.
The Header and Footer are unique identifiers which you must use to form your reply.

Data1 and Data2 are the decimal representation of the data you should apply your instruction to. i.e 0109 = 109.

Your response must include the received header/footer, a "FFFF" instruction code, and the result of your calculation stored in Data1.

Data2 should be zero'd out to "0000".

To give a complete example:

If you receive message "H1H10F1200120008F4F4".
The correct response would be "H1H1FFFF00200000F4F4"
In the event that your calculation produces a negative result, the value returned should be "0000",
similarily if the value is above 9999 you should return "9999".

Goodluck, I look forward to reading your creative solutions!

AL:
  - break up the string via regex
  - use gsub and provide a block
    - based on the instruction perform the operation on data1 and data2
    - check if result <= 0 '0000' if result >= 9999 '9999'
    - concat header + result string + result + '0000' + footer
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class StringPacketBasedCommunicationMyFirstSolution < Minitest::Test

  def communication_module(packet)
    packet.gsub(/(?<head>\w{4})(?<opcode>\w{4})(?<data1>\w{4})(?<data2>\w{4})(?<foot>\w{4})/) do
      op_result, add, subtract, mult, result = 'FFFF', '0F12', 'B7A2', 'C3D9', 0
      case $~[:opcode]
      when add then result = $~[:data1].to_i + $~[:data2].to_i
      when subtract then result = $~[:data1].to_i - $~[:data2].to_i
      else result = $~[:data1].to_i * $~[:data2].to_i  
      end
      result = format_result(result)
      $~[:head] + op_result + result + '0000' + $~[:foot]    
    end
  end

  def format_result(result)
    return '0000' if result <= 0 
    return '9999' if result >= 9999
    result_size = 4
    str_length = result.to_s.size
    ('0' * (result_size - str_length) + result.to_s).slice(0, result_size)
  end

  def test_1
    # skip
    expected = "H1H1FFFF00200000F4F4"
    assert_equal(expected, communication_module("H1H10F1200120008F4F4"))
  end
  
  def test_2
    # skip
    expected = "X7X7FFFF00820000L0L0"
    assert_equal(expected, communication_module("X7X7B7A201400058L0L0"))
  end
  
  def test_3
    # skip
    expected = "R5R5FFFF00960000K4K4"
    assert_equal(expected, communication_module("R5R5C3D900120008K4K4"))
  end
  
end

class StringPacketBasedCommunicationMySecondSolution < Minitest::Test
=begin
prepend makes the result format much easier
=end


  def communication_module(packet)
    packet.gsub(/(?<head>\w{4})(?<opcode>\w{4})(?<data1>\w{4})(?<data2>\w{4})(?<foot>\w{4})/) do
      op_result, add, subtract, mult, result = 'FFFF', '0F12', 'B7A2', 'C3D9', 0
      case $~[:opcode]
      when add then result = $~[:data1].to_i + $~[:data2].to_i
      when subtract then result = $~[:data1].to_i - $~[:data2].to_i
      when mult then result = $~[:data1].to_i * $~[:data2].to_i  
      end
      result = format_result(result)
      $~[:head] + op_result + result + '0000' + $~[:foot]    
    end
  end

  def format_result(result)
    return '0000' if result <= 0 
    return '9999' if result >= 9999
    result_size = 4
    str_length = result.to_s.size
    result.to_s.prepend('0' * (result_size - str_length))
  end

  def test_1
    # skip
    expected = "H1H1FFFF00200000F4F4"
    assert_equal(expected, communication_module("H1H10F1200120008F4F4"))
  end
  
  def test_2
    # skip
    expected = "X7X7FFFF00820000L0L0"
    assert_equal(expected, communication_module("X7X7B7A201400058L0L0"))
  end
  
  def test_3
    # skip
    expected = "R5R5FFFF00960000K4K4"
    assert_equal(expected, communication_module("R5R5C3D900120008K4K4"))
  end
  
end